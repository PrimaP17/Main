import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/HomeAxis.dart';
import 'package:tugas_uts/Tugas%20UTS_UAS/screen/loginPage.dart';
import 'Tugas UTS_UAS/screen/Profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_uts/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => PulsaProvider(),
      child: MyApp(),
    ),
  );
  ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.purple,
      ),
      home: LoginPage(),
      routes: {
        '/homeaxis': (context) => const Homeaxis(),
        '/profile': (context) => const MyProfile(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
