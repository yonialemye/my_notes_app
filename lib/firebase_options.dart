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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCw4kUmYrhsFh2wGEW-yjuFX2gLAOOR-Sg',
    appId: '1:312514371584:android:029a9089563516dc14f8e5',
    messagingSenderId: '312514371584',
    projectId: 'my-notes-app-12',
    storageBucket: 'my-notes-app-12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTEpGGgoPVSgQRzFHBxcpW7DK0HPqcjYQ',
    appId: '1:312514371584:ios:2e5200b50ccd0cab14f8e5',
    messagingSenderId: '312514371584',
    projectId: 'my-notes-app-12',
    storageBucket: 'my-notes-app-12.appspot.com',
    iosClientId: '312514371584-1s3ah1r0ms469lm1a80go5i8cbjhkoup.apps.googleusercontent.com',
    iosBundleId: 'com.example.myNotesApp',
  );
}