// File generated manually to bypass FlutterFire CLI caching bug.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAA-d07svMx6ZUkLZJSMLGnL_jLST-TMww',
    appId: '1:206328284827:web:85b7b0c142bfadff40683e',
    messagingSenderId: '206328284827',
    projectId: 'shoppingapp-18cc4',
    authDomain: '://firebaseapp.com',
    storageBucket: 'shoppingapp-18cc4.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdH0fa84zGTZtReL8xg4Z8bDlMSumCMvg',
    appId: '1:206328284827:android:9164e8715212e19f40683e',
    messagingSenderId: '206328284827',
    projectId: 'shoppingapp-18cc4',
    storageBucket: 'shoppingapp-18cc4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4NPuS9EiOeCNd9-W_PBn-s_6dRjNQ3Lk',
    appId: '1:206328284827:ios:8f4ccee38c08d5e540683e',
    messagingSenderId: '206328284827',
    projectId: 'shoppingapp-18cc4',
    storageBucket: 'shoppingapp-18cc4.firebasestorage.app',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAA-d07svMx6ZUkLZJSMLGnL_jLST-TMww',
    appId: '1:206328284827:ios:8f4ccee38c08d5e540683e',
    messagingSenderId: '206328284827',
    projectId: 'shoppingapp-18cc4',
    storageBucket: 'shoppingapp-18cc4.firebasestorage.app',
    iosBundleId: 'com.example.eCommerce',
  );
}
