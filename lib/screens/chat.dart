import 'package:ccrwork_mobile/screens/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dialogflow/dialogflow_v2.dart';

import '../colors.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatScreen> {
  var msgs = [];
  // AuthGoogle authGoogle;
  @override
  void initState() {
    // TODO: implement initState
    loadDialogue();
    super.initState();
  }

  loadDialogue() async {
    // authGoogle = await AuthGoogle(fileJson: "assets/credentials.json").build();
  }

  var controller = new TextEditingController();
  var scroll = new ScrollController();
  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();
  handleSubmit(message) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(message);
    msgs.add(ChatMessage('response', response.getMessage()));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarDef.getAppBar(context, 'Support', false),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      controller: scroll,
                      child: Column(
                        children: getMessages(msgs, context),
                      ))),
              Row(children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    autocorrect: true,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type Text Here...',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      msgs.add(ChatMessage('query', controller.text));
                      handleSubmit(controller.text);
                      setState(() {
                        controller.clear();
                      });
                      scroll.position.ensureVisible(
                        context.findRenderObject(),
                        alignment: 0.5,
                        duration: const Duration(
                            milliseconds: 120), // So it does not jump.
                      );
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.green,
                    ))
              ])
            ])));
  }
}

List<Widget> getMessages(List<dynamic> messages, context) {
  if (messages.length > 0) {
    var items = List.generate(messages.length, (index) {
      var chatBoxColor = messages[index].type == 'query'
          ? Colors.blue.withOpacity(0.4)
          : Colors.pink.withOpacity(0.4);
      var position = messages[index].type == 'query'
          ? Alignment.centerRight
          : Alignment.centerLeft;

      return Align(
          alignment: position,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: chatBoxColor,
            ),
            padding: EdgeInsets.fromLTRB(13, 12, 13, 12),
            child: Text(
              messages[index].text,
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.end,
            ),
          ));
    });
    return items;
  } else {
    return [
      Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.support_agent_sharp,
                color: Colors.blue,
                size: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to CCR. How can i help you?',
                style: TextStyle(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      )
    ];
  }
}

class ChatMessage {
  ChatMessage(this.type, this.text);
  String type;
  String text;
}
