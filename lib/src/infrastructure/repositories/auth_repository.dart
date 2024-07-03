// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:de_weather/src/infrastructure/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepository({
    required this.firebaseAuth,
  });

  User? get currentUser {
    return firebaseAuth.currentUser;
  }

  Stream<String> get user {
    return firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? "" : firebaseUser.displayName;

      return user ?? "";
    });
  }

  Future<Result<String>> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Success(data: "success");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        //try to login
        return await logInWithEmailAndPassword(
            email: email, password: password);
      } else {
        return Error(
            message: "${const SignUpWithEmailAndPasswordFailure()}",
            exception: e);
      }
    } catch (e) {
      return Error(
        message: "An unknown error occurred: ${e.toString()}",
        exception: Exception(e.toString()),
      );
    }

    // return const Success(data: "success");
  }

  Future<Result<String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Success(data: "success");
    } on FirebaseAuthException catch (e) {
      return Error(
        message: "Firebase Auth Error: ${e.message}",
        exception: e,
      );
    } catch (e) {
      return Error(
        message: "An unknown error occurred: ${e.toString()}",
        exception: Exception(e.toString()),
      );
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        firebaseAuth.signOut()
        //other signin like google
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

class LogOutFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}
