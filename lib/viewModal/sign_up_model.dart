import 'dart:async';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/services/authentication_service.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/viewModal/base_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../locator.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  Future signUp(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String selectRole,
      @required String confirmPassword,
      BuildContext context,
      ProgressDialog pr}) async {
    setBusy(true);
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,}$';
    RegExp regExp = new RegExp(pattern);
    if (email != '' && fullName != '') {
      if (regExp.hasMatch(password)) {
        if (password == confirmPassword) {
          var result = await _authenticationService.signUpWithEmail(
              email: email,
              password: password,
              fullName: fullName,
              role: selectRole);

          setBusy(false);

          if (result is bool) {
            if (result) {
              new Timer(
                  const Duration(milliseconds: 400),
                  () async => {
                        pr.hide(),
                        _navigationService.navigateTo(EmployerProfileRoute)
                      });
            } else {
              new Timer(
                  const Duration(milliseconds: 400),
                  () async => {
                        pr.hide(),
                        await _dialogService.showDialog(
                          title: 'Sign Up Failure',
                          description:
                              GeneralSignUp,
                        )
                      });
            }
          } else {
            new Timer(
              const Duration(milliseconds: 400),
              () async => {
                pr.hide(),
                await _dialogService.showDialog(
                  title: 'Sign Up Failure',
                  description: result,
                )
              },
            );
          }
        } else {
          new Timer(const Duration(milliseconds: 400), () async {
            pr.hide();
            await _dialogService.showDialog(
              title: 'Sign up Failure',
              description:
                  PasswordAndConfirmation,
            );
          });
        }
      } else {
        new Timer(
          const Duration(milliseconds: 400),
          () async => {
            pr.hide(),
            await _dialogService.showDialog(
              title: 'Sign Up Failure',
              description:
                  PasswordValid,
            )
          },
        );
      }
    } else {
      new Timer(const Duration(milliseconds: 400), () async {
        pr.hide();
        await _dialogService.showDialog(
          title: 'Sign up Failure',
          description: EmailAndName,
        );
      });
    }
  }
}
