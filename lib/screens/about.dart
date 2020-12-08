import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                          'Company Overview',
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'It was our common goal as well as our joint drive for industry excellence that brought Guardian Property & Construction (GPC) and Construction Claims Consultants together to create Contract & Commercial Resources (CCR).',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        getColoredBox('',
                            """The merging of these two industry specialists into one concentrated commercial practice marked a fresh approach to construction projects across Australia, New Zealand and Asia. Together as CCR, we now deliver a full suite of consultancy and resourcing solutions to serve as the backbone of any construction and engineering work.
                          
CCR provides a comprehensive range of construction and engineering services managed by our highly qualified teams of engineers, quantity surveyors, project managers, commercial managers and legal advisors.
   
We are more than able to successfully manage and deliver on both domestic and international projects utilising our expertise in, contract and commercial advice, procurement, estimating, planning and scheduling, claims preparation, construction management, dispute resolution, and more. Our core priority is to effectively transform traditional engineering and construction projects into commercially successful, sustainable business infrastructure which directly benefit both our clients and partners. Our expertise and unparalleled track record in both visionary project consultancy and advanced resourcing management has established our reputation in the field."""),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            child: Column(
                          children: [
                            Text('Our Management team'),
                            SizedBox(
                              height: 30,
                            ),
                            Wrap(children: [
                              getImageBox('ANTHONY HILTON | Director',
                                  'assets/images/Anthony.jpg'),
                              SizedBox(
                                height: 50,
                              ),
                              getImageBox('CHRIS THOMPSON | Director',
                                  'assets/images/Chris.jpg'),
                              SizedBox(
                                height: 50,
                              ),
                              getImageBox('KAILASH AHUJA | Director',
                                  'assets/images/Kailash.jpg'),
                              SizedBox(
                                height: 50,
                              ),
                              getImageBox("""WAYNE BRADSHAW 
 |  Regional Director, New Zealand | """, 'assets/images/Wayne.jpg'),
                              SizedBox(
                                height: 50,
                              ),
                              getImageBox("""CATHERINE WILLIAMS
 | Manager, Planning & Programming | """, 'assets/images/Catherine.jpg'),
                            ]),
                          ],
                        )),
                        SizedBox(
                          height: 15,
                        ),
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
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 15),
        color: Colors.white,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(image),
          Container(
              child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
            ),
          ))
        ]));
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
