import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/widget/JobSeekerDrawer.dart';
import 'package:aartistic/widget/NavigationBackIcon.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class DetailsEmployer extends StatefulWidget {
  @override
  _DetailsEmployerState createState() => _DetailsEmployerState();
}

class _DetailsEmployerState extends State<DetailsEmployer> {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fdff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            
            Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
              width: 100,
              height: 30.0,
              margin: EdgeInsets.only(bottom:15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: const Color(0x1afb525e),
              ),
              child: Text(
                'SAMPLE',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: const Color(0xfffb525e),
                  fontWeight: FontWeight.w600,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
                  Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  color: const Color(0xff1a1e9a),
                  height: 1.2,
                ),
                children: [
                  TextSpan(
                    text: 'Details: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Job/Company',
                    style: TextStyle(
                      color: const Color(0xff3c3d4d),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
                  SizedBox(height: 15,),
                  Text(
                    'Employer ID: J-12345678909',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: const Color(0xff686b95),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 74.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xff1a1e9a),
                          height: 1.5833333333333333,
                        ),
                        children: [
                          TextSpan(
                            text: 'Company:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Leading manufacturer and installer of metal fixtures for the cruise ship and marine industry. Multiple locations. Two automated warehouses. In business for 50+ years. Presence in 30+ cou...',
                            style: TextStyle(
                              color: const Color(0xff3c3d4d),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'more',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.play_circle_outline),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.play_circle_outline),
                                    Text("Play Video")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.headset),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.headset),
                                    Text("Play Audio")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.headset),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.image_outlined),
                                    Text("View Image")
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
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
                  
                ],
              ),
            ),
          ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff16315c))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_outlined,
                                color: const Color(0xff16315c)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'CHAT NOW',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: const Color(0xff16315c),
                                fontWeight: FontWeight.w500,
                                height: 1.3571428571428572,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff16315c))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_outline,
                                color: const Color(0xff16315c)),
                            SizedBox(width: 10),
                            Text(
                              'UNLOCK',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: const Color(0xff16315c),
                                fontWeight: FontWeight.w500,
                                height: 1.3571428571428572,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
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
                          'Apply now',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Company\'s Other Listings',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: const Color(0xff00af07),
                          fontWeight: FontWeight.w500,
                          height: 1.3571428571428572,
                          letterSpacing: 1.5
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.east,
                          color: const Color(0xff00af07))
                    ],
                  )
                ],
              ),
            ),
          )
          
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
          "Details (Employer)",
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

  Container DetailsEmployerItem() {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xffe8edf3)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Job-seeker ID: J-12345678909',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: const Color(0xff686b95),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 74.0,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xff1a1e9a),
                          height: 1.5833333333333333,
                        ),
                        children: [
                          TextSpan(
                            text: 'Profile:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accu...',
                            style: TextStyle(
                              color: const Color(0xff3c3d4d),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'more',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.play_circle_outline),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.play_circle_outline),
                                    Text("Play Video")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.headset),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.headset),
                                    Text("Play Audio")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 0.6 / 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[400]),
                                  height: 120,
                                  child: Align(
                                    child: Icon(Icons.headset),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.image_outlined),
                                    Text("View Image")
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff16315c))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_outlined,
                                color: const Color(0xff16315c)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'CHAT NOW',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: const Color(0xff16315c),
                                fontWeight: FontWeight.w500,
                                height: 1.3571428571428572,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff16315c))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_outline,
                                color: const Color(0xff16315c)),
                            SizedBox(width: 10),
                            Text(
                              'UNLOCK',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                color: const Color(0xff16315c),
                                fontWeight: FontWeight.w500,
                                height: 1.3571428571428572,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
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
                          'HIRE NOW',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Person\'s Other Listings',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: const Color(0xff00af07),
                          fontWeight: FontWeight.w500,
                          height: 1.3571428571428572,
                          letterSpacing: 1.5
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward,
                          color: const Color(0xff00af07))
                    ],
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
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }
}
