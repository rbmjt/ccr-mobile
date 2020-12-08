import 'package:ccrwork_mobile/api/apihelper.dart';
import 'package:ccrwork_mobile/model/candidate.dart';
import 'package:ccrwork_mobile/screens/widgets/customtextfield.dart';
import 'package:ccrwork_mobile/screens/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:validators/validators.dart' as validator;

class CandidateForm extends StatefulWidget {
  @override
  _CandidateFormState createState() => _CandidateFormState();
}

class _CandidateFormState extends State<CandidateForm> {
  final _formKey = GlobalKey<FormState>();
  var model = CandidateModel();
  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        body: Container(
            color: Colors.grey[200],
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Candidates Form',
                        style: TextStyle(fontSize: 21, color: Colors.black87),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'let’s discuss your requirements',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: MyTextFormField(
                          hintText: 'First Name*',
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
                          hintText: 'Last Name*',
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
                        hintText: 'Email*',
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
                        hintText: 'Mobile*',
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                        },
                        onSaved: (String value) {
                          model.phone = value;
                        },
                      )),
                      Container(
                          child: MyTextFormField(
                        hintText: 'Current Employer',
                        isEmail: true,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Current Employer';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.employer = value;
                        },
                      )),
                      Container(
                          child: MyTextFormField(
                        hintText: 'Current Position',
                        isEmail: true,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter current position';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          model.position = value;
                        },
                      )),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            maxLines: 4,
                            onSaved: (String value) {
                              model.address = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Address',
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
                ))));
  }
}

class SubmitAction extends StatefulWidget {
  bool isSubmit = false;
  CandidateModel modal;
  GlobalKey<FormState> _formKey;
  SubmitAction(this.modal, this._formKey);
  @override
  _SubmitActionState createState() => _SubmitActionState();
}

class _SubmitActionState extends State<SubmitAction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
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
                    await ApiHelper().createCandidate(widget.modal);
                    widget.isSubmit = false;
                    // setState(() {});
                    var snackBar = SnackBar(
                        content: Text('Your details has been submitted!'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  } catch (Exception) {
                    var snackBar =
                        SnackBar(content: Text('Some error occurred!'));
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
        ));
  }
}
