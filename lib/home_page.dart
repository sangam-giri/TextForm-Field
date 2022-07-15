import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  var _passwordError;

  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[


          /*TextField for the Password Field*/
          TextField(
          controller: _passwordController,
            decoration: InputDecoration(
              hintText: "Password",
            labelText: "Password",
            border: OutlineInputBorder(),

            errorText: _passwordError, 
            


            suffixIcon: IconButton(onPressed: (){
              setState(() {
                _secureText = !_secureText;
              });
            },
            icon: Icon(_secureText ? Icons.remove_red_eye: Icons.remove_red_eye_outlined),
            ),

            ),

            obscureText: _secureText,
          ),



          /*TextForm Filed*/
          Form(
          key: _formKey,
          child: TextFormField(
           validator: (value) {
            //  if(value!.isEmpty || RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)){
             if(value!.isEmpty || RegExp(r'^[0-9]+$').hasMatch(value)){
               return "Enter valid password";
             }else{
               return null;
             }
             
           },
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
          
        ),




        /*Elevated Button*/

          ElevatedButton(onPressed: (){
            print(_passwordController.text);
          //This has to be done inside setState then only the UI will get refreshed
          setState(() {
            _formKey.currentState!.validate();
               if(_passwordController.text.length < 8 ){
              _passwordError = "Enter atleast 8 characters";
            }
            else{
              _passwordError = null;
            }
          });

          },
          child: Text("Click here"),),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    
  }
} 
    