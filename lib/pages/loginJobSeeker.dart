import 'package:aartistic/viewModal/login_job_seeker.dart';
import 'package:flutter/material.dart';

class LoginJobSeeker extends StatefulWidget {
  @override
  _LoginJobSeekerState createState() => _LoginJobSeekerState();
}

class _LoginJobSeekerState extends State<LoginJobSeeker> {
  JobSeekerModel model = new JobSeekerModel();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image.asset(
              'assets/icon/ic_launcher_foreground.png',
              width: 100,
              height: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              'Aartistic TryFirst',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Image.asset(
                    'assets/login/loginJobSeeker.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I agree to your'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Terms',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 19),
                  child: GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      model.loginGoogle();
                    },
                    child: new Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xff070707))),
                      height: 45,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/icon/google.png',
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Login with Google",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      model.loginWithEmail();
                    },
                    child: new Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfffffff),
                        border: Border.all(color: Color(0xff070707)),
                      ),
                      height: 45,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/icon/email.png',
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Login with Email",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
                )
              ],
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
