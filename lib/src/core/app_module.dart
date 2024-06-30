import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  FirebaseAuth get firbaseAuth => FirebaseAuth.instance;
}
