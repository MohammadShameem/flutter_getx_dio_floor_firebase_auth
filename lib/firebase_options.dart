// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = (
    apiKey: 'AIzaSyDKGWFcfo4Rk8G-nwDsQp_VKYxZwFirebaseOptionscA3Ko4',
    appId: '1:938389649423:web:147df59bd32816b7678b7a',
    messagingSenderId: '938389649423',
    projectId: 'lateral-command-257315',
    authDomain: 'lateral-command-257315.firebaseapp.com',
    databaseURL: 'https://lateral-command-257315.firebaseio.com',
    storageBucket: 'lateral-command-257315.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjlqZLxH-Lrthpgws88FQrBVbo0aSNlnI',
    appId: '1:938389649423:android:020cd1823b4a973a678b7a',
    messagingSenderId: '938389649423',
    projectId: 'lateral-command-257315',
    databaseURL: 'https://lateral-command-257315.firebaseio.com',
    storageBucket: 'lateral-command-257315.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvlDPh-S1s_G58kY7rwzr56bMZzwo45Nc',
    appId: '1:938389649423:ios:d12c6569a373a2c8678b7a',
    messagingSenderId: '938389649423',
    projectId: 'lateral-command-257315',
    databaseURL: 'https://lateral-command-257315.firebaseio.com',
    storageBucket: 'lateral-command-257315.appspot.com',
    iosClientId: '938389649423-h8136sovd8f00s8aso190jg98ln5h981.apps.googleusercontent.com',
    iosBundleId: 'com.bjit.flutter.nearme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvlDPh-S1s_G58kY7rwzr56bMZzwo45Nc',
    appId: '1:938389649423:ios:d12c6569a373a2c8678b7a',
    messagingSenderId: '938389649423',
    projectId: 'lateral-command-257315',
    databaseURL: 'https://lateral-command-257315.firebaseio.com',
    storageBucket: 'lateral-command-257315.appspot.com',
    iosClientId: '938389649423-h8136sovd8f00s8aso190jg98ln5h981.apps.googleusercontent.com',
    iosBundleId: 'com.bjit.flutter.nearme',
  );
}