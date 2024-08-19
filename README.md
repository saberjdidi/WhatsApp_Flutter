# whatsapp_flutter

WhatsApp Flutter Project with Clean Architecture

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

video: https://www.youtube.com/watch?v=F8yAdYOXsak&t=646s

## install Plugins :
Clean Architecture Flutter
Bloc : for State management BLoc

## Firebase configuration
1. Installer la CLI Firebase: npm install -g firebase-tools

2. Prepare your workspace
   log in : firebase login

3. Install and run the FlutterFire CLI
   cmd: dart pub global activate flutterfire_cli
   cmd: flutterfire configure --project=whatsapp-flutter-d499c

4. Initialize Firebase and add plugins
   import 'package:firebase_core/firebase_core.dart';
   import 'firebase_options.dart';

   // ...
   
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
   );

Agora Call video : https://www.agora.io/en/
Configuration Agora : 11:00:00