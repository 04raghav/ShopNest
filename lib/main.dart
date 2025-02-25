import 'package:amazon_clone1/Common/bottom_bar.dart';
import 'package:amazon_clone1/constants/global_variables.dart';
import 'package:amazon_clone1/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone1/features/auth/services/auth_services.dart';
import 'package:amazon_clone1/features/home/screens/home_screen.dart';
import 'package:amazon_clone1/providers/user_provider.dart';
import 'package:amazon_clone1/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authservice = AuthServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authservice.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Amazon",
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
            )),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const HomeScreen()
            : const AuthScreen());
  }
}
