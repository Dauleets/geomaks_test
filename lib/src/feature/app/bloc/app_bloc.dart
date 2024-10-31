import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:geomaks_test/src/feature/app/logic/not_auth_logic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geomaks_test/src/feature/app/model/dto/user/user_dto.dart';
import 'package:geomaks_test/src/feature/auth/repository/auth_repository.dart';

part 'app_bloc.freezed.dart';

const _tag = 'AppBloc';

class AppBloc extends Bloc<AppEvent, AppState> {
  final IAuthRepository _authRepository;

  /// Статус аутентификацииcc
  bool get isAuthenticated => _authRepository.isAuthenticated;

  AppBloc(
    this._authRepository,
  ) : super(const AppState.loadingState()) {
    NotAuthLogic().statusSubject.listen(
      (value) async {
        log('_startListenDio message from stream :: $value');

        if (value == 401) {
          // await _authRepository.clearPincode();
          await _authRepository.clearUser().whenComplete(() {
            NotAuthLogic().statusSubject.add(-1);
            add(const AppEvent.startListenDio());
            log('notauthworket is worked', name: _tag);
          });
        }
      },
    );

    on<AppEvent>(
      (AppEvent event, Emitter<AppState> emit) async => event.map(
        exiting: (_Exiting event) async => _exit(event, emit),
        checkAuth: (_CheckAuth event) async => _checkAuth(event, emit),
        logining: (_Logining event) async => _login(event, emit),
        refreshLocal: (_RefreshLocal event) async => _refreshLocal(event, emit),
        startListenDio: (_StartListenDio event) async =>
            _startListenDio(event, emit),
        onboardingSave: (_OnboardingSave event) async =>
            _onboardingSave(event, emit),
        chageState: (_ChangeState event) async => _changeState(event, emit),
      ),
    );
  }

  Future<void> _checkAuth(
    _CheckAuth event,
    Emitter<AppState> emit,
  ) async {
    final bool onboarding = _authRepository.getOnboarding();
    final UserDTO? userFromCache = _authRepository.getUserFromCache();
    if (onboarding) {
      if (userFromCache != null && userFromCache.accessToken != null) {
        emit(const AppState.inAppState());
      } else {
        emit(const AppState.notAuthorizedState());
      }
    } else {
      if (userFromCache != null && userFromCache.accessToken != null) {
        emit(const AppState.inAppState());
      } else {
        emit(const AppState.onboardingState());
      }
    }
  }

  Future<void> _onboardingSave(
    _OnboardingSave event,
    Emitter<AppState> emit,
  ) async {
    _authRepository.setOnboarding(onboarding: true);
    emit(const AppState.notAuthorizedState());
  }

  Future<void> _login(
    _Logining event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.loadingState());
    log('AppBloc _login', name: _tag);
    emit(const AppState.inAppState());
  }

  Future<void> _exit(
    _Exiting event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.loadingState());
    await _authRepository.clearUser();
    emit(const AppState.notAuthorizedState());

    // try {
    //   await GoogleSignInService().handleSignOut();
    // } catch (e) {
    //   log('$e', name: _tag);
    // } finally {
    //   emit(const AppState.notAuthorizedState());
    // }
  }

  Future<void> _refreshLocal(
    _RefreshLocal event,
    Emitter<AppState> emit,
  ) async {
    await state.maybeWhen(
      inAppState: () async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AppState.inAppState());
      },
      orElse: () async {
        emit(const AppState.loadingState());
        await Future.delayed(const Duration(milliseconds: 100));
        emit(const AppState.notAuthorizedState());
      },
    );
  }

  Future<void> _startListenDio(
    _StartListenDio event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.notAuthorizedState());
  }

  Future<void> _changeState(
    _ChangeState event,
    Emitter<AppState> emit,
  ) async =>
      emit(event.state);

  @override
  void onTransition(Transition<AppEvent, AppState> transition) {
    log(transition.toString(), name: _tag);
    super.onTransition(transition);
  }

  // @override
  // void onChange(Change<AppState> change) {
  //   print(change);
  //   super.onChange(change);
  // }
}

///
///
/// Event class
///
///
@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.checkAuth() = _CheckAuth;

  const factory AppEvent.logining() = _Logining;

  const factory AppEvent.exiting() = _Exiting;

  const factory AppEvent.refreshLocal() = _RefreshLocal;

  const factory AppEvent.startListenDio() = _StartListenDio;

  const factory AppEvent.onboardingSave() = _OnboardingSave;

  const factory AppEvent.chageState({
    required AppState state,
  }) = _ChangeState;
}

///
///
/// State class
///
///
@freezed
class AppState with _$AppState {
  const factory AppState.loadingState() = _LoadingState;

  const factory AppState.notAuthorizedState() = _NotAuthorizedState;

  const factory AppState.onboardingState() = _OnboardingState;

  const factory AppState.pincodeState() = _PincodeState;

  const factory AppState.inAppState() = _InAppState;

  const factory AppState.errorState({
    required String message,
  }) = _ErrorState;
}
