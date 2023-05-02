import 'package:flutter/material.dart';
import 'package:pat/doctorScreen.dart';
import 'package:pat/homePage.dart';
import 'package:pat/keeperScreen.dart';
import 'package:pat/option2.dart';
import 'package:pat/tempo.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int homeindex = 0;
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  List<Widget> screen = [
    homePage(),
    doctorPage(),
    keeperPage(),
    tempo(),
    tempo()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_drawerscaffoldkey,
      drawer: Drawer(
         backgroundColor: Colors.transparent,
          child: Expanded(child: option2())
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(image: AssetImage("images/Logo.png"),width: 120,height: 56,),
          ],
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              setState(() {

              });
              if(_drawerscaffoldkey.currentState!.isDrawerOpen){
                //if drawer is open, then close the drawer
                Navigator.pop(context);
              }else{
                _drawerscaffoldkey.currentState!.openDrawer();
              }
            },
            child: Image(image: AssetImage("images/option button.png"))
        ),
      ),
      body: screen[homeindex],
      bottomNavigationBar: BottomNavigationBar (
        backgroundColor: Colors.teal,
        currentIndex: homeindex,
        onTap: ( index ) {
          homeindex = index;
          setState(() {});
        },

        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.teal,
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              label: '',
          ) ,
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
              icon: Image(
                image: AssetImage("images/stethoscope.png"),
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
              icon: Image(
                image: AssetImage("images/bag.png"),
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
              icon: Image(
                image: AssetImage("images/chat.png"),
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
              icon: Image(
                image: AssetImage("images/profile.png"),
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              label: ''
          ),
        ],
      ),
    );
  }
}