import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slider_app_flutter/cubit/app_cubit_logics.dart';
import 'package:slider_app_flutter/cubit/app_cubits.dart';
import 'package:slider_app_flutter/pages/detail_page.dart';
import 'package:slider_app_flutter/pages/home_page.dart';
import 'package:slider_app_flutter/pages/navpages/main_page.dart';
import 'package:slider_app_flutter/pages/services/data_services.dart';
import 'package:slider_app_flutter/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) {
          return AppCubits(
            data: DataServices(),
          );
        },
        child: AppCubitLogics(),
      ),
    );
  }
}
