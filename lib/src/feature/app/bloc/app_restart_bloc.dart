// ignore: unused_import
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_restart_bloc.freezed.dart';

// ignore: unused_element
const _tag = 'AppRestartBloc';

class AppRestartBloc extends Bloc<AppRestartEvent, AppRestartState> {
  AppRestartBloc() : super(const AppRestartState.loadedState()) {
    on<AppRestartEvent>(
      (AppRestartEvent event, Emitter<AppRestartState> emit) async => event.map(
        restartApp: (_RestartApp event) async => _changeEstateRole(event, emit),
      ),
    );
  }

  Key _key = UniqueKey();

  void restartApp() {
    _key = UniqueKey();
  }

  Future<void> _changeEstateRole(
    _RestartApp event,
    Emitter<AppRestartState> emit,
  ) async {
    emit(const AppRestartState.loading());

    // await Future.delayed(const Duration(milliseconds: 250));

    restartApp();

    emit(AppRestartState.loadedState(key: _key));
  }

  // @override
  // void onTransition(Transition<AppRoleEvent, AppRoleState> transition) {
  //   print(transition);
  //   super.onTransition(transition);
  // }
}

@freezed
class AppRestartEvent with _$AppRestartEvent {
  const factory AppRestartEvent.restartApp() = _RestartApp;
}

@freezed
class AppRestartState with _$AppRestartState {
  const factory AppRestartState.loading() = _LoadingState;

  const factory AppRestartState.loadedState({Key? key}) = _LoadedState;

  const factory AppRestartState.errorState({
    required String message,
  }) = _ErrorState;
}
