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
    apiKey: 'AIzaSyCDo05ozcf5stE6-nXAuTCG7B1jj8pEBv8',
    appId: '1:684260426413:web:635547aff11f606bbefc24',
    messagingSenderId: '684260426413',
    projectId: 'notes-29be0',
    authDomain: 'notes-29be0.firebaseapp.com',
    storageBucket: 'notes-29be0.appspot.com',
    measurementId: 'G-Y8HSZHSW9T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-AhdxLQ7da9_Tv4bJ6jrHGiDpm2miVRI',
    appId: '1:684260426413:android:598baf08547d20b7befc24',
    messagingSenderId: '684260426413',
    projectId: 'notes-29be0',
    storageBucket: 'notes-29be0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCcZ5BkU0-gwTZR0Q6eKk8QibT-TYvY9s',
    appId: '1:684260426413:ios:213fca980d220ebebefc24',
    messagingSenderId: '684260426413',
    projectId: 'notes-29be0',
    storageBucket: 'notes-29be0.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCcZ5BkU0-gwTZR0Q6eKk8QibT-TYvY9s',
    appId: '1:684260426413:ios:213fca980d220ebebefc24',
    messagingSenderId: '684260426413',
    projectId: 'notes-29be0',
    storageBucket: 'notes-29be0.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDo05ozcf5stE6-nXAuTCG7B1jj8pEBv8',
    appId: '1:684260426413:web:2adbeddd184486cfbefc24',
    messagingSenderId: '684260426413',
    projectId: 'notes-29be0',
    authDomain: 'notes-29be0.firebaseapp.com',
    storageBucket: 'notes-29be0.appspot.com',
    measurementId: 'G-46C3KMGYZR',
  );

}