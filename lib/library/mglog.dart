/*
  Version: 1.0.0
  Last Update: 21 Feb 2022
  
  class untuk mencatat log
  log disimpan per tanggal, pengiriman log hanya untuk 1 hari ini saja 
 
  cara pemakaian :
  cara 1 : sendLog
           langsung kirim setiap kali sendLog
           jika tidak terkirim, akan disimpan di local, dan terkirim ulang setiap kali sendLog dipanggil 
           (def 1 hari kebelakang)
           jika terkirim, akan hapus semua data log di local 
           contoh:
              MGLog("admin").sendLog('Trial from Apps');
  cara 2 : save, sendAll, clearAll 
           save untuk simpan log ke local
           sendAll untuk kirim data log local, default 1 hari saja
           clearAll untuk hapus semua data log di local -> jika tidak ingin data local terhapus, jangan dipanggil
           contoh:
              MGLog log = MGLog("admin");
              log.save('Trial from Apps');
              log.sendAll().then((success) {
                if (success) {
                  log.clearAll();
                }
              });

  gunakan 2 cara ini secara terpisah
*/

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart'; // dio: ^3.0.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // intl: ^0.15.0
import 'package:shared_preferences/shared_preferences.dart';
import 'color.dart';
import 'versioning.dart'; // shared_preferences: ^0.5.7+3
// import 'package:mailer/mailer.dart'; // mailer: ^3.3.0
// import 'package:mailer/smtp_server.dart'; // mailer: ^3.3.0

enum MGLogType {
  Database,
  Discord,
  // Email // belum bisa, dicoba dengan SMTP masih fail
}

class MGLog {
  String? projectName; // bedakan untuk tiap project
  String? version;
  String? id = "0"; // id, nama user / device
  MGLogType? logType;
  String? setDatabaseURL;
  String? getDatabaseURL;
  String? webHookURL;
  String? emailAddress;

  String? projectNameDef = "PHBID";
  MGLogType? logTypeDef = MGLogType.Database;
  // Dev
  String setDatabaseURLDef = 'http://47.74.214.215:82/mg-log/log/ceklog?';
  // param : kode=KDE2 & log=tes2 & versi=3 & device=laptop & tgl_log=2022-05-15 & note=gapapa
  String getDatabaseURLDef = 'http://47.74.214.215:82/mg-log/log/cekgetlog?';
  // param : kode=KDE2 & tgl_awal=2022-05-12 & tgl_akhir=2022-05-31
  String? webHookURLDef =
      'https://discord.com/api/webhooks/943699876951261204/drIDDI6zY81pR2EzqRl6wBU5G34cUe_TofqPasEGraGfSDrs5kVQ0MtBHQigBv39Ifuk'; // => Dev
  String? webHookURLDefDev =
      "https://discord.com/api/webhooks/968374033584373781/oZIc_SsjJ8uG4j0qeI4Z1fJQiBupZ2BcDzsyIjuDPC3lIbHQimpI2PeHB8_lhsvvXfb-";
  String? webHookURLDefRc =
      "https://discord.com/api/webhooks/968374203269140540/E6D20XIwE8g5jo2ArwKONlpnzTwdOdLtoX7vPgiJcWatJC3xliVpARmOaEanwvOHaMtl";
  String? webHookURLDefDemo =
      "https://discord.com/api/webhooks/968374284961611786/sCbydtcjkbtI__i-8zmOd1mNKTyfVcIwRFjVOPP7QDu6AYNVqeOaLMVNIqI5bz48zLUf";
  String? webHookURLDefLive =
      "https://discord.com/api/webhooks/968374363353120798/LMZNC5hiYNa2c1S_DCeNUGYShK9ku2Io6HnZL7WsFA4Vm8XnOJeccv28jD-UEm8tDAWb";
  String? emailAddressDef = 'mgelog@mgesolution.com';

  String? keySharedPreferences = 'MgeLog';
  final Duration _connectTimeOut =
      const Duration(milliseconds: 300000); // timeout connect ke server
  final Duration _sendTimeout =
      const Duration(milliseconds: 300000); // timeout send data ke server
  final Duration _receiveTimeOut =
      const Duration(milliseconds: 300000); // timeout receive data dari server

  late Dio dio;
  late FormData formData;
  late SharedPreferences pref;

  MGLog(String id,
      {this.projectName,
      this.version,
      this.logType,
      this.webHookURL,
      this.emailAddress,
      this.setDatabaseURL,
      this.getDatabaseURL}) {
    projectName = (projectName ?? "") != "" ? projectName : projectNameDef;
    version = (version ?? "") != "" ? version : Versioning().appVersion;
    id = id;
    logType = logType ?? logTypeDef;
    setDatabaseURL = setDatabaseURLDef;
    getDatabaseURL = getDatabaseURLDef;
    webHookURL = webHookURLDefRc;
    emailAddress = emailAddress ?? emailAddressDef;

    dio = Dio(BaseOptions(
        connectTimeout: _connectTimeOut,
        sendTimeout: _sendTimeout,
        receiveTimeout: _receiveTimeOut));
  }

  // kirim log langsung (unsendLog + log)
  // jika gagal, log + error tersimpan di local
  // jika berhasil, clear local
  void sendLog(String log) async {
    if (logType == MGLogType.Database) {
      String unsendLog = await _getUnsendLog();
      String formattedLog = _formatLog(id.toString(), log);
      Map<String, dynamic> param = {
        "kode": projectName.toString().toUpperCase(),
        "device": id.toString(),
        "versi": version,
        "tgl_log": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "log": "tes123"
      }; // unsendLog + formattedLog};

      bool result = false;
      _dioPost(setDatabaseURL ?? setDatabaseURLDef, param).then((response) {
        if (response != null) {
          Map<String, dynamic> json = jsonDecode(response.toString());
          if (json['status'].toString() == 'true') {
            result = true;
          }
        }
        if (!result) {
          _saveUnsendLog(formattedLog);
          _saveUnsendLog(
              _formatLog(id.toString(), "Error send log : " + response));
        } else {
          _clearLog();
        }
      });
    } else if (logType == MGLogType.Discord) {
      String unsendLog = await _getUnsendLog();
      String title = "PROJECT LOG: " +
          projectName.toString().toUpperCase() +
          " < " +
          version! +
          " >" +
          "\r\n";
      String formattedLog = "Id: " +
          id.toString() +
          ' ' +
          DateFormat("[yyyy-MM-dd HH:mm:ss]").format(DateTime.now()) +
          "\r\n" +
          log;
      // print('Debug: ' + 'title = ' + title.toString());
      // print('Debug: ' + 'unsendLog = ' + unsendLog.toString());
      // print('Debug: ' + 'formattedLog = ' + formattedLog.toString());
      _dioPost(webHookURL!, {"content": title + unsendLog + formattedLog})
          .then((response) {
        // print('Debug: ' + 'response = ' + response.toString());
        if (response != "") {
          _saveUnsendLog(formattedLog);
          _saveUnsendLog("Error send log : " + response);
        } else {
          _clearLog();
        }
      });
      // } else if (this.logType == MGLogType.Email) {
      //   String subject = "MGE Log " + projectName.toString();
      //   String body = "Sent by: " + id.toString() + "\r\n" +
      //                 "at [" + DateTime.now().toString() + "]" + "\r\n" +
      //                 log;
      //   _sendEmail(emailAddress, subject, body);
    }
  }

  // save + sendAll + clearAll
  // <save> simpan log dulu, <sendAll> kirimkan log, <clearAll> clear local

  void save(String log) async {
    if (logType == MGLogType.Discord) {
      String formattedLog = "Id: " +
          id.toString() +
          " " +
          DateFormat("[yyyy-MM-dd HH:mm:ss]").format(DateTime.now()) +
          "\r\n" +
          log;
      _saveUnsendLog(formattedLog);
      print('Debug: ' + 'save log ' + log.toString());
      // } else if (this.logType == MGLogType.Email) {
    }
  }

  Future<bool> sendAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (logType == MGLogType.Database) {
      String unsendLog = await _getUnsendLog();
      if (unsendLog == "") {
        unsendLog = _formatLog(id.toString(), 'No Data');
      }
      Map<String, dynamic> param = {
        "kode": projectName.toString().toUpperCase(),
        "device": prefs.getString("UserID") ?? "1",
        "versi": version,
        "tgl_log": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "log": unsendLog,
        "note": "gapapa"
      };
      log("KODE : " + projectName.toString().toUpperCase().toString());
      log("DEVICE : " + id.toString());
      log("VERSI : " + version.toString());
      log("TANGGAL LOG : " + DateFormat("yyyy-MM-dd").format(DateTime.now()));
      log("LOGNYA : " + unsendLog.toString());

      bool result = false;
      _dioPost(setDatabaseURL ?? setDatabaseURLDef, param).then((response) {
        log("RESPONSE LOG : $response");
        if (response != null) {
          Map<String, dynamic> json = jsonDecode(response.toString());
          if (json['status'].toString() == 'true') {
            result = true;
          }
        }
        if (!result) {
          _saveUnsendLog(
              _formatLog(id.toString(), "Error send l0og : " + response));
        } else {
          _clearLog();
        }
      });
    } else if (logType == MGLogType.Discord) {
      String unsendLog = await _getUnsendLog();
      String title = "PROJECT LOG: " +
          projectName.toString().toUpperCase() +
          " < " +
          version! +
          " >" +
          "\r\n";
      // print('Debug: ' + 'title = ' + title.toString());
      // print('Debug: ' + 'unsendLog = ' + unsendLog.toString());
      if (unsendLog == "") {
        unsendLog = 'No Data';
      }
      _dioPost(webHookURL!, {"content": title + unsendLog}).then((response) {
        // print('Debug: ' + 'response = ' + response.toString());
        if (response != "") {
          _saveUnsendLog("Error send log : " + response);
          return false;
        } else {
          return true;
        }
      });
      // } else if (this.logType == MGLogType.Email) {
    }
    return true;
  }

  void clearAll() async {
    if (logType == MGLogType.Database) {
      _clearLog();

      // } else if (this.logType == MGLogType.Email) {
    } else if (logType == MGLogType.Discord) {
      _clearLog();

      // } else if (this.logType == MGLogType.Email) {
    }
  }

  Future<String> _dioPost(String url, Map<String, dynamic> param) async {
    formData = FormData.fromMap(param);
    try {
      // print('Debug: ' + 'Post URL = ' + url );
      // print('Debug: ' + 'Param = ' + param.toString());
      Response response = await dio.post(url, data: formData);
      // print('Debug: ' + 'Response = ' + (response ?? "").toString());
      return response.toString();
    } on DioError catch (error) {
      // print('Debug: ' + 'Error = ' + error.message.toString());
      return error.toString();
    }
  }

  void _sendEmail(String emailAddress, String subject, String body) async {
    // String username = 'username@gmail.com';
    // String password = 'password';

    // final smtpServer = gmail(username, password);

    // final message = Message()
    // ..from = Address(username, 'Your Name')
    // ..recipients.add('destination@example.com')
    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
    // ..bccRecipients.add(Address('bccAddress@example.com'))
    // ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    // ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    // ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    // try {
    //   final sendReport = await send(message, smtpServer);
    //   print('Message sent: ' + sendReport.toString());
    // } on MailerException catch (e) {
    //   print('Message not sent.');
    //   for (var p in e.problems) {
    //     print('Problem: ${p.code}: ${p.msg}');
    //   }
    // }
  }

  // format message sesuai format log
  String _formatLog(String id, String message) {
    if (logType == MGLogType.Database) {
      return "Id: " +
          id.toString() +
          ' ' +
          DateFormat("[yyyy-MM-dd HH:mm:ss]").format(DateTime.now()) +
          ' ' +
          message;
    } else if (logType == MGLogType.Discord) {
      return "Id: " +
          id.toString() +
          ' ' +
          DateFormat("[yyyy-MM-dd HH:mm:ss]").format(DateTime.now()) +
          "\r\n" +
          message;

      // } else if (this.logType == MGLogType.Email) {
    } else {
      return '';
    }
  }

  Future<String> _getUnsendLog({int days = 1}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String dateKey = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String data =
        (prefs.getString(keySharedPreferences! + "_" + dateKey) ?? "");

    for (int i = 2; i <= days; i++) {
      dateKey = DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: i - 1)));
      String currData =
          prefs.getString(keySharedPreferences! + "_" + dateKey) ?? "";
      if (currData != "") {
        currData = "\r\n" + currData;
      }
      data = data + currData;
    }

    return data;
  }

  void _saveUnsendLog(String log, {DateTime? date}) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // .subtract(Duration(days: 2))
    String dateKey = DateFormat("yyyy-MM-dd").format(date ?? DateTime.now());
    var data = prefs.getString(keySharedPreferences! + "_" + dateKey) ?? "";
    if (data != "") {
      data = "\r\n" + data;
    }
    data = log + data;
    prefs.setString(keySharedPreferences! + "_" + dateKey, data);

    _clearOldLog(2);
  }

  void _clearLog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List list = prefs.getKeys().toList();

    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i].toString().length >= keySharedPreferences!.length) {
        if (list[i].toString().substring(0, keySharedPreferences!.length) ==
            keySharedPreferences) {
          prefs.remove(list[i]);
        }
      }
    }
  }

  // hapus semua log , kecuali 'days' hari terakhir
  void _clearOldLog(int days) async {
    List<String> listDate = [];
    String dateKey;

    for (int i = 1; i <= days; i++) {
      dateKey = DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: i - 1)));
      listDate.add(keySharedPreferences! + "_" + dateKey);
      // print('Debug: ' + 'listDate = ' + keySharedPreferences + "_" + dateKey);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    List list = prefs.getKeys().toList();
    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i].toString().length >= keySharedPreferences!.length) {
        if (list[i].toString().substring(0, keySharedPreferences!.length) ==
            keySharedPreferences) {
          if (!listDate.contains(list[i].toString())) {
            prefs.remove(list[i]);
            // print('Debug: ' + element.toString() + ' hapus');
          } else {
            // print('Debug: ' + element.toString() + ' tidak hapus');
          }
        }
      }
    }
  }

  Future<dynamic> showLogDialog({@required context}) {
    return showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(24),
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        title: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: const Text("Log File",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        actions: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width / 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.red)),
                  color: Colors.white,
                  child: const Text("CLEAR",
                      style: TextStyle(color: Colors.red, fontSize: 16)),
                  onPressed: () {
                    clearAll();
                    Navigator.of(context).pop(true);
                  },
                ),
                const SizedBox(width: 16),
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width / 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: primaryYellow)),
                  color: Colors.white,
                  child: Text("SHOW",
                      style: TextStyle(color: primaryYellow, fontSize: 16)),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    showLogContentDialog(context: context).then((value) {});
                  },
                ),
                const SizedBox(width: 16),
                MaterialButton(
                  minWidth: (MediaQuery.of(context).size.width / 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: primaryYellow)),
                  color: primaryYellow,
                  child: const Text("SEND",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  onPressed: () {
                    sendAll();
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showLogContentDialog({@required context}) async {
    String unsendLog = await _getUnsendLog(days: 1);
    String title = "PROJECT LOG: " + projectName.toString().toUpperCase();
    if (unsendLog == "") {
      unsendLog = 'No Data';
    }

    return showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(12),
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        title: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: const Text("Log File",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(height: 8),
                Text(unsendLog),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
