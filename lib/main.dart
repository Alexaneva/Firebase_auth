import 'package:firebase_auth_newsApp/model/post_model.dart';
import 'package:firebase_auth_newsApp/pages/widgets/status_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';
import 'firebase_options.dart';
import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => UserModel()),
        Provider(create: (context) => Post()),
        ChangeNotifierProvider(create: (context) => StatusBar()),
      ],
      child: MaterialApp.router(
        routerConfig: MyAppRouts().route,
      ),
    );
  }
}
