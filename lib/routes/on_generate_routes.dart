import 'package:flutter/material.dart';

import '../features/app/const/page_const.dart';
import '../features/app/home/contacts_page.dart';
import '../features/app/settings/settings_page.dart';
import '../features/call/domain/entities/call_entity.dart';
import '../features/call/presentation/pages/call_contacts_page.dart';
import '../features/call/presentation/pages/call_page.dart';
import '../features/chat/domain/entities/message_entity.dart';
import '../features/chat/presentation/pages/single_chat_page.dart';
import '../features/status/domain/entities/status_entity.dart';
import '../features/status/presentation/pages/my_status_page.dart';
import '../features/user/domain/entities/user_entity.dart';
import '../features/user/presentation/pages/edit_profile_page.dart';

class OnGenerateRoute {


  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.contactUsersPage:
        {
          if(args is String) {
            return materialPageBuilder(ContactsPage(uid: args,));

          } else {
            return materialPageBuilder( const ErrorPage());

          }
        }
      case PageConst.settingsPage: {
        if(args is String) {
          return materialPageBuilder( SettingsPage(uid: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.editProfilePage: {
        if(args is UserEntity) {
          return materialPageBuilder( EditProfilePage(currentUser: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.callContactsPage: {
        return materialPageBuilder(const CallContactsPage());

      }
      case PageConst.myStatusPage: {
        if(args is StatusEntity) {
          return materialPageBuilder( MyStatusPage(status: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.callPage: {
        if(args is CallEntity) {
          return materialPageBuilder( CallPage(callEntity: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }
      }
      case PageConst.singleChatPage: {
        if(args is MessageEntity) {
          return materialPageBuilder( SingleChatPage(message: args));
        } else {
          return materialPageBuilder( const ErrorPage());
        }

      }
    }


  }

}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}