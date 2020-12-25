import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/widget/employer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:aartistic/viewModal/login_job_seeker.dart';

class JobSeekerDrawer extends StatelessWidget {
  
  JobSeekerModel model = new JobSeekerModel();
  
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
            // NavigationItem('Skill Listing', Icons.view_list,
            //     () => {model.navigation(JobSeekerSkillListRoute)})
            NavigationItem('My Listing (Seeker)', Icons.view_list,()=> {
              model.navigation(JobSeekerMyListingRoute)
              
            }),
            NavigationItem('My Listing (Employer)', Icons.view_list,()=> {
              model.navigation(EmployerMyListingRoute)
              
            }),
            NavigationItem('My Applicants (Employer)', Icons.view_list,()=> {
              model.navigation(MyApplicantsEmployerRoute)
              
            }),
            NavigationItem('Applicant Details', Icons.view_list,()=> {
              model.navigation(ApplicantDetailsRoute)
              
            }),
            NavigationItem('My Orders (Seeker)', Icons.view_list,() =>{
              model.navigation(MyOrdersJobSeekerRoute)
            }),
            NavigationItem('Order Details', Icons.view_list,() =>{
              model.navigation(OrderDetailsRoute)
            }),
            NavigationItem('Offers', Icons.view_list,() =>{
              model.navigation(OffersRoute)
            }),
            NavigationItem('Details (Seeker)', Icons.view_list,() =>{
              model.navigation(DetailsSeekerRoute)
            }),
            NavigationItem('Details (Employer)', Icons.view_list,() =>{
              model.navigation(DetailsEmployerRoute)
            }),
            // NavigationItem('Jobs', Icons.view_list,(){})
          ],
        ),
      );
  }
}