import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_19/firebase_services/storage.dart';

import '../models/user.dart';
import '../sheert/snackbar.dart';

class AuthMethods {
  register({
    required emailll,
    required passworddd,
    required context,
    required titleee,
    required usernameee,
    required imgName,
    required imgPath,
  }) async {
    String message = "ERROR => توقف الكود عن العمل سطر(18)";
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailll,
        password: passworddd,
      );
      message = "ERROR => Registered only";
      // -----------------------------------------------

      String urlll = await getImgURL(imgName: imgName, imgPath: imgPath);

// Store img url in firestore[database]

      // ------------------------------------------------

      CollectionReference users =
          FirebaseFirestore.instance.collection('usersss');
      UserDate userr = UserDate(
        email: emailll,
        password: passworddd,
        title: titleee,
        username: usernameee,
        profileImg: urlll,
        uid: credential.user!.uid,
      );
      users
          .doc(credential.user!.uid)
          .set(userr.convert2Map())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      message = " تم ارسال البنات ♥";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }
    showSnackBar(context, message);
  }
}
