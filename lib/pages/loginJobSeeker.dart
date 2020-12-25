import 'package:aartistic/viewModal/login_job_seeker.dart';
import 'package:aartistic/widget/footer.dart';
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
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Join as a Job seeker',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20,40,20,20),
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
                // Container(
                //   padding: const EdgeInsets.only(top: 50),
                //   child: GestureDetector(
                //     onTap: () {
                //       print("Container clicked");
                //       model.loginFaceboook();
                //     },
                //     child: new Container(
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(29),
                //         color: Color(0xff1F4A8B),
                //       ),
                //       height: 45,
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 20,
                //           ),
                //           Container(
                //             width: 24,
                //             height: 24,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               'assets/icon/facebook.png',
                //             ),
                //           ),
                //           Expanded(
                //             child: Center(
                //               child: Text(
                //                 "Login with Facebook",
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
                          borderRadius: BorderRadius.circular(29),
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
                // Container(
                //   padding: const EdgeInsets.only(top: 19),
                //   child: GestureDetector(
                //     onTap: () {
                //       print("Container clicked");
                //       // model.loginTwitter();
                //     },
                //     child: new Container(
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(29),
                //         color: Color(0xff03A9F4),
                //       ),
                //       height: 45,
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 20,
                //           ),
                //           Container(
                //             width: 24,
                //             height: 24,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12),
                //               color: Colors.white,
                //             ),
                //             child: Image.asset(
                //               'assets/icon/twitter.png',
                //             ),
                //           ),
                //           Expanded(
                //             child: Center(
                //               child: Text(
                //                 "Login with Twitter",
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.only(top: 19),
                //   child: GestureDetector(
                //     onTap: () {
                //       print("Container clicked");
                //     },
                //     child: new Container(
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(29),
                //           gradient: LinearGradient(colors: [
                //             Color(0xffFF9E6D),
                //             Color(0xffEF596A),
                            
                //           ])),
                //       height: 45,
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 20,
                //           ),
                //           Container(
                //             width: 24,
                //             height: 24,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12),
                //             ),
                //             child: Image.asset(
                //               'assets/icon/instagram.png',
                //             ),
                //           ),
                //           Expanded(
                //             child: Center(
                //               child: Text(
                //                 "Login with Instagram",
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 16),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                
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
                        borderRadius: BorderRadius.circular(29),
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
              ],
            ),
          ),
          footer()

        ],
      ),
    );
    throw UnimplementedError();
  }
}
