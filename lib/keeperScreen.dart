import 'package:flutter/material.dart';
import 'package:pat/bookKeeper.dart';
class keeperPage extends StatefulWidget {
  const keeperPage({Key? key}) : super(key: key);

  @override
  State<keeperPage> createState() => _keeperPageState();
}

class _keeperPageState extends State<keeperPage> {
  late String search;
  Map keeperdata = {
    "Mostafa Ali":["Tanta","keeper1.png","01111254698"],
    "Khaled Kamal":["Cairo","keeper2.png","01254690008"],
  };
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20),
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
                      labelText: "Search for Keeper",
                      hintText: 'Search for Keeper....',
                      labelStyle: TextStyle(color: Colors.blueGrey),

                    ),
                    cursorColor: Colors.teal,
                    style: TextStyle(color: Colors.teal),
                    keyboardType: TextInputType.text,

                  ),
                ),
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Text("Keepers",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                    itemCount: keeperdata.length,
                    itemBuilder: (context, i){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return bookKeeperPage(keeperdata.keys.elementAt(i),keeperdata[keeperdata.keys.elementAt(i)]);
                              }));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.5,
                                  blurRadius: 10
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Image(
                                image: AssetImage("images/${keeperdata[keeperdata.keys.elementAt(i)][1]}")
                                ,height: 200
                              )

                              ),
                              SizedBox(height: 20,),
                              Expanded(
                                child: Container(
                                  height: 150,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFD7D7D7),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft: Radius.circular(35),)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text (
                                        '${keeperdata.keys.elementAt(i)}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 11,),
                                      Text (
                                        '${keeperdata[keeperdata.keys.elementAt(i)][0]}',
                                        style: TextStyle(
                                            color: Color(0xFF5B5B5B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 11,),
                                      Text (
                                        '${keeperdata[keeperdata.keys.elementAt(i)][2]}',
                                        style: TextStyle(
                                            color: Color(0xFF5B5B5B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}