import 'package:flutter/material.dart';
import 'package:task_flutter/screens/auth/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  _launchURL() async {
    const url =
        '';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 30, bottom: 10),
            child: Text(
              "Settings",
              style: TextStyle( fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 10, bottom: 10),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 28,
                      color: Colors.black
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Please Rate our app We will be waiting for your review ",
                      style: TextStyle( fontSize: 24,color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
            ),
            child: TextButton(
              onPressed: () {
                _launchURL();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.rate_review,
                      color: Colors.black
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Give Your Review",
                    style: TextStyle( fontSize: 24,color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen()),
                          (route) => false);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 100,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: new LinearGradient(
                          colors: [Colors.blueAccent, Colors.blue])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
