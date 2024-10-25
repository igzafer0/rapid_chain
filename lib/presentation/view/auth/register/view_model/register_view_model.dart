import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/data/dto/send/auth/register/register_dto.dart';
import 'package:rapid_chain/domain/usecase/auth/auth_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  late AuthUseCase authUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    authUseCase = locator<AuthUseCase>();
  }

  @observable
  int attempIndex = 0;

  String nickname = "";
  String name = "";
  String surname = "";
  String email = "";
  String verificationCode = "";
  String walletAddress = "";
  String password = "";

  @action
  void nextAttemp() {
    if (attempIndex == 0) {
      _sendOtp();
    } else if (attempIndex == 3) {
      _register();
    } else {
      attempIndex += 1;
    }
  }

  @action
  void backAttemp() {
    attempIndex -= 1;
  }

  Future<void> _register() async {
    var result = await authUseCase.register(RegisterDto(
      name: name,
      userName: nickname,
      surName: surname,
      email: email,
      walletAddress: walletAddress,
      referrerReferenceCode: "",
      otpCode: verificationCode,
      password: password,
    ));

    if (result == null) {
      viewModelContext.pushNamed(NavigationConstant.HOME);
    } else {
      if (result.errors?.isNotEmpty ?? false) {
        snackBar(result.errors!.entries.first.value.first);
      } else {
        snackBar(result.title ?? "");
      }
    }
  }

  Future<void> _sendOtp() async {
    var result = await authUseCase.sendOtp({"mail": email});
    if (result == null) {
      attempIndex += 1;
    } else {
      if (result.errors?.isNotEmpty ?? false) {
        snackBar(result.errors!.entries.first.value.first);
      } else {
        snackBar(result.title ?? "");
      }
    }
  }

  void snackBar(String message) {
    showSnackbar(ErrorSnackBarWidget(message: message)).show(viewModelContext);
  }
}
