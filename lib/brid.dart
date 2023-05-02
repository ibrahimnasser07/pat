import 'package:flutter/material.dart';

class birdScreen extends StatefulWidget{
  @override
  State<birdScreen> createState() => _birdScreenState();
}

class _birdScreenState extends State<birdScreen> {
  Map birddata = {
    "Parakeet":"brid1.png",
    "Cockatiel":"brid2.png",
    "Dove":"brid3.png",
    "Canary":"brid4.png",
  };
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20
      ),
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){

          },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 10,bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                    blurRadius: 10
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(flex: 10,child: Image(image: AssetImage("images/${birddata[birddata.keys.elementAt(index)]}"))),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text (
                      '${birddata.keys.elementAt(index)}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: birddata.length,
    );

  }
}
