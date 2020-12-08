import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class OutSource extends StatefulWidget {
  @override
  _OutSource createState() => _OutSource();
}

class _OutSource extends State<OutSource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home_bck.jpg"),
                    fit: BoxFit.cover)),
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        """ Resourcing & Team Augmentation """,
                        textAlign: TextAlign.center,
                        style: (TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      getColoredBox('',
                          """CCR builds businesses on concrete foundations. We confidently provide solid support for sustainable business growth with our comprehensive and multidisciplinary suite of commercial resources, each designed specifically to provide viable solutions for every project’s needs. CCR’s industry-leading commercial resources efficiently provide maximum practical support, from start to finish, in order to guarantee the success of all your construction and engineering projects, and to ensure the future success of all our partnerships. We’ve carefully built a pool of highly experienced and available talent that are all at your disposal, and we’re always ready to assign the right person to the right job.

Our decades of experience have taught us many valuable lessons and one of these is that every project will present unique challenges and most projects will present an unforeseeable hurdle at some point. This is where team augmentation has served our clients so well in the past and will continue to serve them in the future. From our pool of technical and commercial experts, we can deploy any resources to augment our clients’ teams as the situation demands.
                            """),
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset('assets/images/temp.png'),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Footer()
                  ],
              )),
              Positioned(
               bottom: 50,
              right: 50,
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(24, 255, 255, 1),
                    heroTag: null, //Must be null to avoid hero animation errors
                    child: Icon(
                      Icons.support_agent_sharp,
                      size: 25,
                    ),
                    onPressed: () => Navigator.pushNamed(context, 'chat'),
                  )),
            ])));
  }
  getImageBox(String name, String image) {
    return Column(children: [
      Image.asset(image),
      SizedBox(
        height: 5,
      ),
      Text(name)
    ]);
  }

  getColoredBox(String header, String text) {
    Color color;
    return Container(
        padding: EdgeInsets.all(18),
        color: color = Color.fromRGBO(240, 136, 46, 0.5),
        child: Column(children: [
          Row(
            children: [
              Text(header,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                text,
                textAlign: TextAlign.start,
              ))
            ],
          )
        ]));
  }
}
