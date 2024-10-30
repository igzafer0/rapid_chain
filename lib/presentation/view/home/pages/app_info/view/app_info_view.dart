import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rapid_chain/config/base/view/base_view.dart';
import 'package:rapid_chain/presentation/view/home/pages/app_info/view_model/app_info_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppInfoView extends StatefulWidget {
  const AppInfoView({super.key});

  @override
  State<AppInfoView> createState() => _AppInfoViewState();
}

class _AppInfoViewState extends State<AppInfoView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppInfoViewModel>(
      viewModel: AppInfoViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AppInfoViewModel value) => Scaffold(
          body: SafeArea(
              bottom: false,
              child: Observer(builder: (context) {
                if (value.appInfoHtml.isEmpty) {
                  return const SizedBox.shrink();
                }
                return WebViewWidget(
                    controller: controller..loadHtmlString(value.appInfoHtml));
              }))),
    );
  }
}
