// ignore_for_file: constant_identifier_names

enum SourcePath {
  BASE_URL,
  SEND_OTP,
  LOGIN,
  REGISTER,
  RESET_PASSWORD,
  CHANGE_PASSWORD,
  REFRESH_TOKEN
}

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://atalay.denizegece.com.tr",
      SourcePath.SEND_OTP => "/auth/sendregistermail",
      SourcePath.LOGIN => "/auth/register",
      SourcePath.REGISTER => "/auth/register",
      SourcePath.REFRESH_TOKEN => "/auth/refresh",
      SourcePath.CHANGE_PASSWORD => "/auth/registser",
      SourcePath.RESET_PASSWORD => "/auth/register",
    };
  }
}
