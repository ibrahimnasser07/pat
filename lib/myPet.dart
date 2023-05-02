import 'package:flutter/material.dart';
import 'package:pat/addPets.dart';
class myPet extends StatefulWidget {
  const myPet({Key? key}) : super(key: key);

  @override
  State<myPet> createState() => _myPetState();
}

class _myPetState extends State<myPet> {
  Map catdata = {
    "Maine Coon":["Male","cat1.png","11/2/2020","3"],
    "Siamese":["Female","cat2.png","5/12/2019","4"],
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
        title: Text("My Pets",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return addPet();
                }));
              },
              icon: Icon(Icons.add_circle_outline,size: 30,color: Colors.black,)
          )
        ],
      ),
      body:  Container(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                      itemCount: catdata.length,
                      itemBuilder: (context, i){
                        return InkWell(
                          onTap: (){

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
                                Expanded(
                                    child: Image(
                                  image: AssetImage("images/${catdata[catdata.keys.elementAt(i)][1]}")
                                  ,height: 202,
                                )
                                ),
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
                                          '${catdata.keys.elementAt(i)}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 7,),
                                        Text (
                                          '${catdata[catdata.keys.elementAt(i)][0]}',
                                          style: TextStyle(
                                              color: Color(0xFF5B5B5B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 7,),
                                        Text (
                                          '${catdata[catdata.keys.elementAt(i)][2]}',
                                          style: TextStyle(
                                              color: Color(0xFF5B5B5B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 7,),
                                        Text (
                                          '${catdata[catdata.keys.elementAt(i)][3]}',
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
      ),
    );
  }
}