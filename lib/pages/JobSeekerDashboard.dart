import 'package:flutter/material.dart';

class JobSeekerDashboard extends StatefulWidget {
  @override
  _JobSeekerDashboardState createState() => _JobSeekerDashboardState();
}

class _JobSeekerDashboardState extends State<JobSeekerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f8fc),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 150,
                  child: Text("Hello"),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Column(
                    children: [
                      dashmenuitem("Profile", Icon(Icons.person_outline)),
                      dashmenuitem("My Listing", Icon(Icons.person_outline)),
                      dashmenuitem("Create Listing(Post an orrder)", Icon(Icons.person_outline)),
                      dashmenuitem("Sales Assisment Test", Icon(Icons.person_outline)),
                      dashmenuitem("Terms", Icon(Icons.person_outline)),
                      dashmenuitem("Support", Icon(Icons.person_outline)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Row dashmenuitem(String name, Icon menuIcon) {
    return Row(
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          margin: EdgeInsets.symmetric(vertical:10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1a484fb5),
                                offset: Offset(0, 2),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: menuIcon,
                        ),
                        SizedBox(width: 20),
                        Text(name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              // letterSpacing: 1,
                              color: const Color(0xff3d3e4d),
                              // height: 1.3571428571428572,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    );
  }
}
