import 'package:ccrwork_mobile/screens/about.dart';
import 'package:ccrwork_mobile/screens/contact.dart';
import 'package:ccrwork_mobile/screens/home.dart';
import 'package:flutter/material.dart';

class Helper {
  static Widget getPage(String page) {
    Widget pageW;
    switch (page) {
      case 'Home':
        pageW = Home();
        break;
      case 'About':
        pageW = About();
        break;
      case 'Contacts':
        pageW = Contacts();
        break;
    }
    return pageW;
  }
}
