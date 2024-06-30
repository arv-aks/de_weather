part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

final class _AppUserChanged extends AppEvent {
  const _AppUserChanged(this.user);

  final String user;
}

class LoginSubmitted extends AppEvent {
  final String email;
  final String password;

  const LoginSubmitted(this.email, this.password);
}
