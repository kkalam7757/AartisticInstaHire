import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/viewModal/employ_profile_model.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:flutter/material.dart';

class EmployerDrawer extends StatelessWidget {

  EmployerProfileViewModel model = new EmployerProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.lightBlue
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                 onTap: (){
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
                    Text('Tom Cruise',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('tomcruise@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12.0
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('Logged In as: Employer/Buyer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12.0
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('ID: E123456789',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12.0
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //Here you place your menu items
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(JobSeekerProfileRoute);
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('MyListing', style: TextStyle(fontSize: 15)),
            onTap: () {
              model.navigation(JobSeekerSkillListRoute);
              },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Create Listing (Post an offer)', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('My Orders/Employers', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Sales Assessments Test', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Terms', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Supports', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
            },
          ),
          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Log out', style: TextStyle(fontSize: 15)),
            onTap: () {
              // to close drawer programatically..
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

  }
}