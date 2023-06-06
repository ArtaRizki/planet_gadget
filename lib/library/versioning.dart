import 'dart:async';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

// class untuk pengecekan, antara versi apk saat ini, dengan versi apk yg terakhir terinstall
// supaya user tidak harus uninstall atau clear data setiap ada update apk

class Versioning {
  String appVersion = '1.0.0.1'; // version build : major.tahap.minor.build
  // android dan ios punya versi yg sama untuk memudahkan pengecekan
  bool showBanner = false; // tampilkan banner -> false jika build untuk release
  static const String prefLastVersion = 'lastVersion'; // key shared preference

  // fungsi yg dipanggil di main.dart
  checkVersion() async {
    // log("MASUK CEK VERSION");
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("app_version", appVersion);
    // log("VERSION : " + prefs.getString("app_version").toString());
    if (prefs.getString("app_version") == null ||
        appVersion != prefs.getString("app_version")) {
      prefs.setString("app_version", appVersion);
    }

    String currVersion = appVersion;
    String lastVersion = prefs.getString(prefLastVersion) ?? "1.0.0.0";

    List<String> curr = currVersion.split(".");
    List<String> last = lastVersion.split(".");

    bool isNewer = false; // true jika apk sekarang lebih baru dari apk lama
    bool isOlder = false; // true jika apk sekarang lebih lama dari apk lama

    if (currVersion != lastVersion) {
      // jika versi tidak sama
      if (last.length != 4) {
        // jika sebelumnya belum pernah terinstall
        isNewer = true;
      } else {
        // jika versi baru lebih tinggi
        if (((int.tryParse(last[0]) ?? 0) < (int.tryParse(curr[0]) ?? 0)) ||
            (((int.tryParse(last[0]) ?? 0) == (int.tryParse(curr[0]) ?? 0)) &&
                ((int.tryParse(last[1]) ?? 0) <
                    (int.tryParse(curr[1]) ?? 0))) ||
            (((int.tryParse(last[0]) ?? 0) == (int.tryParse(curr[0]) ?? 0)) &&
                ((int.tryParse(last[1]) ?? 0) ==
                    (int.tryParse(curr[1]) ?? 0)) &&
                ((int.tryParse(last[2]) ?? 0) <
                    (int.tryParse(curr[2]) ?? 0))) ||
            (((int.tryParse(last[0]) ?? 0) == (int.tryParse(curr[0]) ?? 0)) &&
                ((int.tryParse(last[1]) ?? 0) ==
                    (int.tryParse(curr[1]) ?? 0)) &&
                ((int.tryParse(last[2]) ?? 0) ==
                    (int.tryParse(curr[2]) ?? 0)) &&
                ((int.tryParse(last[3]) ?? 0) <
                    (int.tryParse(curr[3]) ?? 0)))) {
          isNewer = true;
        } else {
          // jika versi baru lebih rendah
          isOlder = true;
        }
      }
    }

    //showAllSharedPreference();

    if (isNewer) {
      // log("Debug: Upgrade Version");
      upgradeVersion(lastVersion, currVersion)
          .then((value) => prefs.setString(prefLastVersion, currVersion));
    } else if (isOlder) {
      // log("Debug: Downgrade Version");
      downgradeVersion(lastVersion, currVersion)
          .then((value) => prefs.setString(prefLastVersion, currVersion));
    } else {
      // log("Debug: " "Same Version");
    }
  }

  // apa yg harus dilakukan jika versi naik
  Future<void> upgradeVersion(String _from, String _to) async {
    // final prefs = await SharedPreferences.getInstance();

    // log out jika beda versi
    // Contoh :
    // prefs.setString(global.prefUserId, "");
    // prefs.setBool(global.prefIsLogin, false);
    // prefs.setString(global.prefUserVendorActive, "{}");

    //
  }

  // apa yg harus dilakukan jika versi turun
  Future<void> downgradeVersion(String _from, String _to) async {
    // final prefs = await SharedPreferences.getInstance();

    // log out jika beda versi
    // Contoh :
    // prefs.setString(global.prefUserId, "");
    // prefs.setBool(global.prefIsLogin, false);
    // prefs.setString(global.prefUserVendorActive, "{}");

    //
  }

  // print all shared preference
  // untuk pengecekan data shared preference yg tersimpan untuk project
  showAllSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    Set<String> list = prefs.getKeys();
    log('Debug: ' 'SharedPreferences : ');
    // log('Debug: ' +
    //     '    userId -> ' +
    //     (prefs.get(global.prefUserId) ?? "").toString());
    // log('Debug: ' +
    //     '    isLogin -> ' +
    //     (prefs.get(global.prefIsLogin) ?? "").toString());

    String content;
    for (String element in list) {
      content = "";
      try {
        content = (prefs.get(element.toString()) ?? "").toString();
      } catch (err) {
        content = "";
      }
      log('Debug: ' '    ' + (element.toString()) + ' = ' + (content));
    }
  }
}
