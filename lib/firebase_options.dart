// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBvLPhoOwNp1_HdxVbrwB6osoWsESN2H80',
    appId: '1:990777830077:web:53773d99049a586f2065d4',
    messagingSenderId: '990777830077',
    projectId: 'fir-auth-90c66',
    authDomain: 'fir-auth-90c66.firebaseapp.com',
    storageBucket: 'fir-auth-90c66.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnfG2TgR6La2U2Hrh1EoZx9JIHwPmhwZI',
    appId: '1:990777830077:android:ac1eae190da0b40c2065d4',
    messagingSenderId: '990777830077',
    projectId: 'fir-auth-90c66',
    storageBucket: 'fir-auth-90c66.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbZbDJDC70rrrYN1RztrTo4gtfLDpjcGM',
    appId: '1:990777830077:ios:a02ff7271536664d2065d4',
    messagingSenderId: '990777830077',
    projectId: 'fir-auth-90c66',
    storageBucket: 'fir-auth-90c66.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbZbDJDC70rrrYN1RztrTo4gtfLDpjcGM',
    appId: '1:990777830077:ios:a02ff7271536664d2065d4',
    messagingSenderId: '990777830077',
    projectId: 'fir-auth-90c66',
    storageBucket: 'fir-auth-90c66.appspot.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBvLPhoOwNp1_HdxVbrwB6osoWsESN2H80',
    appId: '1:990777830077:web:9b81bd0aaeca0d192065d4',
    messagingSenderId: '990777830077',
    projectId: 'fir-auth-90c66',
    authDomain: 'fir-auth-90c66.firebaseapp.com',
    storageBucket: 'fir-auth-90c66.appspot.com',
  );
}
