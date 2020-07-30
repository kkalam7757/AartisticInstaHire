import 'package:aartistic/viewModal/welcome_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aartistic/widget/footer.dart';
import 'package:stacked/stacked.dart';

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
      body: ListView(
        children: [
          Container(
            child: Image.asset(
              'assets/welcome/welcome2.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Welcome to Job Board!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xff1351A3),
                      ),
                      child: Image.asset('assets/welcome/Layer 2.png'),
                    ),
                    Container(
                      child: Row(children: [
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
                          'I am an\nEmployer',
                          style: TextStyle(fontSize: 16),
                        )
                      ]),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color(0xff878787),
                      ),
                      child: Image.asset('assets/welcome/businessman.png'),
                    ),
                    Container(
                      child: Row(children: [
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
                          'I am a\nJob-seeker',
                          style: TextStyle(fontSize: 16),
                        )
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          footer()
        ],
      ),
    );
  }
}
