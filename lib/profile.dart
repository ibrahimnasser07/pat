import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}
class _profilePageState extends State<profilePage> {
  TextEditingController _textEditingController = TextEditingController();
  bool male = true;
  late String email;
  late String pass;
  late String username;
  String select = "Doctor";

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose your profile picture'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(width: 10,),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        SizedBox(width: 10,),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
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
          title: Text("Profile",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      (image == null) ?
                      Image(image: AssetImage("images/icon.png"))
                      :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(height: 11,),
                      InkWell(
                        onTap: (){
                          myAlert();
                        },
                          child: Image(image: AssetImage("images/edit.png"))),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30,bottom: 6),
                        child: Text("Name",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        controller: _textEditingController,
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: 'Enter pet name',
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
                          username = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "name is required"  ; // display
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
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30,bottom: 6),
                        child: Text("Email",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: 'email@domain.com',
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
                          email = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "email is required"  ; // display
                          }
                          else if(!isEmail(value)){
                            return  "email should be in form 'email@domain.com'"  ;
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
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30,bottom: 6),
                        child: Text("Password",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.black
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            pass = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: 'Enter your password',
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
                          pass = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "Password is required"  ; // display
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
              SizedBox(height: 15,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(height: 15,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text("Type",style: TextStyle(color: Colors.black,fontSize: 20),)),
                      SizedBox(width: 40,),
                      Expanded(
                        child: PopupMenuButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)),
                          ),
                          color: Colors.grey,
                          child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 10,),
                                  Text(select,style: TextStyle(fontSize: 18,color: Colors.white),),
                                  Icon(Icons.arrow_drop_down,size: 40,color: Colors.white,)
                                  ,SizedBox(width: 10,)
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
                                    SizedBox(width: 12,),
                                    Text("Doctor"),
                                    SizedBox(width: 12,)
                                  ],
                                ),
                                value: 'Doctor',
                              ),
                              PopupMenuItem(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 20,),
                                    Text("Keeper"),
                                    SizedBox(width: 20,)
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
                        ),
                      ),
                      SizedBox(width: 40,),
                    ],
                  )
              ),
              SizedBox(height: 15,),
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
                    ){

                    }
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 25),
                  )
              ),
              SizedBox(height: 15,),
            ],

          ),
        )
    );
  }
}