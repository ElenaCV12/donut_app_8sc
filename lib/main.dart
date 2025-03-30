import 'package:donut_app_8sc/auth/login_screen.dart';
import 'package:donut_app_8sc/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donut_app_8sc/tabs/donut_tab.dart';
import 'package:donut_app_8sc/tabs/burger_tab.dart';
import 'package:donut_app_8sc/tabs/smoothie_tab.dart';
import 'package:donut_app_8sc/tabs/pancakes_tab.dart';
import 'package:donut_app_8sc/tabs/pizza_tab.dart';
import 'package:donut_app_8sc/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DonutTab()),
        ChangeNotifierProvider(create: (context) => BurgerTab()),
        ChangeNotifierProvider(create: (context) => SmoothieTab()),
        ChangeNotifierProvider(create: (context) => PancakesTab()),
        ChangeNotifierProvider(create: (context) => PizzaTab()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({super.key});

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Verificar si hay un usuario autenticado
    User? currentUser = FirebaseAuth.instance.currentUser;
    
    // Verificar también en SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    setState(() {
      // El usuario está autenticado si hay un usuario actual en Firebase
      // O si isLoggedIn es true en SharedPreferences
      _isLoggedIn = currentUser != null || isLoggedIn;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Muestra un indicador de carga mientras se verifica el estado
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Redirige a la pantalla apropiada según el estado de autenticación
    if (_isLoggedIn) {
      return HomePage();
    } else {
      return LoginScreen();
    }
  }
}