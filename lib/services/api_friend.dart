import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase_test/models/friend.dart';


//สร้างเมธอดที่ส่งข้อมูลไปที่ fristore database ที่ firebase เพื่อเก็บลง database
Future<bool> apiInsertFriend(String namef, String phontf, String emailf, String imagef) async{
  //สร้าง object เพื่อนไปเก็บที่ firestore database
  Friend friend = Friend(
    namef: namef,
    phonef: phontf,
    emailf: emailf,
    imagef: imagef
  );

  //นำ object แปลงเป็น json แล้วส่งไปที่ firestore database
  try{
    await FirebaseFirestore.instance.collection("friend").add(friend.toJson());
    return true;
  }catch(ex){
    return false;
  }

}


//สน้าง api ดมธอดเพื่อดึงข้อมูลเพื่อนทั้งหมดที่ fristore database ไปโชที่หน้า ้ home
Stream<QuerySnapshot> apiGetAllFriend(){
  try{
    return FirebaseFirestore.instance.collection('friend').snapshots();
  }catch(ex){
    return null;
  }
}

Future<bool> apiDeleteFriend(String id) async{
  try{
    await FirebaseFirestore.instance.collection('friend').doc(id).delete();
    return true;
  }catch(ex){
    return false;
  }
}

Future<bool> apiUpdateFriend(String id, String namef, String phontf, String emailf, String imagef) async{
  //สร้าง object เพื่อนไปเก็บที่ firestore database

  Friend friend = Friend(
      namef: namef,
      phonef: phontf,
      emailf: emailf,
      imagef: imagef
    );

  //นำ object แปลงเป็น json แล้วส่งไปที่ firestore database
  try{
    await FirebaseFirestore.instance.collection("friend").doc(id).update(friend.toJson());
    return true;
  }catch(ex){
    return false;
  }

}
