import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/viewModal/base_modal.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class WelcomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Function changeScreen({@required bool isEmployer}) {
    if (isEmployer)
      _navigationService.navigateTo(LoginViewEmployerRoute);
    else
      _navigationService.navigateTo(LoginJobSeekerRoute);
  }
}
