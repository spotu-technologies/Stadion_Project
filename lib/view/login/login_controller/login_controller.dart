import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../main_login_view.dart';

class AuthController_Login extends GetxController{
  static AuthController_Login instance = Get.put(AuthController_Login());
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance ;


  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user){
    if(user == null){
      Get.offAll(()=>MainLoginView());
    }else{
      Get.offAll(()=>MainLoginView());
    }
  }

  void register(String email, password, user) async{
    try{
      await authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance.collection('user').doc(user.user!.uid).set({
        'user' : user,
        'email' : email,
      });
      // if(newUser.user!.email!.isNotEmpty){
      //
      // }
    } catch(e) {
      /* Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text('Registration is failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ); */
    }
  }

  void logout(){
    authentication.signOut();
  }

}

