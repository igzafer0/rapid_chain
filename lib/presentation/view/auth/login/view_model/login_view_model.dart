import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/data/dto/send/auth/login/login_dto.dart';
import 'package:rapid_chain/domain/usecase/auth/auth_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  String email = "mkutlu50@gmail.com";
  String password = "mY.100813";

  late AuthUseCase useCase;

  @override
  void init() {
    useCase = locator<AuthUseCase>();
  }

  Future<void> login() async {
    var result =
        await useCase.login(LoginDto(email: email, password: password));
    if (result == null) {
      viewModelContext.pushReplacementNamed(NavigationConstant.MAIN);
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
