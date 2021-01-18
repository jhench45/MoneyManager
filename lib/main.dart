import 'package:flutter/material.dart';
import 'package:moneymanager/locator.dart';
import 'package:moneymanager/ui/router.dart';
import 'package:moneymanager/ui/shared/app_colors.dart';
import 'package:moneymanager/ui/views/signuppage.dart';
import 'package:provider/provider.dart';
import 'models/authmodel.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthModel(),
        child: MaterialApp(
            title: 'Money Manager',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: backgroundColor,
              accentColor: Colors.green,
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            routes: {
              'SignUp': (context) => SignUpPage(),
            }));
    /*return MaterialApp(
        title: 'Money Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: backgroundColor,
          accentColor: Colors.green,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        routes: {
          'SignUp': (context) => SignUpPage(),
        });*/
  }
}
