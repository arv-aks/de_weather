import 'dart:async';

import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
import 'package:de_weather/src/infrastructure/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_event.dart';
part 'app_state.dart';

part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser != null
              ? const AppState.authenticated("userfound")
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authRepository.user.listen(
      (user) => add(const AppUserChanged()),
    );
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthRepository _authRepository;
  late final StreamSubscription<String> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    final user = _authRepository.currentUser;
    emit(
      user != null
          ? AppState.authenticated(user.displayName.toString())
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<AppState> emit) async {
    emit(const AppState.loading(true));

    final result = await _authRepository.signUp(
      email: event.email,
      password: event.password,
    );

    if (result is Success<String>) {
      final user = _authRepository.currentUser;
      if (user != null) {
        emit(const AppState.loading(false));
        emit(const AppState.authenticated("user"));
      } else {
        emit(const AppState.loading(false));
        emit(const AppState.unauthenticated());
      }
    } else if (result is Error) {
      final err = result as Error;
      emit(const AppState.loading(false));
      emit(AppState.loginError(err.message));
    }
  }
}
