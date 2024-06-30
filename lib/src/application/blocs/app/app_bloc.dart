import 'dart:async';

import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
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
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthRepository _authRepository;
  late final StreamSubscription<String> _userSubscription;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {

    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
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
    // emit(const AppState.loading(true));

    // await _authRepository.signUp(email: event.email, password: event.password);
    // emit(const AppState.loading(false));
    emit(const AppState.loading(true));
    try {
      await _authRepository.signUp(
          email: event.email, password: event.password);
      final user = _authRepository.currentUser;
      if (user != null) {
        emit(const AppState.authenticated("user"));
      } else {
        emit(const AppState.unauthenticated());
      }
    } catch (e) {
      emit(const AppState.unauthenticated());
    }
    emit(const AppState.loading(false));
  }
}
