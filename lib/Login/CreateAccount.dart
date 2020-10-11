import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:split_save/Widgets/UnderlineContainer.dart';
import 'package:split_save/viewmodels/AuthenticationViewModel.dart';
import 'package:stacked/stacked.dart';
import 'LoginPage.dart';
import 'TextEnteringModule.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color _iconColor = Colors.grey;

  TextEditingController nameCont;
  TextEditingController emailCont;
  TextEditingController passwordCont;
  TextEditingController confPasswordCont;

  @override
  void initState() {
    super.initState();
    nameCont = TextEditingController();
    emailCont = TextEditingController();
    passwordCont = TextEditingController();
    confPasswordCont = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      viewModelBuilder: () => AuthenticationViewModel(),
      builder: (context, authenticationViewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                //image: DecorationImage(
                //image: new AssetImage('assets/images/BackgroundLogin.png'),
                //fit: BoxFit.cover,
                //)
                color: Color(0xFFF9F9F9)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 0.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Color(0xFF463EC9),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: MediaQuery.of(context).size.width * .09,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Underline(MediaQuery.of(context).size.width * .63),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .029,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .65,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: MediaQuery.of(context).size.height * .01,
                          left: MediaQuery.of(context).size.width * .05,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .84,
                            height: MediaQuery.of(context).size.height * .58,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: <BoxShadow>[BoxShadow(color: Color(0xFF000000).withAlpha(40), blurRadius: 20.0)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  TextWritting('assets/images/user.png', 'Name', false, nameCont),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * .03,
                                  ),
                                  TextWritting('assets/images/mail.png', 'Email', false, emailCont),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * .03,
                                  ),
                                  TextWritting('assets/images/passwordicon.png', 'Password', true, passwordCont),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * .03,
                                  ),
                                  TextWritting('assets/images/passwordicon.png', 'Confirm Password', true, passwordCont),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * .55,
                          left: MediaQuery.of(context).size.width * .225,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .45,
                            height: MediaQuery.of(context).size.height * .075,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50.0)), color: Color(0xFFF38000)),
                            child: FlatButton(
                              onPressed: () async {
                                if (!(passwordCont.text == confPasswordCont.text)) {
                                  Fluttertoast.showToast(
                                    msg: 'Passwords do not match!',
                                    textColor: Colors.white,
                                    backgroundColor: Colors.red[900],
                                  );
                                  return;
                                }

                                var res = await authenticationViewModel.authenticate(
                                  username: nameCont.text,
                                  email: emailCont.text,
                                  password: passwordCont.text,
                                  aType: AuthType.SIGNUP,
                                );

                                if (res == AuthenticationResult.SUCCESS) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        // TODO: Redirect to dashboard not LoginPage after sign up
                                        return LoginPage();
                                      },
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Could not sign up!',
                                    textColor: Colors.white,
                                    backgroundColor: Colors.red[900],
                                  );
                                }
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'PoppinsMed', fontSize: 22.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
