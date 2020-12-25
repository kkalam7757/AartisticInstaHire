import 'dart:convert';

import 'package:aartistic/constants/route_names.dart';
import 'package:aartistic/locator.dart';
import 'package:aartistic/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:aartistic/services/firestore_service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:aartistic/services/instagram.dart' as insta;

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  UserEmploper _currentUser;
  UserEmploper get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
    @required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);

      if (_currentUser.userRole == role) {
        return authResult.user != null;
      } else {
        return 'Email and Password did not match.';
      }
    } catch (e) {
      if (e.code == 'ERROR_INVALID_EMAIL') {
        return ErrorInvalidEmail;
      }
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = UserEmploper(
        id: authResult.user.uid,
        email: email,
        fullName: fullName,
        userRole: role,
      );

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      print(e);
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return EmailAlreadyHave;
      }
      if (e.code == 'ERROR_INVALID_EMAIL') {
        return ErrorInvalidEmail;
      }
      return e.message;
    }
  }

  Future signUpWithFacebook() async {
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );

        final FirebaseUser user =
            (await _firebaseAuth.signInWithCredential(credential)).user;
        print('signed in ' + user.displayName);

        await _firestoreService.getUser(user.uid).then((value) async {
          if (value == null) {
            _currentUser = UserEmploper(
              id: user.uid,
              email: user.email,
              fullName: user.displayName,
              userRole: 'Job Seeker',
            );
            await _firestoreService.createUser(_currentUser);
          } else {
            await _populateCurrentUser(user);
          }
        });
        return user != null;
      }
    } catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return EmailAlreadyHave;
      }
      return e.message;
    }
  }

  Future googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;

      await _firestoreService.getUser(user.uid).then((value) async {
        if (value == null) {
          _currentUser = UserEmploper(
            id: user.uid,
            email: user.email,
            fullName: user.displayName,
            userRole: 'Job Seeker',
          );
          await _firestoreService.createUser(_currentUser);
        } else {
          await _populateCurrentUser(user);
        }
      });
      return user != null;
    } catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return EmailAlreadyHave;
      }
      return e.message;
    }
  }

  // Future signWithTwitter() async {
  //   try {
  //     TwitterLogin twitterLogin = new TwitterLogin(
  //         consumerKey: TwitterApiKey, consumerSecret: TwitterApiSecret);
  //     TwitterLoginResult _twitterLoginResult = await twitterLogin.authorize();
  //     TwitterSession _currentUserTwitterSession = _twitterLoginResult.session;
  //     AuthCredential _authCredential = TwitterAuthProvider.getCredential(
  //         authToken: _currentUserTwitterSession?.token ?? '',
  //         authTokenSecret: _currentUserTwitterSession?.secret ?? '');
  //     final FirebaseUser user =
  //         (await _firebaseAuth.signInWithCredential(_authCredential)).user;
  //     await _firestoreService.getUser(user.uid).then((value) async {
  //       if (value == null) {
  //         _currentUser = UserEmploper(
  //           id: user.uid,
  //           email: user.email,
  //           fullName: user.displayName,
  //           userRole: 'Job Seeker',
  //         );
  //         await _firestoreService.createUser(_currentUser);
  //       } else {
  //         await _populateCurrentUser(user);
  //       }
  //     });
  //     return user != null;
  //   } catch (e) {
  //     if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
  //       return EmailAlreadyHave;
  //     }
  //     return e.message;
  //   }
  // }

  Future signWithInstagram() {
    insta.getToken(APPID, APPSECRET).then((token) {
      print(token);
    });
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
