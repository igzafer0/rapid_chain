// ignore_for_file: constant_identifier_names

enum SourcePath {
  BASE_URL,
  SEND_OTP,
  ME,
  LOGIN,
  REGISTER,
  RESET_PASSWORD,
  CHANGE_PASSWORD,
  REFRESH_TOKEN,
  VALIDATE_OTP,
  VALIDATE_WALLET,
  TASK_LIST,
  TASK,
  ACTIVE_CAMPAIGN,
  COLLECT_DAILY_POINT,
}

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://atalay.denizegece.com.tr",
      SourcePath.SEND_OTP => "/auth/sendregistermail",
      SourcePath.ME => "/user/me",
      SourcePath.LOGIN => "/auth/login",
      SourcePath.REGISTER => "/auth/register",
      SourcePath.REFRESH_TOKEN => "/auth/refresh",
      SourcePath.CHANGE_PASSWORD => "/auth/registser",
      SourcePath.RESET_PASSWORD => "/auth/register",
      SourcePath.VALIDATE_OTP => "/auth/validateotp",
      SourcePath.VALIDATE_WALLET => "/auth/validatewallet",
      SourcePath.TASK_LIST => "/task/activecampaingtask",
      SourcePath.TASK => "/task/activecampaingtask/${data?[0]}",
      SourcePath.ACTIVE_CAMPAIGN => "/campaing/activecampaing",
      SourcePath.COLLECT_DAILY_POINT => "/campaing/claimdailypoint",
    };
  }
}
