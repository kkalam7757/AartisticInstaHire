import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/viewModal/login_job_seeker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobSeekerDrawer extends StatelessWidget {
  JobSeekerModel model = new JobSeekerModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      model.navigation(JobSeekerProfileRoute);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                      radius: 40.0,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tom Cruise',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'tomcruise@gmail.com',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Logged In as: Employer/Buyer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'ID: E123456789',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.0),
                      ),
                    ],
                  )
                ],
              ),
          ),

          //Here you place your menu items
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(HomeViewRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Image.asset('assets/icon/ic_skillisting.png'),
            title: Text('Skill Listing', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(JobCreatetRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('My Listing (Seeker)', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(JobSeekerMyListingRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.toc_rounded),
            title:
                Text('My Listing (Employer)', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(EmployerMyListingRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.group_outlined),
            title: Text('My Applicants (Employer)',
                style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(MyApplicantsEmployerRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.grading_outlined),
            title: Text('Applicant Details', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(ApplicantDetailsRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.format_list_bulleted),
            title: Text('My Orders (Seeker)', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(MyOrdersJobSeekerRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.assignment_outlined),
            title: Text('Order Details', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(OrderDetailsRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.card_giftcard_sharp),
            title: Text('Offers', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(OffersRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.art_track_outlined),
            title: Text('Details (Seeker)', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(DetailsSeekerRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Details (Employer)', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(DetailsEmployerRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Log out', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

    //model.navigation(JobSeekerProfileRoute)
  }
}
