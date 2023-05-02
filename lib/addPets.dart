import 'package:flutter/material.dart';
class addPet extends StatefulWidget {
  const addPet({Key? key}) : super(key: key);

  @override
  State<addPet> createState() => _addPetState();
}

class _addPetState extends State<addPet> {
  TextEditingController _textEditingController = TextEditingController();
  bool male = true;
  late String age;
  late String date;
  late String username;
  late String desc;
  String select = "Cats";

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
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
        title: Text("Add Pet",
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
            Text("Pet Information",
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text("Type of Pet",style: TextStyle(color: Colors.black,fontSize: 20),)),
                    SizedBox(width: 110,),
                    Expanded(
                      child: PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)),
                        ),
                        color: Colors.grey,
                        child: Container(
                            height: 50,
                            width: 110,
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
                                  SizedBox(width: 17,),
                                  Text("Cats"),
                                  SizedBox(width: 17,)
                                ],
                              ),
                              value: 'Cats',
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20,),
                                  Text("Dogs"),
                                  SizedBox(width: 20,)
                                ],
                              ),
                              value: 'Dogs',
                            ),
                            PopupMenuItem(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 15,),
                                  Text("Birds"),
                                  SizedBox(width: 15,)
                                ],
                              ),
                              value: 'Birds',
                            )
                          ];
                        },
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 6,),
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
              child: Form(
                key: _formKey1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("Birthdate",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            date = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: 'DD/MM/YYYY',
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
                          date = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "BirthDate is required"  ; // display
                          }
                          else{
                            return null;
                          }

                        },
                      ),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("Age",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.teal,
                        style: TextStyle(color: Colors.grey.shade900),
                        onChanged: (val) {
                          setState(() {
                            age = val;
                          });
                        },
                        decoration: const InputDecoration(
                          fillColor: Color(0xFF949494),
                          filled: true,
                          hintText: 'Enter Pet Age',
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
                          age = value;
                        },
                        validator: (value){
                          if(value == null || value.isEmpty) {
                            return  "Age is required"  ; // display
                          }
                          else{
                            return null;
                          }

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Form(
                key: _formKey3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 200,
                      cursorColor: Colors.teal,
                      style: TextStyle(color: Colors.grey.shade900),
                      onChanged: (val) {
                        setState(() {
                          desc = val;
                        });
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(30),
                        fillColor: Color(0xFF949494),
                        filled: true,
                        hintText: 'Enter Pet Description',
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
                        desc = value;
                      },
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return  "Description is required"  ; // display
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
                  }
                },
                child: Text(
                  'Add Pet',
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