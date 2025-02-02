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
    apiKey: 'AIzaSyCvIm3lVQVPgPWJN_H9ArXtYBQ0ySXNC6o',
    appId: '1:851630344287:web:4494801b56196a40d773ea',
    messagingSenderId: '851630344287',
    projectId: 'flutter-rendez-vous',
    authDomain: 'flutter-rendez-vous.firebaseapp.com',
    storageBucket: 'flutter-rendez-vous.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPAMtz8VfloxXJ9qxO_Z48T8JOvQRYEoE',
    appId: '1:851630344287:android:262ab1fffae654efd773ea',
    messagingSenderId: '851630344287',
    projectId: 'flutter-rendez-vous',
    storageBucket: 'flutter-rendez-vous.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB90tRUo3GOzYDTJErN3XcLbQMDa30mS_w',
    appId: '1:851630344287:ios:add447c0fe2765bbd773ea',
    messagingSenderId: '851630344287',
    projectId: 'flutter-rendez-vous',
    storageBucket: 'flutter-rendez-vous.appspot.com',
    iosBundleId: 'com.example.rendezVous',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB90tRUo3GOzYDTJErN3XcLbQMDa30mS_w',
    appId: '1:851630344287:ios:add447c0fe2765bbd773ea',
    messagingSenderId: '851630344287',
    projectId: 'flutter-rendez-vous',
    storageBucket: 'flutter-rendez-vous.appspot.com',
    iosBundleId: 'com.example.rendezVous',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvIm3lVQVPgPWJN_H9ArXtYBQ0ySXNC6o',
    appId: '1:851630344287:web:e6138ff09bd921e6d773ea',
    messagingSenderId: '851630344287',
    projectId: 'flutter-rendez-vous',
    authDomain: 'flutter-rendez-vous.firebaseapp.com',
    storageBucket: 'flutter-rendez-vous.appspot.com',
  );
}
