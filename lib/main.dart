import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_api/di/get_it.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  mainFunctions();
  runApp(const MyApp());
}

Future<void> mainFunctions() async {
  unawaited(init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeDataScrene(),
      ),
    );
  }
}
