import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/modals/job_listing.dart';
import 'package:aartistic/viewModal/employ_profile_model.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JobListingList extends StatefulWidget {
  @override
  _JobListingListState createState() => _JobListingListState();
}

class _JobListingListState extends State<JobListingList> {
  List<JobListingModal> _jobListingModal = new List<JobListingModal>();
  List<Widget> _jobListingWidget = new List<Widget>();
  EmployerProfileViewModel model = new EmployerProfileViewModel();
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.currentUser().then(
          (user) => {
            Firestore.instance.collection('job_listing').snapshots().listen(
                  (event){
                     List<JobListingModal> _jobListingModalList = event.documents
                        .map((e) => JobListingModal.fromData(e.data))
                        .where((element) => element.userId == user.uid)
                        .toList();
                        List<Widget> jobListingWidget = new List<Widget>();
                        jobListingWidget.addAll(_jobListingModalList.map(
                          (jobListing){
                               return Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 6),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            jobListing.jobTitle,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            jobListing.jobDescription,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        )
                        );
                        setState(() {
                          _jobListingWidget = jobListingWidget;
                        });
                  }
                  
                )
          },
        );
    _jobListingWidget.add(Text(' '));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Column(children: _jobListingWidget),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () {
                    model.navigation(EmployerJobListingNewRoute);
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
                        "Add New",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
        appBar: AppBar(
          title: Text('Job Listing List'),
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
        ));
    throw UnimplementedError();
  }
}
