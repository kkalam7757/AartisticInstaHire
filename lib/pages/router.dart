import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/pages/ApplicantDetails.dart';
import 'package:aartistic/pages/DetailsEmployer.dart';
import 'package:aartistic/pages/DetailsSeeker.dart';
import 'package:aartistic/pages/JobListing.dart';
import 'package:aartistic/pages/JobSeekerDashboard.dart';
import 'package:aartistic/pages/MyApplicantsEmployer.dart';
import 'package:aartistic/pages/MyListingEmployer.dart';
import 'package:aartistic/pages/MyListingJobseeker.dart';
import 'package:aartistic/pages/MyOrdersJobSeeker.dart';
import 'package:aartistic/pages/Offers.dart';
import 'package:aartistic/pages/OrderDetails.dart';
import 'package:aartistic/pages/employerProfile.dart';
import 'package:aartistic/pages/jobListingList.dart';
import 'package:aartistic/pages/jobSeekerProfile.dart';
import 'package:aartistic/pages/jobSeekerSkillListing.dart';
import 'package:aartistic/pages/job_seeker_skill_list.dart';
import 'package:aartistic/pages/loginEmployer.dart';
import 'package:aartistic/pages/loginJobSeeker.dart';
import 'package:aartistic/pages/login_job_seeker_email.dart';
import 'package:aartistic/pages/signUpEmployer.dart';
import 'package:aartistic/pages/signUpJobSeeker.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'JobCreate.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case EmployerProfileRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: EmployerProfile(),
      );
    case LoginViewEmployerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginEmployer(),
      );
    case LoginJobSeekerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginJobSeeker(),
      );

    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Home(),
      );
    case SignUpViewEmployerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpEmployer(),
      );
    case EmployerJobListingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobListingList(),
      );
    case EmployerJobListingNewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobListing(),
      );
    case SignUpJobSeekerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpJobSeeker(),
      );
      case JobSeekerProfileRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobSeekerProfile(),
      );
      case JobSeekerLoginEmailRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginJobSeekerEmail(),
      );
      case JobSeekerSkillListingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobSeekerSkillListing(),
      );
      case JobSeekerSkillListRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobSeekerSkillList(),
      );
    case JobCreatetRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobCreate(),
      );
      
      case JobSeekerMyListingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MyListingJobseeker(), //MyListingJobseeker()
      );
      
      case EmployerMyListingRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MyListingEmployer(),
      );
      
      case MyApplicantsEmployerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MyApplicantsEmployer(),
      );

      case ApplicantDetailsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ApplicantDetails(),
      );

      case MyOrdersJobSeekerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MyOrdersJobSeeker(),
      );

      case OrderDetailsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OrderDetails(),
      );

      case OffersRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Offers(),
      );
      
      case DetailsEmployerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DetailsEmployer(),
      );
      
      case DetailsSeekerRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DetailsSeeker(),
      );
      
      case JobSeekerDashboardRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: JobSeekerDashboard(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
