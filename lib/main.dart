import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopnest/Common/bottom_bar.dart';
import 'package:shopnest/constants/global_variables.dart';
import 'package:shopnest/features/admin/screens/admin_screen.dart';
import 'package:shopnest/features/auth/screens/auth_screen.dart';
import 'package:shopnest/features/auth/services/auth_services.dart';
import 'package:shopnest/providers/user_provider.dart';
import 'package:shopnest/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await authservice.getUserData(context: context);
      } catch (e, st) {
        debugPrint('getUserData error: $e\n$st');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amazon",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: userProvider.user.token.isEmpty
          ? const AuthScreen()
          : userProvider.user.type == 'user'
              ? const BottomBar()
              : const AdminScreen(),
    );
  }
}
