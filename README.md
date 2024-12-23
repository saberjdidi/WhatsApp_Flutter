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
add project node js to make call using Agora and Add Function Firebase

## Create notification use Firebase Cloud Messaging
1. Create Project whatsapp_functions
2. cmd: firebase init
   ? Are you ready to proceed? Yes
   ? Which Firebase features do you want to set up for this directory? Press Space to select features, then Enter to
   confirm your choices => Functions: Configure a Cloud Functions directory and its files

   === Project Setup
   
   First, let's associate this project directory with a Firebase project.
   You can create multiple project aliases by running firebase use --add,
   but for now we'll just set up a default project.
   
   ? Please select an option: Use an existing project
   ? Select a default Firebase project for this directory: whatsapp-flutter-d499c (whatsapp flutter)
   i  Using project whatsapp-flutter-d499c (whatsapp flutter)

  Functions can be deployed with firebase deploy.

   ? What language would you like to use to write Cloud Functions? TypeScript
   ? Do you want to use ESLint to catch probable bugs and enforce style? No
     +  Wrote functions/package.json
     +  Wrote functions/tsconfig.json
     +  Wrote functions/src/index.ts
     +  Wrote functions/.gitignore
       ? Do you want to install dependencies with npm now? Yes

3. add index.ts
4. cmd: firebase deploy --only functions:sendUserNotification (NB : No-cost - Spark Plan not works with functions you must add => Pay as you go - Blaze Plan)