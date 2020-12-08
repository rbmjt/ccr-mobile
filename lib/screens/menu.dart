import 'package:ccrwork_mobile/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'global.dart';
import 'home.dart';
import 'industry.dart';
import 'outsource.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var headerText = [
    'Home',
    'About',
    'Industry Sectors',
    'Global Reach',
    'Resourcing',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          title: Container(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white54)),
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'contacts');
                            },
                            child: Text('Contact Us',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13)))),
                    Image.asset(
                      "assets/images/go.png",
                      height: 75,
                      width: 105,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white54)),
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'candidates');
                            },
                            child: Text('Candidates',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13))))
                  ])),
        ),
        body: new DefaultTabController(
          length: 5,
          child: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color.fromRGBO(240, 136, 46, 1),
              actions: <Widget>[],
              title: new TabBar(
                onTap: (index) {
                  setState(() {});
                },
                isScrollable: true,
                tabs: [
                  new Container(child: Text('Home')),
                  new Container(child: Text('About')),
                  new Container(child: Text('Industry Sectors')),
                  new Container(child: Text('Global Reach')),
                  new Container(child: Text('Resourcing')),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: [
                Home(),
                About(),
                Industry(),
                Global(),
                OutSource(),
              ],
            ),
          ),
        ));
  }
}
