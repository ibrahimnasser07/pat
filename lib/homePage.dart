import 'package:flutter/material.dart';
import 'package:pat/brid.dart';
import 'package:pat/dog.dart';
import 'cat.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Widget> screen = [catScreen(),dogScreen(),birdScreen()];
  int index = 0;
  late String search;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 20),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            search = val;
                          });
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFC4C4C4),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          prefixIcon: Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          labelText: "Search for Pet",
                          hintText: 'Search for Pet....',
                          labelStyle: TextStyle(color: Colors.blueGrey),

                        ),
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.teal),
                        keyboardType: TextInputType.text,

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                index = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cats',
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: (index == 0)?Colors.white:Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: 10,),
                                  Image(
                                    image: AssetImage("images/cat.png"),
                                    color: (index == 0)?Colors.white:Colors.black,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: (index == 0)?Colors.teal:Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dogs',
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: (index == 1)?Colors.white:Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: 10,),
                                  Image(
                                    image: AssetImage("images/dog.png"),
                                    color: (index == 1)?Colors.white:Colors.black,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: (index == 1)?Colors.teal:Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Birds',
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: (index == 2)?Colors.white:Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(width: 10,),
                                  Image(
                                    image: AssetImage("images/brid.png"),
                                    color: (index == 2)?Colors.white:Colors.black,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: (index == 2)?Colors.teal:Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              SizedBox(height: 30,),
              Expanded(
                  flex: 10,
                  child: screen[index]
              )
            ],
          ),
        ),
      ),
    );
  }
}