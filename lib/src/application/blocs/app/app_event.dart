part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

final class AppUserChanged extends AppEvent {
  const AppUserChanged();
}

class LoginSubmitted extends AppEvent {
  final String email;
  final String password;

  const LoginSubmitted(this.email, this.password);
}
