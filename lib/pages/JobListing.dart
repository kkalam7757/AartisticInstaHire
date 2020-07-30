import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/modals/drop_down.dart';
import 'package:aartistic/viewModal/employ_profile_model.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobListing extends StatefulWidget {
  @override
  _JobListingState createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  EmployerProfileViewModel model = new EmployerProfileViewModel();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobDescription = TextEditingController();
  String workPreference = 'Select Work Preference';
  String jobCategory = 'Select Job Category';
  String userId = '';
  List<PickList> _jobCategories = [
    PickList.fromData({'value':'Select Job Category'})
  ];
  List<PickList> _listWorkPreferences = [
    PickList.fromData({'value': 'Select Work Preference'})
  ];

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.currentUser().then((value){
      setState(() {
        userId = value.uid;
      });
    });
    Firestore.instance.collection('job_category').snapshots().listen((event)
      {
        List<PickList> picklist = List.from(_jobCategories)..addAll(event.documents.map((e) => PickList.fromData(e.data)).where((element) => element.value != null).toList());
        setState(() {
          _jobCategories = picklist;
        });
      }
    );
    Firestore.instance.collection('work_preference').snapshots().listen((event)
      {
        List<PickList> picklist = List.from(_listWorkPreferences)..addAll(event.documents.map((e) => PickList.fromData(e.data)).where((element) => element.value != null).toList());
        setState(() {
          _listWorkPreferences = picklist;
        });
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = TextStyle(color: Color(0xff707070), fontSize: 13);
    return Scaffold(
      body: ListView(children: <Widget>[
       
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  height: 54,
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
                          'Job Title/Position to Fill',
                          textAlign: TextAlign.left,
                          style: textStyle,
                        ),
                      ),
                      TextField(
                          controller: jobTitle,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: inputDecoration('')),
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
                        'Skillset Required/Job Description',
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
                            child: TextField(
                              controller: jobDescription,
                              style: TextStyle(fontSize: 13),
                              minLines: 5,
                              maxLines: null,
                              maxLength: 500,
                              decoration: inputDecoration('Number of vacancies, Required Experience,\n Company Profile etc'),
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
                child: Container(
                  height: 54,
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
                            'Work Preference',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: workPreference,
                                items: _listWorkPreferences
                                    .map((PickList value) {
                                  return new DropdownMenuItem<String>(
                                    value: value.value,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          value.value,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    workPreference = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 54,
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
                            'Job Category',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                value: jobCategory,
                                items:_jobCategories
                                    .map((PickList value) {
                                  return new DropdownMenuItem<String>(
                                    value: value.value,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          value.value,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    jobCategory = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () {
                    model.createJobListting(jobTitle: jobTitle.text, jobDescription: jobDescription.text, userId: userId,jobCategory:jobCategory,workPreference:workPreference);
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
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
       appBar: AppBar(
          title: Text('Create Job Listing'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[Colors.blueAccent, Colors.lightBlue])),
                child: Text(''),
              ),
              NavigationItem('Profile', Icons.person,
                  () => {model.navigation(EmployerProfileRoute)}),
              NavigationItem('Job Listing', Icons.view_list,
                  () => {model.navigation(EmployerJobListingRoute)})
            ],
          ),
        )
    );
  }
}

inputDecoration(String hintText) {
  return InputDecoration(
      contentPadding: EdgeInsets.only(left: 8),
      isDense: true,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: hintText,
    );
}
