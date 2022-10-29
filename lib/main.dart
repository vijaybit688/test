import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/provider/product_provider.dart';
import 'package:task_flutter/screens/auth/bashboard.dart';
import 'package:task_flutter/screens/auth/login_screen.dart';
import 'package:task_flutter/screens/home_screen.dart';
import 'package:task_flutter/screens/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider<ProductProvider>(
           create: (context) => ProductProvider()),
     ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          "/": (context) => LoginScreen(),
          '/dashboard':(context)=>DashBoardScreen(),
          "/home": (context) => HomeScreen(),
          "/setting": (context) => Setting()
        },

      ),
    );
  }
}
