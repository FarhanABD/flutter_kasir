import 'package:flutter/material.dart';
import 'package:flutter_kasir/core/dependency-injection/dependency.dart';
import 'package:flutter_kasir/core/widget/loading_app_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id', null);
  initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.red),
      home: Scaffold(body: LoadingAppWidget()),
    );
  }
}
