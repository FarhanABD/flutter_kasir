import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kasir/core/dependency-injection/dependency.dart';
import 'package:flutter_kasir/core/helper/dialog_helper.dart';
import 'package:flutter_kasir/core/provider/app_provider.dart';
import 'package:flutter_kasir/core/widget/error_app_widget.dart';
import 'package:flutter_kasir/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({Key? key, this.param1, this.param2}) : super(key: key);
  final P1? param1;
  final P2? param2;
  T notifier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => sl(param1: param1, param2: param2),
      builder: (context, child) => build(context),
    );
  }

  Widget _build(BuildContext context) {
    notifier = Provider.of<T>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (notifier.snackBarMessage.isNotEmpty) {
        DialogHelper.showSnackBar(
          context: context,
          text: notifier.snackBarMessage,
        );
        notifier.snackBarMessage = '';
      }
      checkVariable(context);
    });
    return Scaffold(
      appBar: appBarBuild(context),
      body: (notifier.isLoading == true)
          ? LoadingAppWidget()
          : (notifier.errorMessage.isNotEmpty)
          ? ErrorAppWidget(
              description: notifier.errorMessage,
              onPressButton: () {
                notifier.errorMessage = '';
                notifier.init();
              },
            )
          : bodyBuild(context),
      floatingActionButton: floatingActionButtonBuild(context),
      drawer: drawerBuild(context),
    );
  }

  checkVariable(BuildContext context) {}

  AppBar? appBarBuild(BuildContext context) {
    return null;
  }

  Widget bodyBuild(BuildContext context);
  Widget? floatingActionButtonBuild(BuildContext context) {
    return null;
  }

  Widget? drawerBuild(BuildContext context) {
    return null;
  }
}
