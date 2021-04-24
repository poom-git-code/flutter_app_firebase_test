import 'package:flutter/material.dart';

class UpdateDeleteFriend extends StatefulWidget {

  String id;
  String namef;
  String phonef;
  String emailf;
  String imagef;

  UpdateDeleteFriend(
      this.id, this.namef, this.phonef, this.emailf, this.imagef);

  @override
  _UpdateDeleteFriendState createState() => _UpdateDeleteFriendState();
}

class _UpdateDeleteFriendState extends State<UpdateDeleteFriend> {

  TextEditingController nameCtrl = TextEditingController(text: '');
  TextEditingController phoneCtrl = TextEditingController(text: '');
  TextEditingController emailCtrl = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    nameCtrl.text = widget.namef;
    phoneCtrl.text = widget.phonef;
    emailCtrl.text = widget.emailf;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "แก้ไข/ลบเพื่อน Update/Delete Friend",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Color(0xff027368),
                    child: ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/friend.png',
                          image: widget.imagef,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      onPressed: () {
                        //showBottomSheetForSelectImage(context);
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 30.0,
                        color: Color(0xff027368),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: "ชื่อ",
                    hintText: "ป้อนชื่อ",
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.face_rounded),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: phoneCtrl,
                  decoration: InputDecoration(
                    labelText: "เบอร์โทร",
                    hintText: "ป้อนเบอร์โทร",
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.phone_android),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    labelText: "e-mail",
                    hintText: "ป้อนเ e-mail",
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                        ),
                        child: Text(
                          'แก้ไขเพื่อน',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {

                          });

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                        ),
                        child: Text(
                          'ลบเพื่อน',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
