// ignore_for_file: unused_import

import 'package:app_cliente_si2/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(  //es para el bloc
        //     providers: [

        //     ],
        //     child: MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   title: 'Flutter Demo',

        //   routes: getRoutes(),
        //    initialRoute: 'login',
        //     ),
        // );
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: getRoutes(),
      initialRoute: 'login',
      // initialRoute: 'home',
    );
  }
}
