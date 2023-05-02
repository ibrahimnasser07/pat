import 'dart:math';

import 'package:flutter/material.dart';
class bookKeeperPage extends StatefulWidget {
  late String name;
  late List data;

  bookKeeperPage(this.name, this.data, {Key? key}) : super(key: key);

  @override
  State<bookKeeperPage> createState() => _bookKeeperPageState(this.name, this.data);
}

class _bookKeeperPageState extends State<bookKeeperPage> {
  late String newpass;
  late String confirm;
  late String current;
  late String doctorname;
  late List doctorData;
  Map date = {
    "Sat":"08",
    "Sun":"09",
    "Mon":"10",
    "Tue":"11",
  };
  String selectDate = "Sat";
  Map time = {
    "10":"AM",
    "11":"AM",
    "1":"PM",
    "2":"PM",
    "3":"PM",
    "4":"PM",
  };
  String selectTime = "10";
  _bookKeeperPageState(this.doctorname, this.doctorData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Color(0xFFD7D7D7),
                            borderRadius: BorderRadius.all(Radius.circular(35),)
                        ),
                        child: Image(image: AssetImage("images/${doctorData[1]}"),
                          height: 180,
                          width: 180,),
                      ),
                      SizedBox(height: 12,),
                      Text(doctorname,
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(doctorData[0],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(doctorData[2],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: "call",
                            onPressed: (){
                              setState(() {
                              });
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.call,color: Colors.black,),
                          ),
                          SizedBox(width: 18,),
                          FloatingActionButton(
                            heroTag: "message",
                            onPressed: (){
                              setState(() {

                              });
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.chat,color: Colors.black,),
                          ),
                        ],
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(55),topRight: Radius.circular(55),)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      Expanded(
                        child: Text("Select Date",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: date.length,
                              itemBuilder: (context, index){
                                return InkWell(
                                  onTap: (){
                                    setState(() {

                                    });
                                    selectDate = date.keys.elementAt(index);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: selectDate == date.keys.elementAt(index)?Colors.teal: Color(0xFFD7D7D7),
                                        borderRadius: BorderRadius.all(Radius.circular(35),)
                                    ),
                                    child: Column(
                                      children: [
                                        Text("${date.keys.elementAt(index)}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: selectDate == date.keys.elementAt(index)?Colors.white:Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("${date[date.keys.elementAt(index)]}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: selectDate == date.keys.elementAt(index)?Colors.white:Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          )
                      ),
                      Expanded(
                        child: Text("Select Hosting Time",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: time.length,
                              itemBuilder: (context, index){
                                return InkWell(
                                  onTap: (){
                                    setState(() {

                                    });
                                    selectTime = time.keys.elementAt(index);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 80,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: selectTime == time.keys.elementAt(index)?Colors.teal: Color(0xFFD7D7D7),
                                        borderRadius: BorderRadius.all(Radius.circular(35),)
                                    ),
                                    child: Column(
                                      children: [
                                        Text("${time.keys.elementAt(index)}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: selectTime == time.keys.elementAt(index)?Colors.white:Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("${time[time.keys.elementAt(index)]}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: selectTime == time.keys.elementAt(index)?Colors.white:Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          )
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){

                              },
                              child: Container(
                                width: 250,
                                height: 65,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.all(Radius.circular(35),)
                                ),
                                child: Text("Book An Appointment",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}