import 'dart:async';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/services/authentication_service.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/viewModal/base_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../locator.dart';

class LoginEmployerViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  Function join() {
    _navigationService.navigateTo(SignUpViewEmployerRoute);
  }

  Future signIn({
    @required String email,
    @required String password,
    
    ProgressDialog pr,
  }) async {
    setBusy(true);
    print(email);
    if (email != '' && password != '') {
      var result = await _authenticationService.loginWithEmail(
          email: email, password: password,role: 'Employer');

      setBusy(false);

      if (result is bool) {
        pr.hide();
        if (result) {
          _navigationService.navigateTo(EmployerProfileRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: GeneralSignUp,
          );
        }
      } else {
        new Timer(const Duration(milliseconds: 400), () async {
          pr.hide();
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: result,
          );
        });
      }
    } else {
      new Timer(const Duration(milliseconds: 400), () async {
          pr.hide();
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: EmailAndName,
          );
        });
    }
  }
}
