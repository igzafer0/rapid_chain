class RegisterDto {
  String password;
  String name;
  String surName;
  String userName;
  String email;
  String walletAddress;
  String referrerReferenceCode;
  String otpCode;

  RegisterDto({
    required this.name,
    required this.userName,
    required this.surName,
    required this.email,
    required this.walletAddress,
    required this.referrerReferenceCode,
    required this.otpCode,
    required this.password,
  });
}
