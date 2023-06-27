import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:planet_gadget/main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get_x;

// class pengganti Dio / APIService
// untuk Tisco baru dipakai untuk menambahkan security (Code)
// + alert dialog saat koneksi gagal
// + simpan data di lokal untuk mempercepat loading
class DioClient<T> {
  late Connectivity connectivity;
  late Function onConnected; // yg dilakukan saat koneksi kembali diperoleh

  late Timer _timer;
  int _timerTick = 0;
  final int _timeout = 10;
  // dalam detik, waktu tunggu sebelum melakukan cek ulang koneksi,
  // jika tidak ada trigger untuk pengecekan ulang koneksi

  final int _connectTimeOut = 60000; // timeout connect ke server
  final int _sendTimeout = 60000; // timeout send data ke server
  final int _receiveTimeOut = 60000; // timeout receive data dari server

  bool _hasConectivity = true;
  bool _isDialogOpen = false;
  BaseOptions baseOptions = BaseOptions(
      baseUrl: kReleaseMode
          ? "http://www.planetgadget.store/rest/V1/api"
          : "http://www.planetgadget.store/rest/V1/api",
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000));
  DioClient() {
    connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((result) async {
      _doOnConectivityChange(result);
    });
  }

  // request API (POST) tanpa simpan data di lokal -> sementara dipakai untuk update security
  Future<Response?> requestPost({
    required String url,
    required Map<String, dynamic> param,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Options? options,
    FormData? formData,
    bool? isJson,
  }) async {
    param = param;

    Response? response;

    try {
      response = await _dioPost(
        url,
        param,
        showError: true,
        timeOut: _connectTimeOut,
        onSendProgress: onSendProgress ?? (p0, p1) {},
        onReceiveProgress: onReceiveProgress ?? (p0, p1) {},
        formDataa: formData,
        options: options,
        isJson: isJson,
      );
      return response;
    } catch (error) {
      return null;
    }
  }

  // request API (GET) tanpa simpan data di lokal -> sementara dipakai untuk update security
  Future<Response?> requestGet(
      {required String url, required Map<String, dynamic> param}) async {
    // request data ke server
    param = param;
    try {
      var response =
          await _dioGet(url, param, showError: false, timeOut: _connectTimeOut);
      // log("RESPONSE : ${response!.data}");
      return response;
    } catch (error) {}
    return null;
  }

  // request API tanpa simpan data di lokal -> dengan pengecekan koneksi
  // sementara tidak dipakai, karena untuk Tisco belum ada fitur pengecekan koneksi
  Future<Response?> _request(
      {required String url,
      required Map<String, dynamic> param,
      required Function onGetData,
      bool showError = true,
      int timeOut = 30000}) async {
    // request data ke server

    bool connAvail = await _checkConnectionAvailable();

    if (!connAvail) {
      if (!_isDialogOpen) {
        _messageDialog(
          title: 'Koneksi Terputus',
          content: "Silakan periksa kembali jaringan internet anda.",
          detail: 'No Connection Available',
          showError: showError,
        );
      }
      return null;
    } else {
      Function onChanged = onGetData;
      param = param;

      try {
        var result = await _dioPost(url, param,
            showError: showError,
            timeOut: timeOut,
            onReceiveProgress: (int count, int total) {},
            onSendProgress: (int count, int total) {});
        if ((result ?? []) != []) {
          onChanged(result!.data);
          return result;
        }
      } catch (error) {
        return null;
      }
    }
  }

  // fungsi request data ke server dengan Dio
  Future<Response?> _dioPost(
    String url,
    Map<String, dynamic> param, {
    bool showError = true,
    int timeOut = 30000,
    required ProgressCallback onSendProgress,
    required ProgressCallback onReceiveProgress,
    Options? options,
    FormData? formDataa,
    bool? isJson,
  }) async {
    String uniqueCode = DateTime.now().toString();
    String paramStr = "";

    try {
      // create param
      param.forEach((key, value) {
        paramStr += ("$key=${Uri.encodeComponent(value.toString())}&");
      });

      printLog('DioConn', 'Url = $url $uniqueCode');
      // log('Execute Formatted = ' + url + "?" + paramStr);

      // init dio
      FormData formData;
      if (formDataa != null) {
        formData = formDataa;
      } else {
        formData = FormData.fromMap(param);
      }

      Dio dio = Dio(baseOptions);
      dio.interceptors.add(
        PrettyDioLogger(
          request: true, //true,
          requestHeader: false,
          requestBody: true,
          responseHeader: false,
          responseBody: false, //true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );

      DateTime start = DateTime.now();
      bool firstReceive = true;
      Duration receiveDuration;

      // post dio
      Response response = await dio.post(url,
          data: isJson == true ? jsonEncode(param) : formData,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
          options: options);
      printLog('DioConn ║ Response ', 'Url = $url');
      Logger().d(jsonDecode(response.toString()));

      try {
        Map<String, dynamic> json = jsonDecode(response.toString());
        if (json.toString() != "[]") {
          if (json["status_code"].toString().toUpperCase() ==
              "false".toUpperCase()) {}
        }
      } catch (e) {
        return null;
      }
      return response;
    } on DioError catch (e) {
      String log = "Error : " +
          '\r\n' +
          url +
          ' ' +
          (param).toString() +
          '\r\n' +
          e.type.toString() +
          ' ' +
          e.error.toString();
      _savetoLog(log);

      if (DioErrorType.connectionTimeout == e.type ||
          DioErrorType.receiveTimeout == e.type ||
          DioErrorType.sendTimeout == e.type ||
          DioErrorType.unknown == e.type) {
        if (!_isDialogOpen) {
          _messageDialog(
            title: 'Koneksi bermasalah',
            content: "Silakan periksa kembali jaringan internet anda.",
            detail: e.message,
            showError: showError,
          );
          _isDialogOpen = false;
        }
      }

      return null;
    }
  }

  // fungsi get data ke server dengan Dio, digunakan untuk Map Google
  Future<Response?> _dioGet(String url, Map<String, dynamic> param,
      {bool showError = true, int timeOut = 30000}) async {
    String paramStr = "";

    try {
      // create param
      param.forEach((key, value) {
        paramStr += ("$key=${Uri.encodeComponent(value.toString())}&");
      });

      printLog('DioConn', 'Url = $url');
      // init dio
      Dio dio = Dio(baseOptions);
      dio.interceptors.add(
        PrettyDioLogger(
          request: true, //true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true, //true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );

      DateTime start = DateTime.now();

      // post dio
      Response response =
          await dio.get(url, queryParameters: param); // json.decode(paramStr));
      // Logger().d(jsonDecode(response.toString()));
      // Logger().d(response.data);

      // if (response.toString() != "") {
      //   Map<String, dynamic> json = jsonDecode(response.toString());
      //   if (json.toString() != "[]") {
      //     if (json["status_code"].toString().toUpperCase() ==
      //         "false".toUpperCase()) {}
      //   }
      // }

      printLog(
          'DioConn ║ Time', 'Url = $url / ${DateTime.now().difference(start)}');
      return response;
    } on DioError catch (e) {
      String log = "Error : " +
          '\r\n' +
          url +
          ' ' +
          param.toString() +
          '\r\n' +
          e.type.toString() +
          ' ' +
          e.error.toString();
      _savetoLog(log);

      if (DioErrorType.connectionTimeout == e.type ||
          DioErrorType.receiveTimeout == e.type ||
          DioErrorType.sendTimeout == e.type ||
          DioErrorType.unknown == e.type) {
        if (!_isDialogOpen) {
          _messageDialog(
            title: 'Koneksi bermasalah',
            content: "Silakan periksa kembali jaringan internet anda.",
            detail: e.message,
            showError: showError,
          );
          _isDialogOpen = false;
        }
      }
      return null;
    }
  }

  // cek koneksi yg tersedia pada device
  Future<bool> _checkConnectionAvailable() async {
    var connectivityResult = await (connectivity.checkConnectivity());
    return ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi));
  }

  // alert dialog yg tampil jika tidak ada koneksi (device + respon server)
  void _messageDialog(
      {String? title, String? content, String? detail, bool? showError}) async {
    if (showError == true) {
      printLog('DioConn', 'Connection error. ${title!} ${content!} ${detail!}');

      _isDialogOpen = true;
      _hasConectivity = false;

      bool doConnect = await _checkConnectionAvailable();
      if (doConnect) {
        log('Start timer auto connection');
        // _startTimer();
      }

      messageDialog(
        context: navigatorKey.currentContext,
        title: title,
        content: content,
      ).then((value) async {
        log('Cancel timer (Manual)');
        // _cancelTimer();

        _hasConectivity = true;
        _isDialogOpen = false;
        while (get_x.Get.isDialogOpen == true) {
          get_x.Get.back();
        }

        printLog('DioConn', 'Connected (Manual)');
        if (onConnected() != null) {
          onConnected();
        }
      });
      _isDialogOpen = false;
    }
  }

  // fungsi yg dilakukan saat ada perubahan status koneksi pada device
  Future<void> _doOnConectivityChange(ConnectivityResult result) async {
    if (!_hasConectivity) {
      bool doConnect = ((result == ConnectivityResult.mobile) ||
          (result == ConnectivityResult.wifi));

      if (doConnect) {
        log('Cancel timer (onConnectivityChanged)');
        // _cancelTimer();
      }

      bool doLoop = true;
      while (doConnect & doLoop) {
        doConnect = await _checkConnectionAvailable();
      }
    }
  }

  void _startTimer() {
    // _cancelTimer();

    const oneSec = Duration(seconds: 1);
    _timerTick = _timeout;

    _timer = Timer.periodic(oneSec, (Timer timer) async {
      if (_timerTick < 1) {
        // _timer.cancel();

        if (!_hasConectivity) {
          bool doConnect = await _checkConnectionAvailable();

          // if (doConnect) {
          //   doConnect = await _ping();
          //   if (doConnect) {
          //     _hasConectivity = true;

          //     printLog('DioConn', 'Connected (Auto - onTimer)');
          //     while (get_x.Get.isBottomSheetOpen) {
          //       get_x.Get.back();
          //     }
          //     if (onConnected() != null) {
          //       onConnected();
          //     }
          //   }
          // }
        }

        if (!_hasConectivity) {
          bool doConnect = await _checkConnectionAvailable();
          if (doConnect) {
            log('Restart timer');
            // _startTimer();
          }
        }
      } else {
        _timerTick = _timerTick - 1;
        log('Timer : $_timerTick');
      }
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  _savetoLog(String logg) async {
    log('Debug: ' + 'Log = ' + logg);
    String id = "";
    // if (user == 0) {
    //   // saat login
    // } else {
    //   String jenisMember = (user["JenisMember"] ?? "0").toString();
    //   String isUserInternal = (user['SalesInternal'] ?? "0").toString();
    //   bool isGuest = (jenisMember == "0") && (isUserInternal == "0");
    //   if (isGuest) {
    //     id = "Guest" + " (" + user['ID'].toString() + ") ";
    //   } else if (isUserInternal != "0") {
    //     id = "User Internal " +
    //         (user['Username'] ?? "-") +
    //         " (" +
    //         user['ID'].toString() +
    //         ") ";
    //   } else {
    //     id = "User " +
    //         jenisMember.toString() +
    //         " " +
    //         (user['Username'] ?? "-") +
    //         " (" +
    //         user['ID'].toString() +
    //         ") ";
    //   }
    // }
    // MGLog(id).save(log);
  }

  Future<dynamic> messageDialog(
      {required context, required String title, required String content}) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Text(title),
            content: Text(content),
            actions: const []);
      },
    );
  }

  printLog(String _title, String _message) {
    log('╔ $_title ══════════');
    log('║ $_message');
    log('╚══════════════════════════════════════════════════════════════════════════════════════════');
  }
}

// class dari Alert Dialog No Connection
class MyBottomSheet extends StatefulWidget {
  final String title;
  final String content;
  final String detail;

  const MyBottomSheet(this.title, this.content, this.detail, {Key? key})
      : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool showDetail = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      return Container(
          height: showDetail ? 328 : 248,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/FineAps - No internet connection.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(widget.content,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                        showDetail ? const SizedBox(height: 8) : Container(),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: showDetail
                              ? Text(widget.detail,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis)
                              : Container(),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  MaterialButton(
                    color: Colors.transparent,
                    child: Image.asset(showDetail
                        ? "assets/image/Close Detail.png"
                        : "assets/image/Open Detail.png"),
                    onPressed: () {
                      updated(state);
                    },
                  )
                ],
              )));
    });
  }

  Future<Null> updated(StateSetter updateState) async {
    updateState(() => showDetail = !showDetail);
  }
}
