import 'package:flutter/material.dart';
import 'package:pat/changePassword.dart';
import 'package:pat/profile.dart';
import 'package:pat/premium.dart';
class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool isSwitched = true;
  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)
        ),
        backgroundColor: Colors.white,
        title: Text("Settings",
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
      body:  Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.only(left: 12,bottom: 8),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))
              ),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.person_outline,color: Colors.black,size: 30,),
                  Text("Account", style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return profilePage();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Expanded(flex: 7,child: Text("Edit profile",style: TextStyle(fontSize: 16,color: Colors.grey),)),
                    Expanded(child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 18,)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return changePass();
                        }
                    )
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Expanded(flex: 7,child: Text("Change password",style: TextStyle(fontSize: 16,color: Colors.grey),)),
                    Expanded(child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 18,)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return premiumPage();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Expanded(flex: 7,child: Text("Get premium",style: TextStyle(fontSize: 16,color: Colors.grey),)),
                    Expanded(child: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 18,)),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.only(left: 12,bottom: 8),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))
              ),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.notifications_outlined,color: Colors.black,size: 30,),
                  Text("Notifications", style: TextStyle(fontSize: 16),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Expanded(flex: 3,child: Text("Notifications",style: TextStyle(fontSize: 16,color: Colors.grey),)),
                  Expanded(
                    child: Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.grey,
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.red,

                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}