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
    apiKey: 'AIzaSyBajT7KXMxViRhxwQd31raY0xqbpNTL6ws',
    appId: '1:342474686043:web:69594c1740e3f7e07b897e',
    messagingSenderId: '342474686043',
    projectId: 'quick-medical',
    authDomain: 'quick-medical.firebaseapp.com',
    storageBucket: 'quick-medical.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAalcnuETgnxhLwJ5zri67s1OocMLDb3bA',
    appId: '1:342474686043:android:4ad5e6fee786683b7b897e',
    messagingSenderId: '342474686043',
    projectId: 'quick-medical',
    storageBucket: 'quick-medical.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCMIlnEkxXEnIydEaCb4FQ1nmg5EmWjZY',
    appId: '1:342474686043:ios:9717d9327f3e07d47b897e',
    messagingSenderId: '342474686043',
    projectId: 'quick-medical',
    storageBucket: 'quick-medical.firebasestorage.app',
    iosBundleId: 'com.example.propertyEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCMIlnEkxXEnIydEaCb4FQ1nmg5EmWjZY',
    appId: '1:342474686043:ios:9717d9327f3e07d47b897e',
    messagingSenderId: '342474686043',
    projectId: 'quick-medical',
    storageBucket: 'quick-medical.firebasestorage.app',
    iosBundleId: 'com.example.propertyEcommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBajT7KXMxViRhxwQd31raY0xqbpNTL6ws',
    appId: '1:342474686043:web:ff286b23ecfefa837b897e',
    messagingSenderId: '342474686043',
    projectId: 'quick-medical',
    authDomain: 'quick-medical.firebaseapp.com',
    storageBucket: 'quick-medical.firebasestorage.app',
  );
}
