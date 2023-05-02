import 'package:flutter/material.dart';
class changePass extends StatefulWidget {
  const changePass({Key? key}) : super(key: key);

  @override
  State<changePass> createState() => _changePassState();
}

class _changePassState extends State<changePass> {
  late String newpass;
  late String confirm;
  late String current;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
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
          title: Text("Change Password",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 6,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            current = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: '*********************',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onFieldSubmitted: (value){
                          current = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "Current Password is required"  ; // display
                          }
                          else if(current.length < 8){
                            return  "Current Password should be >= 8 characters"  ; // display
                          }
                          else{
                            return null;
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 6,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            newpass = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: '*********************',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onFieldSubmitted: (value){
                          newpass = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "New Password is required"  ; // display
                          }
                          else if(newpass.length < 8){
                            return  "New Password should be >= 8 characters"  ; // display
                          }
                          else{
                            return null;
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm New Password",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 6,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            confirm = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: '*********************',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onFieldSubmitted: (value){
                          confirm = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "Confirm New Password is required"  ; // display
                          }
                          else if(newpass != confirm){
                            return  "New Password Not Equal Confirm New Password"  ; // display
                          }
                          else{
                            return null;
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.symmetric(
                            vertical: 20
                        ),

                    ),
                    onPressed: ( ) {

                      if(_formKey.currentState!.validate()  ==true
                          && _formKey1.currentState!.validate()  ==true
                          && _formKey2.currentState!.validate()  ==true
                      ){
                      }
                    },
                    child: Text(
                      'Update Password',
                      style: TextStyle(fontSize: 20),
                    )
                ),
              ),
              SizedBox(height: 15,),
            ],

          ),
        )
    );
  }
}