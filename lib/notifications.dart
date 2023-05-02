import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Map messages = {};
  _NotificationsState(){
    // messages = {
    //   "Thank you for using the application.. We wish you an enjoyable experience":"1h ago",
    //   "Welcome in the application.. We wish help you":"50m ago",
    // };
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
          title: Text("Notifications",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        body:  (messages.length == 0) ?
            Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 150,),
              Image(image: AssetImage("images/ring notification.png"),),
              SizedBox(height: 30,),
              Text("No Notifications yet!",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 20,),
              Text("We’ll notify you once we have \nsomething for you",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
            ],
          )
        )
            :
            ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, i){
              return InkWell(
                onTap: (){

                },
                child: Container(
                  margin: (i != 0)?
                  EdgeInsets.symmetric(horizontal: 25,vertical: 12):
                  EdgeInsets.only(left: 25,right: 25,bottom: 12,top: 35),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.5,
                          blurRadius: 10
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child:
                        Container(
                            margin: EdgeInsets.only(top: 9),
                            child: Icon(Icons.circle,color: Colors.green,size: 12,)
                        )
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text (
                              '${messages.keys.elementAt(i)}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 13,),
                            Text (
                              '${messages[messages.keys.elementAt(i)]}',
                              style: TextStyle(
                                  color: Color(0xFF5B5B5B),
                                  fontSize: 14,
                              ),
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
    );
  }
}