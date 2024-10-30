import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/entity/task/task_entity.dart';
import 'package:rapid_chain/domain/usecase/task/task_usecase.dart';
import 'package:rapid_chain/injector.dart';
import 'package:rapid_chain/presentation/widget/snackbar/error_snackbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
part 'code_view_model.g.dart';

class CodeViewModel = _CodeViewModelBase with _$CodeViewModel;

abstract class _CodeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  late TaskUseCase useCase;

  @override
  void init() {
    useCase = locator<TaskUseCase>();
    _taskList();
  }

  @observable
  List<TaskEntity> taskList = [];

  @action
  Future<void> _taskList() async {
    var result = await useCase.taskList();
    if (result.isRight) {
      taskList = result.right;
    }
  }

  Future<void> taskDetail(int taskId) async {
    if (!taskList.firstWhere((e) => e.id == taskId).collected) {
      var result = await useCase.taskDetail(taskId);
      if (result.isRight) {
        launchUrl(Uri.tryParse(result.right.url) ??
            Uri.parse("https://www.google.com"));
      }
    }
  }

  Future<void> collectCode(String code) async {
    var result = await useCase.collectCode(code);
    if (result != null) {
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
