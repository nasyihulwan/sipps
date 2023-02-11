import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipps/common/widgets/bottom_bar.dart';
import 'package:sipps/constants/global_variables.dart';
import 'package:sipps/features/auth/services/auth_service.dart';
import 'package:sipps/features/home/screens/home_screen.dart';
import 'package:sipps/providers/user_provider.dart';
import 'package:sipps/router.dart';
import 'package:sipps/features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPPS',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const AuthScreen()
          : const BottomBar(),
    );
  }
}
