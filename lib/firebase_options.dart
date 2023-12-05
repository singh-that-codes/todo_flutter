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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyASZCvSClBoPMxJXgmm5ssXQzbDEnBVRA4',
    appId: '1:1071195998049:web:c42aecc8274e9f757fa720',
    messagingSenderId: '1071195998049',
    projectId: 'todofirebase-3110m',
    authDomain: 'todofirebase-3110m.firebaseapp.com',
    storageBucket: 'todofirebase-3110m.appspot.com',
    measurementId: 'G-3HTFPGK2FQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEjjI34Ldv-4HuBR1AiEa_F8wywZs2_30',
    appId: '1:1071195998049:android:589d835793603c4d7fa720',
    messagingSenderId: '1071195998049',
    projectId: 'todofirebase-3110m',
    storageBucket: 'todofirebase-3110m.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuiklIBg2s--zdaysmvJkR_7TRJaaO4B4',
    appId: '1:1071195998049:ios:be70065d7b940add7fa720',
    messagingSenderId: '1071195998049',
    projectId: 'todofirebase-3110m',
    storageBucket: 'todofirebase-3110m.appspot.com',
    iosBundleId: 'com.example.tomyapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCuiklIBg2s--zdaysmvJkR_7TRJaaO4B4',
    appId: '1:1071195998049:ios:2b825d6857b546b97fa720',
    messagingSenderId: '1071195998049',
    projectId: 'todofirebase-3110m',
    storageBucket: 'todofirebase-3110m.appspot.com',
    iosBundleId: 'com.example.tomyapp.RunnerTests',
  );
}
