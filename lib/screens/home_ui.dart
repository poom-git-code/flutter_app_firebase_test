import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase_test/screens/insert_friend_ui.dart';
import 'package:flutter_app_firebase_test/screens/update_delete_friend.dart';
import 'package:flutter_app_firebase_test/services/api_friend.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:image_picker/image_picker.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {

  //สร้าง object เพื่อเก็บข้อมูลที่ได้จากการเรียกใช้ api ที่ไปดึงข้อฒูลที่ firestore database ที่ firebase
  Stream<QuerySnapshot> allFriend;

  //สร้างเมธอดเพื่อเรียกใช้ api ที่ไปดึงข้อมูลที่ firestore database ที่ firebase
  //แล้วเก็บใน object ที่สร้างไว้
  //เมธอดนี้จะถูกเรียกใช้ตอนที่หน้าจอถูกเปิด (ที่ initState)
  getAllFriend() {
    allFriend = apiGetAllFriend();
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllFriend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพื่อน Friend",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InsertFriendUI()
            )
          ).then((value) => getAllFriend());
        },
        backgroundColor: Color(0xff027368),
        label: Text(
          "เพิ่มเพื่อน",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        icon: Icon(
          Icons.add
        ),
      ),
      body: StreamBuilder(
        stream: allFriend,
        // ignore: missing_return
        builder: (context, snapshot){
          if(snapshot.hasError)
          {
            return Center(
              child: Text('พบข้อผิดพลาดกรุณาลองใหม่อีกครั้ง'),
            );
          }
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            // ignore: missing_return
            separatorBuilder: (context, index){
              return Container(
                height: 2,
                width: double.infinity,
                color: Colors.grey,
              );
            },
            itemCount: snapshot.data.docs.length,

            // ignore: missing_return
            itemBuilder: (context, index){
              return ListTile(
                onTap: (){
                  //เปืดไปหน้า update delete
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateDeleteFriend(
                        snapshot.data.docs[index].id.toString(),
                        snapshot.data.docs[index]['namef'],
                        snapshot.data.docs[index]['phonef'],
                        snapshot.data.docs[index]['emailf'],
                        snapshot.data.docs[index]['imagef'],
                      )
                    )
                  ).then((value) => getAllFriend());
                },
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/friend.png',
                      image: snapshot.data.docs[index]['imagef'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  snapshot.data.docs[index]['namef'],
                ),
                subtitle: Text(
                  snapshot.data.docs[index]['phonef'],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.pink,
                  )
                ),
              );
            },

          );
        },
      ),

    );
  }
}
