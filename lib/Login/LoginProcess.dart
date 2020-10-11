import 'package:flutter/material.dart';
import 'package:split_save/Login/CreateAccount.dart';
import 'package:split_save/Login/LoginPage.dart';

class LoginProcess1 extends StatefulWidget {
  @override
  _LoginProcess1State createState() => _LoginProcess1State();
}

class _LoginProcess1State extends State<LoginProcess1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/images/LoginPage2.png'),
                fit: BoxFit.fill,
              ),
              color: Color(0xFF13548A)),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Stack(children: <Widget>[
              Positioned(
                  top: MediaQuery.of(context).size.height * .1,
                  child: Container(
                    child: Text(
                      "splitsave",
                      style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 50),
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xFF70D93F),
                      ),
                      child: FlatButton(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'PoppinsMed', fontSize: 22.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Color(0xFFF8F8F8).withOpacity(0.2),
                      ),
                      child: FlatButton(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'PoppinsMed', fontSize: 22.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return CreateAccount();
                          }));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
