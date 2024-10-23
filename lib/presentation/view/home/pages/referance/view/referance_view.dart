import 'package:flutter/material.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/referance/view_model/referance_view_model.dart';

class ReferanceView extends StatelessWidget {
  const ReferanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ReferanceViewModel>(
      viewModel: ReferanceViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ReferanceViewModel value) =>
          Scaffold(),
    );
  }
}
