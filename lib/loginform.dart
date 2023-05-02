import 'package:flutter/material.dart';
import 'package:pat/homePage.dart';
import 'package:pat/mainPage.dart';
import 'package:validators/validators.dart';

class loginForm extends StatefulWidget{
  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  TextEditingController _textEditingController = TextEditingController();

  late String pass;

  late String email;

  int index = 0;

  bool isEmailCorrect = false;

  final _formKey = GlobalKey<FormState>();

  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: isEmailCorrect! ? 280 : 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 20, top: 20),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.teal,
                    style: TextStyle(color: Colors.teal),
                    controller: _textEditingController,
                    onChanged: (val) {
                      setState(() {
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
                padding: const EdgeInsets.only(left: 20, right: 20),
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
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Forget your password?',
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        const SizedBox(
          height: 30,
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

              if(_formKey.currentState!.validate()  ==true && _formKey2.currentState!.validate()  ==true ){
                   Navigator.push(context, MaterialPageRoute(
                              builder: (context ) {
                                return   mainPage();
                              }
                          )
                              );

              }
            },
            child: Text(
              'Sign In',
              style: TextStyle(fontSize: 25),
            )
        ),
      ],
    );
  }
}