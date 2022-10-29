import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/screens/auth/bashboard.dart';
import 'package:task_flutter/services/login_service.dart';

import '../../utils/show_toast.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                height: 200,
                child: CachedNetworkImage(
                  placeholder:(b,c)=> Container(width: 50,height: 50,child: CircularProgressIndicator()),

                  fit: BoxFit.fill,
                  imageUrl: 'https://i.postimg.cc/d3WfNYX8/signup.png',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "Email"),
                  controller: emailController,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          LoginServices.login(
                                  api: "https://reqres.in/api/login",
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context)
                              .then((value) => {
                                    if (value.token != null)
                                      {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DashBoardScreen()),
                                            (route) => false)
                                      }
                                  });
                        }else{
                          Alert.createToastByPassingMessage(message: "Please Enter A Valid E-Mail And Password");
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(
                                colors: [Colors.blueAccent, Colors.blue])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Or",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Sign In With Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
