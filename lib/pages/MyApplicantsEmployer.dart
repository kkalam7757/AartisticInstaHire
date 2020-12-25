import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/widget/JobSeekerDrawer.dart';
import 'package:aartistic/widget/NavigationBackIcon.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class MyApplicantsEmployer extends StatefulWidget {
  @override
  _MyApplicantsEmployerState createState() => _MyApplicantsEmployerState();
}

class _MyApplicantsEmployerState extends State<MyApplicantsEmployer> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fdff),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            Text('Employer ID: E-12345678909',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.2,
                )),
            SizedBox(
              height: 10,
            ),
            myApplicantsEmployerItem(),
            myApplicantsEmployerItem()
          ],
        ),
      ),
      appBar: AppBar(
        leading: NavigationBackIcon(
          onPressed: () {
            _navigationService.pop();
          },
        ),
        title: Text(
          "My Applicants (Employer)",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.notifications_none,
            size: 36,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Container myApplicantsEmployerItem() {
    return Container(
            margin: EdgeInsets.symmetric(vertical:10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xffe8edf3)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  JobDesciptionItem(
                      icon: Icon(Icons.person_outline),
                      jobTitleText: "Job Title: ",
                      jobTitleValue: "Software Development Manager"),
                  JobDesciptionItem(
                      icon: Icon(Icons.list),
                      jobTitleText: "Listing ID: ",
                      jobTitleValue: "L-12345678909"),
                  JobDesciptionItem(
                      icon: Icon(Icons.person_outline),
                      jobTitleText: "Category: ",
                      jobTitleValue: "Management (Middle & Senior)"),
                  JobDesciptionItem(
                      icon: Icon(Icons.timelapse_outlined),
                      jobTitleText: "Duration: ",
                      jobTitleValue: "1 Week (40 hours)"),
                  JobDesciptionItem(
                      icon: Icon(Icons.monetization_on),
                      jobTitleText: "Total Pay: ",
                      jobTitleValue: "\$100 USD "),
                  JobDesciptionItem(
                      icon: Icon(Icons.person_outline),
                      jobTitleText: "Work Pereference: ",
                      jobTitleValue: "Remotely/From Home"),
                  JobDesciptionItem(
                      icon: Icon(Icons.location_on_outlined),
                      jobTitleText: "Location: ",
                      jobTitleValue: "United States Of America"),
                  JobDesciptionItem(
                      icon: Icon(Icons.person_outline),
                      jobTitleText: "Description: ",
                      jobTitleValue:
                          "Must have project management experience in web/mobile app.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: const Color(0xff16315c),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x4020359f),
                              offset: Offset(0, 10),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Align(
                          child: Text(
                            'VIEW APPLICANTS (46)',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        )
                      )
                      )
                ],
              ),
            ),
          );
  }

  Widget JobDesciptionItem(
      {Icon icon, String jobTitleText, String jobTitleValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(jobTitleText,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: const Color(0xff484fb5),
                height: 1.5833333333333333,
                fontWeight: FontWeight.w500,
              )),
          Flexible(
            child: Text(
              jobTitleValue,
              style: TextStyle(
                color: const Color(0xff3d3e4d),
                // fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                fontSize: 14,
                height: 1.5833333333333333,
              ),
              // softWrap: true,
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
