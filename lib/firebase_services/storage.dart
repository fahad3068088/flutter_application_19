import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

getImgURL({
  required String imgName,
  required String folderName,
  required Uint8List imgPath,
}) async {
  final storageRef = FirebaseStorage.instance.ref("$folderName/$imgName");

  //
  // نستخدم هذ الكود اذا بنرفع البينات وليس الملف
  UploadTask uploadTask = storageRef.putData(imgPath);
  TaskSnapshot snap = await uploadTask;

// الحصور على رابط الصورة
  String urll = await snap.ref.getDownloadURL();
  return urll;
}
