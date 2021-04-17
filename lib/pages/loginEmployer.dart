import 'package:aartistic/res/app_colors.dart';
import 'package:aartistic/viewModal/login_employer_model.dart';
import 'package:cross_local_storage/cross_local_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginEmployer extends StatefulWidget {
  @override
  _LoginEmployerState createState() => _LoginEmployerState();
}

class _LoginEmployerState extends State<LoginEmployer> {
  bool rememberMe = false;
  ProgressDialog pr;

  LoginEmployerViewModel model = new LoginEmployerViewModel();

  LocalStorageInterface _localStorage;

  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  void _initLocalStorage() async {
    _localStorage = await LocalStorage.getInstance();
    userEmail.text = _localStorage.getString('email_emp');
    password.text = _localStorage.getString('password_emp');
    setState(() {
      if (_localStorage != null &&
          _localStorage.getBool('rememberMe_emp') != null)
        rememberMe = _localStorage.getBool('rememberMe_emp');
    });
  }

  @override
  void initState() {
    super.initState();
    _initLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                color: AppColors.white,
              ),
              height: 50,
              child: Center(
                  child: Text('Employer / Buyer Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)))),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              'assets/login/login_ex.png',
              width: 414,
              height: 236,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff9CB4D9),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Your Business Email',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 13),
                          ),
                        ),
                        TextField(
                          controller: userEmail,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff9CB4D9),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 13),
                          ),
                        ),
                        TextField(
                          controller: password,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            isDense: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    tristate: false,
                                    onChanged: (bool isChecked) {
                                      print(isChecked);
                                      setState(() {
                                        rememberMe = isChecked;
                                      });
                                      print(rememberMe);
                                    },
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: SizedBox(),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Forgot Password?',
                                      style: TextStyle(
                                          color: Color(0xffFF3333),
                                          fontSize: 14,
                                          decoration: TextDecoration.underline),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          model.join();
                                        },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      pr.show();
                      if (rememberMe) {
                        await _localStorage.setString(
                            'email_emp', userEmail.text);
                        await _localStorage.setString(
                            'password_emp', password.text);
                        await _localStorage.setBool(
                            'rememberMe_emp', rememberMe);
                      } else {
                        _localStorage.remove('email_emp');
                        _localStorage.remove('password_emp');
                        _localStorage.remove('rememberMe_emp');
                      }
                      model.signIn(
                          email: userEmail.text,
                          password: password.text,
                          pr: pr);
                    },
                    child: new Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff1F4A8B),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: RichText(
                      text: TextSpan(style: TextStyle(fontSize: 18), children: [
                        TextSpan(
                          text: 'Not a member yet? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Join',
                          style: TextStyle(color: Color(0xffFF3333)),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              model.join();
                            },
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
