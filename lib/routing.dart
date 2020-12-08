import 'package:ccrwork_mobile/screens/candidates.dart';
import 'package:ccrwork_mobile/screens/chat.dart';
import 'package:ccrwork_mobile/screens/contact.dart';
import 'package:ccrwork_mobile/screens/menu.dart';

import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'chat':
      return MaterialPageRoute(builder: (_) => ChatScreen());
    case 'contacts':
      return MaterialPageRoute(builder: (_) => Contacts());
    case 'menu':
      return MaterialPageRoute(builder: (_) => Menu());
    case 'candidates':
      return MaterialPageRoute(builder: (_) => CandidateForm());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
