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
    apiKey: 'AIzaSyBzXbiU3KaraT7ug5cb4xZFnfvH4Jrd52o',
    appId: '1:492060639922:web:fa25ea6426f855dc8e3fab',
    messagingSenderId: '492060639922',
    projectId: 'groceteria-efdf9',
    authDomain: 'groceteria-efdf9.firebaseapp.com',
    storageBucket: 'groceteria-efdf9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQEcgg26sulq7fi12RRVO-X0Wjche0mSQ',
    appId: '1:492060639922:android:12fe605c86e32a0e8e3fab',
    messagingSenderId: '492060639922',
    projectId: 'groceteria-efdf9',
    storageBucket: 'groceteria-efdf9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQDaMhqMVfPIDIRqgKlPyIDzJeUc1CwvU',
    appId: '1:492060639922:ios:74d677e3394944758e3fab',
    messagingSenderId: '492060639922',
    projectId: 'groceteria-efdf9',
    storageBucket: 'groceteria-efdf9.appspot.com',
    iosClientId: '492060639922-k9u2dl63moo3get5ahb1dufhg17fdldi.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceteriaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQDaMhqMVfPIDIRqgKlPyIDzJeUc1CwvU',
    appId: '1:492060639922:ios:74d677e3394944758e3fab',
    messagingSenderId: '492060639922',
    projectId: 'groceteria-efdf9',
    storageBucket: 'groceteria-efdf9.appspot.com',
    iosClientId: '492060639922-k9u2dl63moo3get5ahb1dufhg17fdldi.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceteriaApp',
  );
}
