import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/call_entity.dart';
import '../../../domain/usecases/end_call_usecase.dart';
import '../../../domain/usecases/get_user_calling_usecase.dart';
import '../../../domain/usecases/make_call_usecase.dart';
import '../../../domain/usecases/save_call_history_usecase.dart';
import '../../../domain/usecases/update_call_history_status_usecase.dart';

part 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  final GetUserCallingUseCase getUserCallingUseCase;
  final MakeCallUseCase makeCallUseCase;
  final EndCallUseCase endCallUseCase;
  final SaveCallHistoryUseCase saveCallHistoryUseCase;
  final UpdateCallHistoryStatusUseCase updateCallHistoryStatusUseCase;
  CallCubit({
    required this.endCallUseCase,
    required this.makeCallUseCase,
    required this.getUserCallingUseCase,
    required this.saveCallHistoryUseCase,
    required this.updateCallHistoryStatusUseCase,
  }) : super(CallInitial());


  Future<void> getUserCalling(String uid) async {
    emit(IsCalling());
    try {
      final streamResponse = getUserCallingUseCase.call(uid);
      streamResponse.listen((userCall) {
        if(userCall.isEmpty) {
          emit(CallDialed(userCall: const CallEntity()));

        } else {
          emit(CallDialed(userCall: userCall.first));

        }
      });
    } on SocketException {
      emit(CallFailed());
    } catch (_) {
      emit(CallFailed());
    }
  }

  Future<void> makeCall(CallEntity call) async {
    emit(IsCalling());
    try {
      await makeCallUseCase.call(call);
    } on SocketException {
      emit(CallFailed());
    } catch (_) {
      emit(CallFailed());
    }
  }

  Future<void> endCall(CallEntity call) async {
    emit(IsCalling());
    try {
      await endCallUseCase.call(call);
    } on SocketException {
      emit(CallFailed());
    } catch (_) {
      emit(CallFailed());
    }
  }

  Future<void> saveCallHistory(CallEntity call) async {
    emit(IsCalling());
    try {
      await saveCallHistoryUseCase.call(call);
    } on SocketException {
      emit(CallFailed());
    } catch (_) {
      emit(CallFailed());
    }
  }

  Future<void> updateCallHistoryStatus(CallEntity call) async {
    emit(IsCalling());
    try {
      await updateCallHistoryStatusUseCase.call(call);
    } on SocketException {
      emit(CallFailed());
    } catch (_) {
      emit(CallFailed());
    }
  }


}