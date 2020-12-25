import 'dart:ui';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/modals/drop_down.dart';
import 'package:aartistic/modals/user.dart';
import 'package:aartistic/services/formatters.dart';
import 'package:aartistic/viewModal/employ_profile_model.dart';
import 'package:aartistic/widget/EmployerDrawer.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:progress_dialog/progress_dialog.dart';

class EmployerProfile extends StatefulWidget {
  @override
  _EmployerProfileState createState() => _EmployerProfileState();
}

class _EmployerProfileState extends State<EmployerProfile> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController fullName = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController compProfile = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController otherCountry = TextEditingController();

  String country = 'Select Country';
  String statePic = "Select State";
  bool showState = false;
  List<PickList> _listCountries = [
    PickList.fromData({'value': 'Select Country'})
  ];

  List<PickList> _listStates = [
    PickList.fromData({'value': 'Select State'})
  ];

  EmployerProfileViewModel model = new EmployerProfileViewModel();
  ProgressDialog pr;
  @override
  initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then(
          (user) => Firestore.instance
              .collection('users')
              .document(user.uid)
              .get()
              .then((value) {
            UserEmploper user = UserEmploper.fromData(value.data);
            fullName.text = user.fullName.toUpperCase();
            company.text = user.company;
            position.text = user.position;
            compProfile.text = user.companyProfile;

            state.text = user.state;
            city.text = user.city;
            phone.text = user.phone;

            otherCountry.text = user.otherCountry;

            if (['India', 'United States of America (USA)', 'Canada']
                .contains(user.country)) {
              showState = true;
              statePic = user.state != '' ? user.state : 'Select State';
            }
            Firestore.instance
                .collection('countries')
                .orderBy('order')
                .snapshots()
                .listen((value) {
              List<PickList> countries = List.from(_listCountries)
                ..addAll(value.documents
                    .map((e) => PickList.fromData(e.data))
                    .toList());
              setState(() {
                _listCountries = countries;
              });
              getStates(user.country, false);
            });
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.only(left: 8),
      isDense: true,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );

    TextStyle textStyle = TextStyle(color: Color(0xff707070), fontSize: 13);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Your Full Name',
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                          TextFormField(
                              controller: fullName,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field can\'t be blank';
                                }
                                return null;
                              },
                              inputFormatters: [
                                new UpperCaseTextFormatter(),
                              ],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: inputDecoration),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Your Job Title/Position',
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                          TextFormField(
                              controller: position,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field can\'t be blank';
                                }
                                return null;
                              },
                              inputFormatters: [
                                new UpperCaseTextFormatter(),
                              ],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: inputDecoration),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Company',
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                          TextFormField(
                              controller: company,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field can\'t be blank';
                                }
                                return null;
                              },
                              inputFormatters: [
                                new UpperCaseTextFormatter(),
                              ],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: inputDecoration),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                'Country',
                                textAlign: TextAlign.left,
                                style: textStyle,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      value: country,
                                      items:
                                          _listCountries.map((PickList value) {
                                        return new DropdownMenuItem<String>(
                                          value: value.value,
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  value.value
                                                      .toUpperCase()
                                                      .trim(),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String value) =>
                                          getStates(value, true)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                country == 'Select Country'
                                    ? 'Field can\'t be blank'
                                    : '',
                                style: TextStyle(
                                    color: Colors.redAccent.shade700,
                                    fontSize: 12.0),
                              ),),
                        ],
                      ),
                    ),
                  ),
                  country == 'Other (Specify)'
                      ? Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff9CB4D9),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Other Country',
                                    textAlign: TextAlign.left,
                                    style: textStyle,
                                  ),
                                ),
                                TextFormField(
                                    controller: otherCountry,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field can\'t be blank';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [
                                      new UpperCaseTextFormatter(),
                                    ],
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    decoration: inputDecoration),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                'State/Province',
                                textAlign: TextAlign.left,
                                style: textStyle,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: showState
                                  ? DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          value: _listStates.length > 2
                                              ? statePic
                                              : 'Select State',
                                          isExpanded: true,
                                          items:
                                              _listStates.map((PickList value) {
                                            return new DropdownMenuItem<String>(
                                              value: value.value,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Text(
                                                    value.value.toUpperCase(),
                                                  )),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String value) {
                                            setState(() {
                                              statePic = value;
                                              state.text = value;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  : TextField(
                                      controller: state,
                                      onChanged: (value) {},
                                      inputFormatters: [
                                        new UpperCaseTextFormatter(),
                                      ],
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      decoration: inputDecoration,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'City',
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                          TextFormField(
                              controller: city,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Field can\'t be blank';
                                }
                                return null;
                              },
                              inputFormatters: [
                                new UpperCaseTextFormatter(),
                              ],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: inputDecoration),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9CB4D9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Mobile/WhatsApp (e.g., +19545551212)',
                              textAlign: TextAlign.left,
                              style: textStyle,
                            ),
                          ),
                          TextFormField(
                            controller: phone,
                            onChanged: (value) {},
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Field can\'t be blank';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 8),
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Company Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xff292929),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          height: 109,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff9CB4D9),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        100 //put here the max height to which you need to resize the textbox
                                    ),
                                child: TextFormField(
                                  controller: compProfile,
                                  minLines: 5,
                                  maxLines: null,
                                  maxLength: 500,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Field can\'t be blank';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 8),
                                      isDense: true,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: ProfileHint,
                                      hintStyle: TextStyle(fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            color: Color(0xff9CB4D9),
                            dashPattern: [4, 4],
                            strokeWidth: 1,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 200,
                                width: 120,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      child: Image.asset(
                                        'assets/icon/video-camera.png',
                                      ),
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 10),
                                    ),
                                    Text(
                                      'Tap to upload video',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffB2AEAE),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            color: Color(0xff9CB4D9),
                            dashPattern: [4, 4],
                            strokeWidth: 1,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height: 200,
                                width: 120,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      child: Image.asset(
                                        'assets/icon/music.png',
                                      ),
                                      padding: EdgeInsets.only(top: 20),
                                    ),
                                    Text(
                                      'Tap to upload audio',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xffB2AEAE),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {},
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(5),
                              color: Color(0xff9CB4D9),
                              dashPattern: [4, 4],
                              strokeWidth: 1,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: Container(
                                  height: 200,
                                  width: 120,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        child: Image.asset(
                                          'assets/icon/photo.png',
                                        ),
                                        padding: EdgeInsets.only(top: 20),
                                      ),
                                      Text(
                                        'Tap to upload image',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xffB2AEAE),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate() &&
                            country != 'Select Country') {
                          pr.show();
                          model.update(
                              fullName: fullName.text,
                              position: position.text,
                              company: company.text,
                              country: country,
                              state: state.text,
                              city: city.text,
                              companyProfile: compProfile.text,
                              phone: phone.text,
                              otherCountry: otherCountry.text,
                              pr: pr);
                        }
                      },
                      child: new Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: Color(0xff16325C),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Create Employer Profile'),
      ),
      drawer: EmployerDrawer()
    );
  }

  Function getStates(country, action) {
    if (this.country != country)
      Firestore.instance
          .collection('states')
          .where('country', isEqualTo: country)
          .orderBy('value', descending: false)
          .getDocuments()
          .then((value) {
        this._listStates = [
          PickList.fromData({'value': 'Select State'})
        ];
        List<PickList> listStates = List.from(_listStates)
          ..addAll(
              value.documents.map((e) => PickList.fromData(e.data)).toList());
        setState(() {
          this._listStates = listStates;
          this.country = country;
          if (action) {
            this.state.text = '';
            this.city.text = '';
            this.statePic = 'Select State';
          }
          if (['India', 'United States of America (USA)', 'Canada']
              .contains(country)) {
            showState = true;
          } else {
            showState = false;
          }
        });
      });
  }
}
