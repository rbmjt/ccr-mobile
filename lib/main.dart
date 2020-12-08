import 'package:ccrwork_mobile/navigationservice.dart';
import 'package:ccrwork_mobile/routing.dart';
import 'package:ccrwork_mobile/servicelocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_helper.dart';
import 'bootstrapper.dart';
import 'package:ccrwork_mobile/screens/menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BootStrapper.initializeDIs();
  await Firebase.initializeApp();
  await Auth.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: Menu(),
       navigatorKey: locator<NavigationService>().navigatorKey,
       onGenerateRoute: generateRoute,
       initialRoute: 'menu',
    );
  }
}
