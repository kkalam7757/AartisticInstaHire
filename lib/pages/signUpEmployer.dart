import 'dart:developer';

import 'package:aartistic/widget/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aartistic/viewModal/sign_up_model.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignUpEmployer extends StatelessWidget {
  ProgressDialog pr;
  final userEmail = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final confirmPassword = TextEditingController();
  SignUpViewModel model = new SignUpViewModel();
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
    return Scaffold(
      body: ListView(
       
        children: <Widget>[
          Container(
              child: Text('Employer Sign up',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 24))),
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
                            'Full Name',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 13),
                          ),
                        ),
                        TextField(
                          controller: fullName,
                          
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
                            'Choose a Strong Password',
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
                            'Confirm Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff707070), fontSize: 13),
                          ),
                        ),
                        TextField(
                          controller: confirmPassword,
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
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      pr.show();
                      model.signUp(
                          email: userEmail.text.toLowerCase(),
                          password: password.text,
                          fullName: fullName.text,
                          selectRole: 'Employer',
                          context: context,
                          confirmPassword:confirmPassword.text,
                          pr: pr);
                    },
                    child: new Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        color: Color(0xff1F4A8B),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                footer()
              ],
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
