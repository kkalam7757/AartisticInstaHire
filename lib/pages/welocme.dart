import 'package:aartistic/res/app_colors.dart';
import 'package:aartistic/viewModal/welcome_model.dart';
import 'package:aartistic/widget/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

enum SingingCharacter { lafayette, jefferson }

class _WelcomeState extends State<Welcome> {
  WelcomeViewModel model = new WelcomeViewModel();
  bool iAmEmp = false;
  bool iAmJobSeeker = false;

// ...

  SingingCharacter _character;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
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
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              'by Dan Joy, Inc,',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Try an employer or employee '
                  'short-term firs, before You '
                  'commit! All Types of Jobs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 5),
                ),
                SizedBox(height: 10),
                new Text(
                  'All listings are for independent contractor roles initially, but may lead to regular employment too.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 5),
                ),
                SizedBox(height: 10),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.battleship_grey, width: 1),
                borderRadius: BorderRadius.circular(4)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'By continuing I agree to these',
              ),
              SizedBox(width: 10),
              Text(
                "Terms",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(32, 30, 0, 0),
            child: Text(
              'I am a:',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        print(value);
                        setState(() {
                          _character = value;
                        });
                        model.changeScreen(isEmployer: true);
                      },
                    ),
                    Text(
                      'Direct Employer or Buyer',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                        model.changeScreen(isEmployer: false);
                      },
                    ),
                    Text(
                      'Job-seeker or Seller',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          footer(),
          SizedBox(
            height: 10,
          ),
          footer(),
        ],
      ),
    );
  }
}
