import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
part 'forget_password_view_model.g.dart';

class ForgetPasswordViewModel = _ForgetPasswordViewModelBase
    with _$ForgetPasswordViewModel;

abstract class _ForgetPasswordViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    useCase = locator<UtilUseCase>();
  }

  late UtilUseCase useCase;
  String mailAddress = "";

  Future<void> sendMail() async {
    var result = await useCase.forgotPassword({"email": mailAddress});

    if (result == null) {
      viewModelContext.pop();
      snackBar("Mail Sent!");
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
