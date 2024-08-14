import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/chat_entity.dart';
import '../../../domain/usecases/delete_my_chat_usecase.dart';
import '../../../domain/usecases/get_my_chat_usecase.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMyChatUseCase getMyChatUseCase;
  final DeleteMyChatUseCase deleteMyChatUseCase;
  ChatCubit({required this.getMyChatUseCase, required this.deleteMyChatUseCase}) : super(ChatInitial());

  Future<void> getMyChat({required ChatEntity chat}) async {
    try {
      emit(ChatLoading());

      final streamResponse = getMyChatUseCase.call(chat);
      streamResponse.listen((chatContacts) {
        emit(ChatLoaded(chatContacts: chatContacts));
      });

    } on SocketException {
      emit(ChatFailure());
    } catch (_) {
      emit(ChatFailure());
    }
  }

  Future<void> deleteChat({required ChatEntity chat}) async {
    try {

      await deleteMyChatUseCase.call(chat);

    } on SocketException {
      emit(ChatFailure());
    } catch (_) {
      emit(ChatFailure());
    }
  }
}