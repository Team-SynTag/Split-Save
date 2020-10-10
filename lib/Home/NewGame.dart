import 'package:flutter/material.dart';
import 'package:split_save/Widgets/UnderlineContainer.dart';

class AddNewGame extends StatefulWidget {
  @override
  _AddNewGameState createState() => _AddNewGameState();
}

class _AddNewGameState extends State<AddNewGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.12,right: MediaQuery.of(context).size.width*.04),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height*.1,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("New Game",
                      style: TextStyle(
                          fontFamily: "Inter",
                          //fontWeight: FontWeight.w500,
                          fontSize: 34
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Underline(MediaQuery.of(context).size.width*.45)),
                  SizedBox(height: MediaQuery.of(context).size.height*.04,),
                  Container(
                    width: MediaQuery.of(context).size.width*.88,
                    height: MediaQuery.of(context).size.height*.66,
                    decoration: BoxDecoration(

                    ),
                  )
                ],
              ),
            )
        ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){return AddNewGame();}
              ));
            },
            splashColor: Colors.green,

            backgroundColor: Color(0xFF70D93F),
            child: Image.asset('assets/images/Done.png'),
          ),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
