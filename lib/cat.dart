import 'package:flutter/material.dart';

class catScreen extends StatefulWidget{
  @override
  State<catScreen> createState() => _catScreenState();
}

class _catScreenState extends State<catScreen> {
  Map catdata = {
    "Maine Coon":"cat1.png",
    "Siamese":"cat2.png",
    "Bengal":"cat3.png",
    "Persian":"cat4.png",
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
                Expanded(flex: 10,child: Image(image: AssetImage("images/${catdata[catdata.keys.elementAt(index)]}"))),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text (
                      '${catdata.keys.elementAt(index)}',
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
      itemCount: catdata.length,
    );

  }
}
