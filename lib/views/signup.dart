import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/helper/theme.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/chatrooms.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController confpasswordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController contactTextEditingController = new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp()  {
    print("bhavy");
    setState(() {

        isLoading = true;
      });

       authService.signUpWithEmailAndPassword(emailEditingController.text.trim(),
          passwordEditingController.text.trim()).then((result){
            if(result != null){

              Map<String,String> userDataMap = {
                "userName" : usernameEditingController.text,
                "userEmail" : emailEditingController.text,
                "userContact" : contactTextEditingController.text,
              };

              databaseMethods.addUserInfo(userDataMap);

             /* HelperFunctions.saveUserLoggedInSharedPreference(true);
              HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
              HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);*/

              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ChatRoom()
              ));
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
      body: Center(
        child:isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child:SingleChildScrollView(
        child: Column(
          children: [
                  Row(
                                 children: <Widget>[
                                   Text("SignUp",style: TextStyle(
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
                    style: simpleTextStyle(),
                    controller: usernameEditingController,
                    /*validator: (val){
                      return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                    },*/
                    decoration: textFieldInputDecoration("Username"),
                  ),
                  TextFormField(
                    controller: emailEditingController,
                    style: simpleTextStyle(),
                   /*validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                    },*/
                    decoration: textFieldInputDecoration("Email"),
                  ),
                  TextFormField(
                    maxLines: null,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: simpleTextStyle(),
                    controller: contactTextEditingController,
                    decoration: textFieldInputDecoration("Contact No."),
                  ),
                  TextFormField(
                    obscureText: true,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Password"),
                    controller: passwordEditingController,
                    /*validator:  (val){
                      return val.length < 6 ? "Enter Password 6+ characters" : null;
                    },*/
                  ),
                  TextFormField(
                    obscureText: true,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Confirm Password"),
                    controller: confpasswordEditingController,
                    /*validator:  (val){
                      if(val != password) {
                        return 'password must match' ;
                      }
                    },*/
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                singUp();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [const Color(0xaa007EFF), const Color(0xff2A95BC)],
                    )),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Sign Up",
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
                      colors: [const Color(0xaa057EF4), const Color(0xff2A35CB)],
                    )),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Sign Up with Google",
                style: btnTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: bottomTextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  MyApp();
                }));
                  },
                  child: Text(
                    "SignIn now",
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
      ),
    );
  }
}
