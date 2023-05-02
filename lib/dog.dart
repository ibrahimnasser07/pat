import 'package:flutter/material.dart';

class dogScreen extends StatefulWidget{
  @override
  State<dogScreen> createState() => _dogScreenState();
}

class _dogScreenState extends State<dogScreen> {
  Map dogdata = {
    "Golden Retriever":"dog2.png",
    "Rottweiler":"dog1.png",
    "German Shepherd":"dog4.png",
    "Pitbull":"dog3.png",
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
                Expanded(flex: 10,child: Image(image: AssetImage("images/${dogdata[dogdata.keys.elementAt(index)]}"))),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text (
                      '${dogdata.keys.elementAt(index)}',
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
        ) ;
      },
      itemCount: dogdata.length,
    );

  }
}
