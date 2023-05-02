import 'package:flutter/material.dart';
import 'package:pat/mainPage.dart';
import 'package:validators/validators.dart';

class signUpForm extends StatefulWidget{
  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {
  TextEditingController _textEditingController = TextEditingController();
  bool male = true;
  late String pass;
  late String username;
  late String email;
  String select = "Doctor";
  int index = 0;

  bool isEmailCorrect = false;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 450,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.teal,
                      style: TextStyle(color: Colors.teal),
                      controller: _textEditingController,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                          isEmailCorrect = isEmail(val);
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: 'email@domain.com',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onFieldSubmitted: (value){
                        email = value;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return  "email is required"  ; // display
                        }else if(!isEmail(value)){
                          return  "email should be in form 'email@domain.com'"  ;
                        }
                        else{
                          return null;
                        }

                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Form(
                    key: _formKey1,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.teal,
                      style: TextStyle(color: Colors.teal),
                      onChanged: (val) {
                        setState(() {
                          username = val;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: 'Enter Your Name',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      onFieldSubmitted: (value){
                        username = value;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return  "Name is required"  ; // display
                        }else{
                          return null;
                        }

                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Form(
                    key: _formKey2,
                    child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.teal),
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.grey,
                          labelText: "Password",
                          hintText: 'Enter Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          pass = value;
                        },
                        onChanged: ( value)  {
                          pass = value ;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          } else if (value.length < 8) {
                            return "  password must be >=8 ";
                          }else{
                            return  null;
                          }
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Form(
                    key: _formKey3,
                    child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.teal),
                        obscureText: true,
                        decoration: const InputDecoration(
                          fillColor: Colors.grey,
                          labelText: "Repeat Password",
                          hintText: 'Enter same Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "password is required";
                          } else if (pass != value) {
                            return "  password not the same ";
                          }else{
                            return  null;
                          }
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gender",style: TextStyle(color: Colors.black,fontSize: 20),),
                      SizedBox(width: 100,),
                      FloatingActionButton(
                        heroTag: "male",
                          onPressed: (){
                            setState(() {
                              male = true;
                            });
                          },
                        backgroundColor: male?Colors.teal:Colors.grey,
                        child: Image(image: AssetImage("images/male.png"),height: 33,width: 33,),
                      ),
                      SizedBox(width: 18,),
                      FloatingActionButton(
                        heroTag: "female",
                        onPressed: (){
                          setState(() {
                            male = false;
                          });
                        },
                        backgroundColor: male?Colors.grey:Colors.teal,
                        child: Image(image: AssetImage("images/female.png"),height: 35,width: 35,),
                      ),
                    ],
                  )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Type",style: TextStyle(color: Colors.black,fontSize: 20),),
                        SizedBox(width: 110,),
                        PopupMenuButton(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                          ),
                          color: Colors.grey,
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(select,style: TextStyle(fontSize: 18,color: Colors.white),),
                                  Icon(Icons.arrow_drop_down,size: 40,color: Colors.white,)
                                ,SizedBox(width: 20,)
                                ],
                              )
                          ),
                          onSelected: (value) {
                            select = value;
                            setState(() {

                            });
                          },
                          itemBuilder: (BuildContext bc) {
                            return  [
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 17,),
                                    Text("Doctor"),
                                    SizedBox(width: 17,)
                                  ],
                                ),
                                value: 'Doctor',
                              ),
                              PopupMenuItem(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              SizedBox(width: 15,),
                              Text("Keeper"),
                              SizedBox(width: 15,)
                              ],
                              ),
                                value: 'Keeper',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Text("Owner"),
                                    SizedBox(width: 15,)
                                  ],
                                ),
                                value: 'Owner',
                              )
                            ];
                          },
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)),
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 3.3,
                      vertical: 20)
              ),
              onPressed: ( ) {

                if(_formKey.currentState!.validate()  ==true
                    && _formKey1.currentState!.validate()  ==true
                    && _formKey2.currentState!.validate()  ==true
                    && _formKey3.currentState!.validate()  ==true
                ){
                     Navigator.push(context, MaterialPageRoute(
                                builder: (context ) {
                                  return   mainPage();
                                }
                            )
                                );

                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 25),
              )
          ),

        ],
      ),
    );
  }
}