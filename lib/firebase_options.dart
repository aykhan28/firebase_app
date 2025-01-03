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
    apiKey: 'AIzaSyArAiP7wL7BZOW7xGMU7R51QuVsHawvna0',
    appId: '1:134698125947:web:7ca952b02761fd850b70de',
    messagingSenderId: '134698125947',
    projectId: 'fir-app-311c1',
    authDomain: 'fir-app-311c1.firebaseapp.com',
    storageBucket: 'fir-app-311c1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-rvuQHahhL9F7BulVxqNp3rv3R2Y3KMQ',
    appId: '1:134698125947:android:79c94b5bdb8a32340b70de',
    messagingSenderId: '134698125947',
    projectId: 'fir-app-311c1',
    storageBucket: 'fir-app-311c1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8A1BEdiYZaEeSyIPHIaCyQI8tjbB67NI',
    appId: '1:134698125947:ios:db6fd5da3135ddeb0b70de',
    messagingSenderId: '134698125947',
    projectId: 'fir-app-311c1',
    storageBucket: 'fir-app-311c1.firebasestorage.app',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8A1BEdiYZaEeSyIPHIaCyQI8tjbB67NI',
    appId: '1:134698125947:ios:db6fd5da3135ddeb0b70de',
    messagingSenderId: '134698125947',
    projectId: 'fir-app-311c1',
    storageBucket: 'fir-app-311c1.firebasestorage.app',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyArAiP7wL7BZOW7xGMU7R51QuVsHawvna0',
    appId: '1:134698125947:web:dc3dd141eb3ddaff0b70de',
    messagingSenderId: '134698125947',
    projectId: 'fir-app-311c1',
    authDomain: 'fir-app-311c1.firebaseapp.com',
    storageBucket: 'fir-app-311c1.firebasestorage.app',
  );

}