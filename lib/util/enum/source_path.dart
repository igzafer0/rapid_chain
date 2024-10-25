// ignore_for_file: constant_identifier_names

enum SourcePath { BASE_URL, SEND_OTP }

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://atalay.denizegece.com.tr",
      SourcePath.SEND_OTP => "/auth/sendregistermail"
    };
  }
}
