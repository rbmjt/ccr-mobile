import 'package:ccrwork_mobile/api/apihelper.dart';
import 'package:ccrwork_mobile/colors.dart';
import 'package:ccrwork_mobile/model/contact.dart';
import 'package:ccrwork_mobile/screens/widgets/customtextfield.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:validators/validators.dart' as validator;

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/dp.jpg"),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [Address(), ContactForm()],
              ),
            )));
  }
}

///////////////////////////////address widget//////////////////////
class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  'Get in Touch',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ))),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: AppColor.contactBorderColor))),
          ),
          SizedBox(
            height: 9,
          ),
          AddressText(Icons.location_on_outlined,
              'Suite 1.01-1.02/360 Pacific Hwy Crows Nest NSW 2065 Australia'),
          AddressText(Icons.phone, '1300 4CCR WORK (1300 4227 9675)'),
          AddressText(Icons.location_on_outlined,
              'Level 26, PWC Tower, 188 Quay Street Auckland 1010 New Zealand'),
          AddressText(Icons.phone, '+64 9355 3285'),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: AppColor.contactBorderColor))))
        ],
      ),
    );
  }
}

////////////addres icon/text widget////////////
class AddressText extends StatelessWidget {
  final IconData icon;
  final String text;
  AddressText(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
              child: Icon(
                icon,
                size: 27,
                color: AppColor.mainColor,
              )),
          Flexible(
              child: Text(
            text,
            style: TextStyle(color: Colors.grey[700], fontSize: 13),
          ))
        ],
      ),
    );
  }
}

//////////////////contact form ////////////////
class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  var model = ContactModel();
  bool isSubmit = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: MyTextFormField(
                  hintText: 'First Name',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.firstName = value;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: MyTextFormField(
                  hintText: 'Last Name',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.lastName = value;
                  },
                ),
              ),
              Container(
                  child: MyTextFormField(
                hintText: 'Email',
                isEmail: true,
                validator: (String value) {
                  if (!validator.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.email = value;
                },
              )),
              Container(
                  child: MyTextFormField(
                hintText: 'Phone*',
                validator: (String value) {
                  if (value == null || value == '') {
                    return 'Please enter your phone number';
                  }
                },
                onSaved: (String value) {
                  model.phone = value;
                },
              )),
              Container(
                  child: MyTextFormField(
                hintText: 'Company',
                isEmail: true,
                validator: (String value) {
                  if (value == null || value == '') {
                    return 'Please enter your company name';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.company = value;
                },
              )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      color: Colors.white,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          hint: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("Interest")),
                          value: model.interest,
                          onChanged: (String value) {
                            setState(() {
                              model.interest = value;
                            });
                          },
                          items: [
                            'Commercial & Claims Management',
                            'Bid Management, Estimation, Quantity Surveying & BIM',
                            'Project Management Services',
                            'Capacity Building',
                            'Other'
                          ].map((String user) {
                            return DropdownMenuItem<String>(
                                value: user,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                          child: Text(
                                        user,
                                        style: TextStyle(color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                      ))),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      contentPadding: EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.text,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: SubmitAction(model, _formKey))
            ],
          ),
        ));
  }
}

class SubmitAction extends StatefulWidget {
  bool isSubmit = false;
  ContactModel modal;
  GlobalKey<FormState> _formKey;
  SubmitAction(this.modal, this._formKey);
  @override
  _SubmitActionState createState() => _SubmitActionState();
}

class _SubmitActionState extends State<SubmitAction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: RaisedButton(
          padding: EdgeInsets.all(15),
          color: Colors.black,
          onPressed: () async {
            if (widget._formKey.currentState.validate()) {
              widget.isSubmit = true;
              widget._formKey.currentState.save();
              try {
                await ApiHelper().createContact(widget.modal);
                widget.isSubmit = false;
                // setState(() {});
                var snackBar =
                    SnackBar(content: Text('Your message has been sent!'));
                Scaffold.of(context).showSnackBar(snackBar);
              } catch (Exception) {
                var snackBar = SnackBar(content: Text('Some error occurred!'));
                Scaffold.of(context).showSnackBar(snackBar);
              }
            }
          },
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ))
      ],
    );
  }
}
