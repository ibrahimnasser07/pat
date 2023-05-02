import 'package:flutter/material.dart';
import 'package:pat/chats.dart';
import 'package:pat/mainPage.dart';
import 'package:pat/myPet.dart';
import 'package:pat/notifications.dart';
import 'package:pat/profile.dart';
import 'package:pat/settings.dart';

class option2 extends StatefulWidget{
  @override
  State<option2> createState() => _option2State();
}

class _option2State extends State<option2> {
  late String type;
  late Map menu;

  _option2State(){
    //type = "Doctor";
    type = "";
    menu = (type == "Doctor")? {
      "Home":[Icon(Icons.home,color: Colors.white,size: 40,),mainPage()],
      "Notifications":[Icon(Icons.notifications,color: Colors.white,size: 40,),Notifications()],
      "Settings":[Icon(Icons.settings,color: Colors.white,size: 40,),setting()],
      "Get Help":[Icon(Icons.help_outline,color: Colors.white,size: 40,),chats()],
      "Sign Out":[Icon(Icons.output,color: Colors.white,size: 40,)]
    }:{
      "Home":[Icon(Icons.home,color: Colors.white,size: 40,),mainPage()],
      "My Pets":[Icon(Icons.pets,color: Colors.white,size: 40,),myPet()],
      "Notifications":[Icon(Icons.notifications,color: Colors.white,size: 40,),Notifications()],
      "Settings":[Icon(Icons.settings,color: Colors.white,size: 40,),setting()],
      "Get Help":[Icon(Icons.help_outline,color: Colors.white,size: 40,),chats()],
      "Sign Out":[Icon(Icons.output,color: Colors.white,size: 40,)]
    };
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 35,top: 90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.6, 0.9],
          colors: [
            Colors.teal,
            Colors.teal.shade400,
            Colors.teal.shade300,
            Colors.tealAccent,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return profilePage();
                      }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("images/icon.png")),
                    SizedBox(height: 11,),
                    Text("Name",style: TextStyle(fontSize: 25,color: Colors.white),),

                  ],
                ),
              )
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context , i){
                return InkWell(
                  onTap: (){
                    setState(() {
                      if(menu.keys.elementAt(i) == "Sign Out"){
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return menu[menu.keys.elementAt(i)][1];
                        }));
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        menu[menu.keys.elementAt(i)][0],
                        SizedBox(width: 17,),
                        Text(menu.keys.elementAt(i),style: TextStyle(fontSize: 22,color: Colors.white),),

                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}