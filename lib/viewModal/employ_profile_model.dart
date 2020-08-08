import 'dart:async';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/firestore_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/viewModal/base_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../locator.dart';

class EmployerProfileViewModel extends BaseModel {
  final FirestoreService _firestoreServiceService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  final NavigationService _navigationService = locator<NavigationService>();
  Future update({
    @required String fullName,
    String position,
    String company,
    String country,
    String state,
    String city,
    String companyProfile,
    String phone,
    String phoneCode,
    String phoneISOCode,
    String otherCountry,
    ProgressDialog pr,
  }) async {
    if (city != '') {
      _firestoreServiceService.updateUser({
        'fullName': fullName,
        'position': position,
        'company': company,
        'country': country,
        'state': state,
        'city': city,
        'companyProfile': companyProfile,
        'phone': phone,
        'otherCountry':otherCountry
      }).then((value) {
        new Timer(const Duration(milliseconds: 400), () {
          pr.hide();
        });
      });
    } else {
      new Timer(const Duration(milliseconds: 400), () async {
          pr.hide();
           await _dialogService.showDialog(
            title: 'Please Correct...',
            description: 'City can\'t be blank',
          );
        });
    }
  }

  Future createJobListting(
      {@required String jobTitle,
      @required String jobDescription,
      @required String userId,
      String jobCategory,
      String workPreference}) async {
    _firestoreServiceService.createJobListting({
      'jobTitle': jobTitle,
      'jobDescription': jobDescription,
      'jobCategory': jobCategory,
      'workPreference': workPreference,
      'userId': userId,
    }).then((value) {
      if (value) {
        navigation(EmployerJobListingRoute);
      }
    });
  }

  openProfile() {
    _navigationService.navigateTo(EmployerProfileRoute);
  }

  navigation(routeName) {
    _navigationService.navigateTo(routeName);
  }
}
