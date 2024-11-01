import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
import 'package:rapid_chain/domain/entity/reference/my_reference_user_entity.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/injector.dart';
part 'reference_view_model.g.dart';

class ReferenceViewModel = _ReferenceViewModelBase with _$ReferenceViewModel;

abstract class _ReferenceViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    useCase = locator<UtilUseCase>();
    _myReferenceList();
  }

  late UtilUseCase useCase;
  @observable
  List<MyReferenceUserEntity>? userList;

  @action
  Future<void> _myReferenceList() async {
    var result = await useCase.myReferenceList();
    if (result.isRight) {
      userList = result.right;
    } else {
      debugPrint("test ${result.left.status}");
    }
  }
}
