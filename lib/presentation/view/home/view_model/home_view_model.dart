import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rapid_chain/config/base/view_model/base_view_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {}
  @observable
  int PageIndex = 0;
  final List PageIcon = [
    {
      0: const Icon(
        Icons.stream,
        size: 28,
      )
    },
    {
      1: const Icon(
        Icons.leaderboard,
        size: 28,
      )
    },
    {
      2: const Icon(
        Icons.add,
        size: 28,
      )
    },
    {
      3: const Icon(
        Icons.people,
        size: 28,
      )
    },
    {
      4: const Icon(
        Icons.info,
        size: 28,
      )
    },
  ];
  @action
  void ChangePageIndex(int NewPageIndex) => PageIndex = NewPageIndex;
}
