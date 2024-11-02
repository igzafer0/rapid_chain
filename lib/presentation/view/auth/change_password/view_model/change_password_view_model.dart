import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
part 'change_password_view_model.g.dart';

class ChangePasswordViewModel = _ChangePasswordViewModelBase
    with _$ChangePasswordViewModel;

abstract class _ChangePasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  late UtilUseCase useCase;
  @override
  void init() {
    useCase = locator<UtilUseCase>();
  }

  String oldPassword = "";
  String newPassword = "";
  Future<void> changePassword() async {
    var result = await useCase.changePassword({
      "password": oldPassword,
      "newPassword": newPassword,
    });

    if (result == null) {
      viewModelContext.pop();
      snackBar("Password Updated");
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