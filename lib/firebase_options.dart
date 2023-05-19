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
// ...
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCO20tKmBuKOlOstr5X0WHJdATfAxlfma0',
    appId: '1:873137795353:web:40e956cef39481653d9588',
    messagingSenderId: '873137795353',
    projectId: 'ottaaproject-flutter',
    authDomain: 'ottaaproject-flutter.firebaseapp.com',
    databaseURL: 'https://ottaaproject-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'ottaaproject-flutter.appspot.com',
    measurementId: 'G-5QCB3QD3PH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhrH8ja_uNLfqVzriCwnT3cMc2dYHsHC0',
    appId: '1:873137795353:android:d7a950d9817316133d9588',
    messagingSenderId: '873137795353',
    projectId: 'ottaaproject-flutter',
    databaseURL: 'https://ottaaproject-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'ottaaproject-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYbal1US11FCM16wQcEpri4azayyS0u2s',
    appId: '1:873137795353:ios:f625d933dd6c58e33d9588',
    messagingSenderId: '873137795353',
    projectId: 'ottaaproject-flutter',
    databaseURL: 'https://ottaaproject-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'ottaaproject-flutter.appspot.com',
    androidClientId: '873137795353-1ttsko6h874bjq935auokrhk9plshtka.apps.googleusercontent.com',
    iosClientId: '873137795353-8nf0s1bmivtavhh51h7genlc0aqu1rea.apps.googleusercontent.com',
    iosBundleId: 'com.ottaaproject.ottaa',
  );
}
