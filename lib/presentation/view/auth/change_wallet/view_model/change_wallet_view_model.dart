import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
part 'change_wallet_view_model.g.dart';

class ChangeWalletViewModel = _ChangeWalletViewModelBase
    with _$ChangeWalletViewModel;

abstract class _ChangeWalletViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    useCase = locator<UtilUseCase>();
  }

  late UtilUseCase useCase;

  String newWallet = "";
  Future<void> changeWallet() async {
    var result = await useCase.changeWallet({"walletAddress": newWallet});

    if (result == null) {
      viewModelContext.pop();
      snackBar("Wallet Updated");
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
