import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_flutter/main_injection_container.dart' as di;

import '../../../app/const/page_const.dart';
import '../../../call/domain/entities/call_entity.dart';
import '../../../call/domain/usecases/get_call_channel_id_usecase.dart';
import '../../../call/presentation/cubits/call/call_cubit.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/entities/message_entity.dart';
import '../cubit/message/message_cubit.dart';

class ChatUtils {

  static Future<void> sendMessage(BuildContext context, {
    required MessageEntity messageEntity,
    String? message,
    String? type,
    String? repliedMessage,
    String? repliedTo,
    String? repliedMessageType,
  }) async {
    BlocProvider.of<MessageCubit>(context).sendMessage(
      message: MessageEntity(
          senderUid: messageEntity.senderUid,
          recipientUid: messageEntity.recipientUid,
          senderName: messageEntity.senderName,
          recipientName: messageEntity.recipientName,
          messageType: type,
          repliedMessage: repliedMessage ?? "",
          repliedTo: repliedTo ?? "",
          repliedMessageType: repliedMessageType ?? "",
          isSeen: false,
          createdAt: Timestamp.now(),
          message: message
      ),
      chat: ChatEntity(
        senderUid: messageEntity.senderUid,
        recipientUid: messageEntity.recipientUid,
        senderName: messageEntity.senderName,
        recipientName: messageEntity.recipientName,
        senderProfile: messageEntity.senderProfile,
        recipientProfile: messageEntity.recipientProfile,
        createdAt: Timestamp.now(),
        totalUnReadMessages: 0,
      ),
    );
  }

  static Future<void> makeCall(BuildContext context, {required CallEntity callEntity}) async {
    BlocProvider.of<CallCubit>(context)
        .makeCall(CallEntity(
        callerId: callEntity.callerId,
        callerName: callEntity.callerName,
        callerProfileUrl: callEntity.callerProfileUrl,
        receiverId: callEntity.receiverId,
        receiverName: callEntity.receiverName,
        receiverProfileUrl: callEntity.receiverProfileUrl),)
        .then((value) {
      di
          .sl<GetCallChannelIdUseCase>()
          .call(callEntity.callerId!)
          .then((callChannelId) {
        Navigator.pushNamed(context, PageConst.callPage,
          arguments: CallEntity(
            callId: callChannelId,
            callerId: callEntity.callerId,
            receiverId: callEntity.receiverId,
          ),
        );
        BlocProvider.of<CallCubit>(context)
            .saveCallHistory(CallEntity(
            callId: callChannelId,
            callerId: callEntity.callerId,
            callerName: callEntity.callerName,
            callerProfileUrl:
            callEntity.callerProfileUrl,
            receiverId: callEntity.receiverId,
            receiverName:
            callEntity.receiverName,
            receiverProfileUrl:
            callEntity.receiverProfileUrl,
            isCallDialed: false,
            isMissed: false));
        print("callChannelId = $callChannelId");
      });
    });
  }
}