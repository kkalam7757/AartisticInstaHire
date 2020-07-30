import 'dart:convert';

import 'package:aartistic/modals/drop_down.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aartistic/modals/user.dart';
import 'dart:async';
import 'package:aartistic/modals/drop_down.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _countryCollectionReference =
      Firestore.instance.collection('countries');
  final CollectionReference _stateCollectionReference =
      Firestore.instance.collection('states');
  final StreamController<UserEmploper> _postsController =
      StreamController<UserEmploper>.broadcast();
  final StreamController<List<PickList>> _pickListController =
      StreamController<List<PickList>>.broadcast();
  final StreamController<List<PickList>> _pickListStateController =
      StreamController<List<PickList>>.broadcast();
  Future createUser(UserEmploper user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future updateUser(Map<String, dynamic> user) async {
    try {
      
      FirebaseAuth.instance.currentUser().then((value) async {
        print(jsonEncode(user)+'---'+value.uid);
        await _usersCollectionReference.document(value.uid).updateData(user);
      });
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      print('-------------');
      print(jsonEncode(userData.data));
      if (userData.data != null)
        return UserEmploper.fromData(userData.data);
      else
        return null;
    } catch (e) {
      return e.message;
    }
  }

  Future createJobListting(Map<String, dynamic> jobListing) async {
    await Firestore.instance
        .collection('job_listing')
        .document()
        .setData(jobListing);
    return true;
  }
}
