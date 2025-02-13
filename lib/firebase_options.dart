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
    apiKey: 'AIzaSyBYtcsV7aks7EwOBcGquOFkKqg5rBMWXCU',
    appId: '1:441367232546:web:51d1c80d4d654bb6720a7b',
    messagingSenderId: '441367232546',
    projectId: 'daalupay',
    authDomain: 'daalupay.firebaseapp.com',
    storageBucket: 'daalupay.firebasestorage.app',
    measurementId: 'G-489N7FDCXR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgB0MYSjfmzaPFB9npYjUDcIaHRdEh73E',
    appId: '1:441367232546:android:d5884249bf1ab75f720a7b',
    messagingSenderId: '441367232546',
    projectId: 'daalupay',
    storageBucket: 'daalupay.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA600cOev-XMkXh5I9lBTwWZ-vkbsmVL5Y',
    appId: '1:441367232546:ios:a77843feb4359c16720a7b',
    messagingSenderId: '441367232546',
    projectId: 'daalupay',
    storageBucket: 'daalupay.firebasestorage.app',
    iosBundleId: 'com.example.daaluPay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA600cOev-XMkXh5I9lBTwWZ-vkbsmVL5Y',
    appId: '1:441367232546:ios:a77843feb4359c16720a7b',
    messagingSenderId: '441367232546',
    projectId: 'daalupay',
    storageBucket: 'daalupay.firebasestorage.app',
    iosBundleId: 'com.example.daaluPay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYtcsV7aks7EwOBcGquOFkKqg5rBMWXCU',
    appId: '1:441367232546:web:7cbe05a34b44675f720a7b',
    messagingSenderId: '441367232546',
    projectId: 'daalupay',
    authDomain: 'daalupay.firebaseapp.com',
    storageBucket: 'daalupay.firebasestorage.app',
    measurementId: 'G-67TV9V6Q3G',
  );
}
