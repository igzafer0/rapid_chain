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

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surName,
        "email": email,
        "password": password,
        "walletAddress": walletAddress,
        "referrerReferenceCode":
            referrerReferenceCode.isEmpty ? null : referrerReferenceCode,
        "otpcode": otpCode,
        "username": userName
      };
}
