import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:chatapp/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:chatapp/views/forgot_password.dart';

//import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/helper/theme.dart';
//import 'package:chatapp/services/auth.dart';
//import 'package:chatapp/services/database.dart';
//import 'package:chatapp/views/chatrooms.dart';
//import 'package:chatapp/views/forgot_password.dart';
//import 'package:chatapp/widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:chatapp/views/signup.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  var status = prefs2.getInt('intvalue');
  print(status);
  // runApp(MaterialApp( debugShowCheckedModeBanner:false,home:ChatRoom()));
  if(status==1)
  {
     runApp(MaterialApp( debugShowCheckedModeBanner:false,home:ChatRoom()));
  }
  else{
     runApp(MaterialApp( debugShowCheckedModeBanner:false,home:MyApp()));
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  Future<void> set() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setInt("intvalue", 1);
  }

  signIn() async {
      setState(() {
        isLoading = true;
      });
      

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text.trim(), passwordEditingController.text.trim())
          .then((result) async {
           
        if (result == null)  {
          
          /*QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);*/

        
        } else {
          set();
           Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
      appBar: appBarMain(context),
      body:Center(
        child: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(

                                 children: <Widget>[
                                   Text("SignIn",style: TextStyle(
                                       color: Colors.blueAccent,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 30,
                                       fontFamily: 'design.graffiti.comicsansms'),),
                                   Expanded(
                                     child:Text(" "),
                                   ),
                                 ],
                               ),
                        TextFormField(
                         /* validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Please Enter Correct Email";
                          },*/
                          controller: emailEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("email"),
                        ),
                        TextFormField(
                          obscureText: true,
                        /*  validator: (val) {
                            return val.length > 6
                                ? null
                                : "Enter Password 6+ characters";
                          },*/
                          style: simpleTextStyle(),
                          controller: passwordEditingController,
                          decoration: textFieldInputDecoration("password"),
                        ),
                      
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0.25),
                            child: Text(
                              "Forgot Password?",
                              style: fgtpwdTextStyle(),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xaa007EFF),
                              const Color(0xff2A95BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign In",
                        style: btnTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                       gradient: LinearGradient(
                            colors: [
                              const Color(0xaa057EF4),
                              const Color(0xff2A35CB)
                            ],
                          )),
                        
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign In with Google",
                      style: btnTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: bottomTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                          return (SignUp());
                        }));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
      ),
    ),
    );
  }
}
