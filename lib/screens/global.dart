import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:ccrwork_mobile/screens/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class Global extends StatefulWidget {
  @override
  _Global createState() => _Global();
}

class _Global extends State<Global> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Container(
            child: Stack(children: [
          SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'CCR’s Strategic Acquisition in Asia',
                      textAlign: TextAlign.center,
                      style: (TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    getImageBox('', 'assets/images/of.jpg'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      """Through its partnership with Plus 3 and Quantum Global Solutions effective from 6 April 2020, CCR will bring additional products, services and resources to enhance the international geographical scope and delivery of our contractual and commercial services, maintaining our existing client relationships in Australia and New Zealand while establishing new client relationships around the world.""",
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      """“We believe the merger is a meeting of collective spirits and minds, dedicated to enhancing each of our individual services to our local and global clients under one umbrella. Working in partnership with Quantum and CCR was a natural step to share knowledge, resources and skills among our respective regions to offer our clients a cost-effective, localised hub with our renowned customer-focused approach to your projects.’’
                    
Mike McIver, CEO, Plus 3""",
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      """“The merging of our three industry specialists into one company brings great value to all three organisations. Our clients will all capitalise on our respective specialisms and we all have the ability to deliver new services to enhance our client services.”

Tony Hilton, Director, CCR""",
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      """“Over the past three decades, with offices in Malaysia and Hong Kong, Plus 3 has become renowned across Asia for their high level of professional consultancy services to the construction industry. The Quantum family is extremely proud to be part of the Plus 3 restructure and to be working with CCR who are already a major force in the Australian construction Sector.”
                    
Peter Murphy, Managing Director,Quantum""",
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Plus 3 Key Facts',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Wrap(children: [
                          getImageBox(
                              """Three Companies - One Name, From 6 April 2020, Plus 3, CCR and Quantum will partner together under the Plus 3 brand throughout Asia as one team with shared corporate and personal values to provide enhanced services to our clients.""",
                              'assets/images/one.png'),
                          SizedBox(
                            height: 20,
                          ),
                          getImageBox(
                              """Global Reach,Plus 3’s global partnerships extends to Malaysia, Hong Kong, UK, Spain, Switzerland, Turkey, Jordan, KSA, UAE, Qatar, China, South Korea, Australia, New Zealand, the USA and Asia.""",
                              'assets/images/two.png'),
                          SizedBox(
                            height: 20,
                          ),
                          getImageBox(
                              """Key Resources,Led by the Executive Leadership Team – Plus 3 has a collective team of over 200 global consultants delivering the highest level of service to our clients’ projects.""",
                              'assets/images/three.png'),
                          SizedBox(
                            height: 15,
                          ),
                          getImageBox(
                              """Enhanced Services,Forensic Graphics – in house preparation of movies and interactive presentations to demonstrate construction claim entitlements.
System Dynamics – visual method of presenting disruption/uneconomic working claims recognised by the Society of Construction Law Bid Quantities and cost management. 
Training – Capacity Building. Project Management Resourcing and team augmentation.""",
                              'assets/images/four.png'),
                          SizedBox(
                            height: 15,
                          ),
                        ]),
                      ],
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text('Meet Our Teams'),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(children: [
                          getImageBox(
                            '',
                            'assets/images/1s.jpg',
                          ),
                          getImageBox('', 'assets/images/2d.jpg'),
                          getImageBox('', 'assets/images/3r.jpg'),
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
    return Column(children: [
      Image.asset(image),
      SizedBox(
        height: 25,
      ),
      Text(
        name,
        style: TextStyle(color: Colors.black87),
      ),
      SizedBox(
        height: 25,
      ),
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
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold))
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
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.start,
              ))
            ],
          )
        ]));
  }
}
