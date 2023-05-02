import 'package:flutter/material.dart';
import 'package:pat/messages.dart';
class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}
class _chatsState extends State<chats> {
  Map users = {
    "Donia":["chat user2.png","Hi dr. mohamed","13 mins ago"],
    "Khaled":["chat user.png","I want to keep my pet for two...","1h ago"],

  };

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
          title: Text("Chats",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          centerTitle: true,
        ),
        body:  Container(
          child: ListView.builder(
              itemBuilder: (context, i){
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return messagePage(users.keys.elementAt(i));
                            }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey),
                                top: BorderSide(color: Colors.grey)
                            )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
                                  child: Image(image: AssetImage("images/${users[users.keys.elementAt(i)][0]}"),width: 50,height: 50,)
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: EdgeInsets.only(left: 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${users.keys.elementAt(i)}",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("${users[users.keys.elementAt(i)][1]}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text("${users[users.keys.elementAt(i)][2]}",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 0.1,)
                  ],
                );
              },
              itemCount: users.length,
          ),
        )
    );
  }
}