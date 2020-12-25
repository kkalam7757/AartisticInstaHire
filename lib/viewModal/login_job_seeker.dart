import 'dart:async';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/services/authentication_service.dart';
import 'package:aartistic/services/dialog_service.dart';
import 'package:aartistic/services/firestore_service.dart';
import 'package:aartistic/services/navigation_service.dart';
import 'package:aartistic/viewModal/base_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../locator.dart';

class JobSeekerModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreServiceService = locator<FirestoreService>();
  Future signIn({
    @required String email,
    @required String password,
    ProgressDialog pr,
  }) async {
    if (email != '' && password != '') {
      setBusy(true);

      var result = await _authenticationService.loginWithEmail(
          email: email, password: password,role: 'Job Seeker');

      setBusy(false);

      if (result is bool) {
        pr.hide();
        if (result) {
          _navigationService.navigateTo(JobSeekerDashboardRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: GeneralSignUp,
          );
        }
      } else {
        pr.hide();
        await _dialogService.showDialog(
          title: 'Please Correct...',
          description: result,
        );
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

  Future loginFaceboook() async {
    await _authenticationService.signUpWithFacebook().then((result) async {
      if (result is bool) {
        if (result) {
          _navigationService.navigateTo(JobSeekerProfileRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: GeneralSignUp,
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Please Correct...',
          description: result,
        );
      }
    });
  }

  Future loginGoogle() async {
    await _authenticationService.googleSignUp().then((result) async {
      if (result is bool) {
        if (result) {
          _navigationService.navigateTo(JobSeekerProfileRoute);
        } else {
          await _dialogService.showDialog(
            title: 'Please Correct...',
            description: GeneralSignUp,
          );
        }
      } else {
        await _dialogService.showDialog(
          title: 'Please Correct...',
          description: result,
        );
      }
    });
  }

  // Future loginTwitter() async {
  //   await _authenticationService.signWithTwitter().then((result) async {
  //     if (result is bool) {
  //       if (result) {
  //         _navigationService.navigateTo(JobSeekerProfileRoute);
  //       } else {
  //         await _dialogService.showDialog(
  //           title: 'Please Correct...',
  //           description: GeneralSignUp,
  //         );
  //       }
  //     } else {
  //       await _dialogService.showDialog(
  //         title: 'Please Correct...',
  //         description: result,
  //       );
  //     }
  //   });
  // }

  loginWithEmail() {
    _navigationService.navigateTo(JobSeekerLoginEmailRoute);
  }

  join() {
    _navigationService.navigateTo(SignUpJobSeekerRoute);
  }

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
                        _navigationService.navigateTo(JobSeekerProfileRoute)
                      });
            } else {
              new Timer(
                const Duration(milliseconds: 400),
                () async => {
                  pr.hide(),
                  await _dialogService.showDialog(
                    title: 'Please Correct...',
                    description: GeneralSignUp,
                  )
                },
              );
            }
          } else {
            new Timer(
              const Duration(milliseconds: 400),
              () async => {
                pr.hide(),
                await _dialogService.showDialog(
                  title: 'Please Correct...',
                  description: result,
                )
              },
            );
          }
        } else {
          new Timer(
            const Duration(milliseconds: 400),
            () async => {
              pr.hide(),
              await _dialogService.showDialog(
                  title: 'Please Correct...',
                  description: PasswordAndConfirmation)
            },
          );
        }
      } else {
        new Timer(
          const Duration(milliseconds: 400),
          () async => {
            pr.hide(),
            await _dialogService.showDialog(
                title: 'Please Correct...', description: PasswordValid)
          },
        );
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

  Future update(
      {@required String fullName,
      String country,
      String state,
      String city,
      String companyProfile,
      String phone,
      String phoneCode,
      String phoneISOCode,
      String otherCountry,
      ProgressDialog pr}) async {
    print(phoneISOCode);
    if (city != '') {
      _firestoreServiceService.updateUser({
        'fullName': fullName,
        'country': country,
        'state': state,
        'city': city,
        'companyProfile': companyProfile,
        'phone': phone,
        "otherCountry": otherCountry
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

  navigation(route) {
    _navigationService.navigateTo(route);
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
        navigation(JobSeekerSkillListRoute);
      }
    });
  }
}
