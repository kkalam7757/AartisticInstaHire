import 'package:aartistic/widget/JobSeekerDrawer.dart';
import 'package:flutter/material.dart';

import 'DetailsSeeker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff9fdff),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: <Widget>[
              OffersItem(),
              OffersItem(),
              OffersItem(),
              OffersItem(),
              OffersItem(),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: JobSeekerDrawer()
    );
  }

  Container OffersItem() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(width: 1.0, color: const Color(0xffe8edf3)),

      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person_outline),
                    radius: 40,
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: const Color(0xff1a1e9a),
                          fontWeight: FontWeight.w600,
                          height: 1.3571428571428572,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Job-seeker ID: J-12345678909',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xff686b95),
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )
                ],
              ),
            ),
            offerDevider(),

            JobDesciptionItem(icon: Icon(Icons.person_outline),
                jobTitleText: "Work Pereference: ",
                jobTitleValue: "Remotely/From Home"),

            JobDesciptionItem(icon: Icon(Icons.location_on_outlined),
                jobTitleText: "Location: ",
                jobTitleValue: "United States Of America"),
            JobDesciptionItem(icon: Icon(Icons.timelapse_outlined),
                jobTitleText: "Duration: ",
                jobTitleValue: "1 Week (40 hours)"),
            JobDesciptionItem(icon: Icon(Icons.monetization_on),
                jobTitleText: "Total Pay: ",
                jobTitleValue: "\$100 USD "),
            JobDesciptionItem(icon: Icon(Icons.person_outline),
                jobTitleText: "Category: ",
                jobTitleValue: "Management (Middle & Senior)"),

            JobDesciptionItem(icon: Icon(Icons.person_outline),
                jobTitleText: "Skills/Offers: ",
                jobTitleValue: "Must have project management experience in web/mobile app."),
            offerDevider(),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailsSeeker()),
                );
              },
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Details',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: const Color(0xff58aa9e),
                        fontWeight: FontWeight.w500,
                        height: 1.3571428571428572,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Icon(Icons.arrow_forward, color: Color(0xff58aa9e))
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }

  Container offerDevider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 1.0,
      decoration: BoxDecoration(
        color: const Color(0xffbcbecf),
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
                fontSize: 17,
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
                fontSize: 16,
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
