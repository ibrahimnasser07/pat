import 'package:flutter/material.dart';
import 'package:pat/loginform.dart';
import 'package:pat/signupform.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _textEditingController = TextEditingController();
  late String pass;
  late String email;
  int index = 0;
  List<Widget> screen = [signUpForm(),loginForm()];
  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("images/Logo.png")),
                  const SizedBox(
                    height: 30,
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
                            padding: EdgeInsets.only(bottom: 20),
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: (index==0)? Colors.teal:Colors.transparent,width: 5))),
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
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: (index!=0)? Colors.teal:Colors.transparent,width: 5))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  screen[index],//
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Or',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Image(image: AssetImage("images/facebook.png"),width: 60,height: 60,),
                      ),
                      SizedBox(width: 100,),
                      InkWell(
                        onTap: (){

                        },
                        child: Image(image: AssetImage("images/google.png"),width: 40,height: 40,),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}