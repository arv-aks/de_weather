part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    required AppStatus status,
    @Default("") String user,
    @Default(false) bool isLoading,
    @Default("") String email,
    @Default("") String password,
    @Default("") String errorMessage,
  }) = _AppState;

  const factory AppState.authenticated(String user) = Authenticated;
  const factory AppState.unauthenticated() = Unauthenticated;
  const factory AppState.loading(bool value) = Loading;


}
