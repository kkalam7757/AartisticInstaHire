import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/viewModal/employ_profile_model.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:flutter/material.dart';

class EmployerDrawer extends StatelessWidget {

  EmployerProfileViewModel model = new EmployerProfileViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.blueAccent, Colors.lightBlue])),
              child: Text(''),
            ),
            NavigationItem('Profile', Icons.person,
                () => {model.navigation(JobSeekerProfileRoute)}),
            NavigationItem('Skill Listing', Icons.view_list,
                () => {model.navigation(JobSeekerSkillListRoute)}),
            NavigationItem('MyListing', Icons.view_list,
                () => {model.navigation(EmployerMyListingRoute)}),
          ],
        ),
      );
  }
}