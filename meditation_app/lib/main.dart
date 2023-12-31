import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/home.dart';
import 'package:meditation_app/pages/profilepage.dart';
import 'package:meditation_app/pages/signin.dart';
import 'package:meditation_app/pages/signup.dart';
import 'package:meditation_app/pages/tipspage.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: "/",
      name: "signin",
      builder: (context, state) => SigninPage(),
    ),
    GoRoute(
      path: "/signup",
      name: 'signup',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: "/home",
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: "/profile",
      name: 'profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: "/tips",
      name: 'tips',
      builder: (context, state) => TipsPage(),
    ),
  ]);
}
