import 'package:flutter/material.dart';
class premiumPage extends StatefulWidget {
  const premiumPage({Key? key}) : super(key: key);

  @override
  State<premiumPage> createState() => _premiumPageState();
}
class _premiumPageState extends State<premiumPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.white,)
          ),
          backgroundColor: Colors.teal.shade700,
          title: Text("Get Premium",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        body:  Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1,0.2,0.3,0.4, 0.6, 0.89],
              colors: [
                Colors.teal.shade700,
                Colors.teal.shade600,
                Colors.teal.shade500,
                Colors.teal.shade400,
                Colors.teal.shade300,
                Colors.teal.shade100,
              ],
            ),
            image: const DecorationImage(
                image: AssetImage("images/backimage.png"),
                fit: BoxFit.cover,
              )
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.bolt_outlined,size: 25,color: Colors.white,),
                    SizedBox(width: 8,),
                    Text("no ads",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.bolt_outlined,size: 25,color: Colors.white,),
                    SizedBox(width: 8,),
                    Text("Extra Informations About Pets",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20,),
                    ),
                    onPressed: ( ) {
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                '1 month',
                                style: TextStyle(fontSize: 16,color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                '\$12.99',
                                style: TextStyle(fontSize: 16,color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Total Price \$12.99',
                                style: TextStyle(fontSize: 14,color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Monthly',
                                style: TextStyle(fontSize: 14,color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ),
              SizedBox(height: 32,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20,),
                  ),
                  onPressed: ( ) {
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              '6 month',
                              style: TextStyle(fontSize: 16,color: Colors.black),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              '\$8.99',
                              style: TextStyle(fontSize: 16,color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Total Price \$53.99',
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Monthly',
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20,),
                  ),
                  onPressed: ( ) {
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              '12 month',
                              style: TextStyle(fontSize: 16,color: Colors.black),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              '\$5.83',
                              style: TextStyle(fontSize: 16,color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Total Price \$69.99',
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Monthly',
                              style: TextStyle(fontSize: 14,color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 90,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  onPressed: ( ) {
                  },
                  child: Text(
                    'Restore Purchases',
                    style: TextStyle(fontSize: 19,color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],

          ),
        ),
    );
  }
}
