

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_19/firebase_services/storage.dart';
import 'package:uuid/uuid.dart';
import '../models/post.dart';
import '../sheert/snackbar.dart';


class FirestoreMethods {
  uploadPost(
      {required imgName,
      required imgPath,
      required description,
      required profileImg,
      required username,
      required context}) async {
    String message = "ERROR => Not starting the code";

    try {
// ______________________________________________________________________

 String urlll = await getImgURL(imgName: imgName, imgPath: imgPath, folderName: 'imgPosts/${FirebaseAuth.instance.currentUser!.uid}');

// _______________________________________________________________________
// firebase firestore (Database)
      CollectionReference posts =
          FirebaseFirestore.instance.collection('postSSS');
    String newId = const Uuid().v1();
      PostData postt = PostData(
          datePublished: DateTime.now(),
          description: description,
          imgPost: urlll,
          likes: [],
          profileImg: profileImg,
          postId: newId,
          uid: FirebaseAuth.instance.currentUser!.uid,
          username: username);

      message = "ERROR => erroe hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
      posts
          .doc(
            newId,
          )
          .set(postt.convert2Map())
          .then((value) => showSnackBar(context, "ERROR :  done "))
          .catchError((error) => showSnackBar(context, "Failed to post: $error"));

      message = " Posted successfully ♥ ♥";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
showSnackBar(context, "$e");    }

    showSnackBar(context, message);
  }
  // ///////////////////////
 uploadComment(
      {required commentText,
      required context,
      required postId,
      required profileImg,
      required username,
      required uid}) async {
    if (commentText.isNotEmpty) {
      String commentId = const Uuid().v1();
      await FirebaseFirestore.instance
          .collection("postSSS")
          .doc(postId)
          .collection("commentSSS")
          .doc(commentId)
          .set({
        "profilePic": profileImg,
        "username": username,
        "textComment": commentText,
        "dataPublished": DateTime.now(),
        "uid": uid,
        "commentId": commentId
      });
    } else {
      showSnackBar(context, "no");
      
              }
         }
         
         toggleLike({required Map postData}) async {
    try {
      if (postData["likes"].contains(FirebaseAuth.instance.currentUser!.uid)) {
        await FirebaseFirestore.instance
            .collection("postSSS")
            .doc(postData["postId"])
            .update({
          "likes":
              FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection("postSSS")
            .doc(postData["postId"])
            .update({
          "likes":
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
  }
