import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import 'features/call/call_injection_container.dart';
import 'features/chat/chat_injection_container.dart';
import 'features/notifications/repository/notification_repository.dart';
import 'features/notifications/usecases/get_device_token.dart';
import 'features/status/status_injection_container.dart';
import 'features/user/user_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final firebaseMessaging = FirebaseMessaging.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => firebaseMessaging);
  sl.registerLazySingleton<GetDeviceTokenUseCase>(() => GetDeviceTokenUseCase(firebaseMessaging: firebaseMessaging));
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepository(fireStore: fireStore));

  await userInjectionContainer();
  await chatInjectionContainer();
  await statusInjectionContainer();
  await callInjectionContainer();

}