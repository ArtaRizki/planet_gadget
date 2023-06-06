class EnvironmentConfig {
  // menentukan default jenis environment
  static const env = String.fromEnvironment('env', defaultValue: 'DEV');

// mainUrl() {
//   if (EnvironmentConfig.env == "DEV") {
//     return "<url development";
//   } else {
//     return "<url production>";
//   }
// }

// String loginURL() => mainUrl() + "/login";
}
