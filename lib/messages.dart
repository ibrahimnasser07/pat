import 'package:flutter/material.dart';
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage(this.messageContent, this.messageType);
}
class messagePage extends StatefulWidget {
  late String name;
  messagePage(this.name, {Key? key}) : super(key: key);

  @override
  State<messagePage> createState() => _messagePageState(this.name);
}

class _messagePageState extends State<messagePage> {
  int homeindex = 0;
  Map users = {
    "Donia":["chat user2.png","Hi dr. mohamed","13 mins ago"],
    "Khaled":["chat user.png","I want to keep my pet for two...","1h ago"],
  };
  late String username;
  late String message;
  List<ChatMessage> messages = [
    ChatMessage("Hello, Will", "receiver"),
    ChatMessage("How have you been?", "receiver"),
    ChatMessage("Hey Kriss, I am doing fine dude. wbu?", "sender"),
    ChatMessage("ehhhh, doing OK.", "receiver"),
    ChatMessage("Is there any thing wrong?", "sender"),
  ];
  final fieldText = TextEditingController();
  _messagePageState(this.username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 3.5),
          child: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,)
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/${users[username][0]}"),width: 40,height: 40,),
                SizedBox(width: 15,),
                Text(username,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: (){
                    },
                    icon: Icon(Icons.call,size: 30,color: Colors.teal,)
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            padding: EdgeInsets.only(top: 10,bottom: 30),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: (messages[index].messageType == "receiver")?
                  Row(
                    children: [
                      Image(image: AssetImage("images/${users[username][0]}"),width: 40,height: 40,),
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.teal),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                    ],
                  )
                  :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.teal),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                      ),
                      SizedBox(width: 10,),
                      Image(image: AssetImage("images/icon.png"),width: 40,height: 40,),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value){
                        message = value;
                      },
                      onChanged: (val) {
                        setState(() {
                          message = val;
                        });
                      },
                      controller: fieldText,
                      decoration: InputDecoration(
                          hintText: "Write a text messages...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        messages.add(ChatMessage(message, "sender"),);
                        fieldText.clear();
                      });
                    },
                    child: Icon(Icons.send,color: Colors.teal,size: 32,),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  SizedBox(width: 8,),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}