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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArEOBdszyBlnt8HCy7JyxcBkdOfRvqD3s',
    appId: '1:334881812231:android:774e739825067eb4641fa2',
    messagingSenderId: '334881812231',
    projectId: 'logins-e155f',
    storageBucket: 'logins-e155f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlIV2xT2teH_RJ9hHvDLJILnARfSb9mOE',
    appId: '1:334881812231:ios:539fce1702b30680641fa2',
    messagingSenderId: '334881812231',
    projectId: 'logins-e155f',
    storageBucket: 'logins-e155f.appspot.com',
    androidClientId: '334881812231-tqhrf4ug7ouqch0mi8phor9gg2nf023p.apps.googleusercontent.com',
    iosClientId: '334881812231-htifuvnrp8oqbsnvu4kojefk3r25gbt0.apps.googleusercontent.com',
    iosBundleId: 'com.example.deWeather',
  );
}
