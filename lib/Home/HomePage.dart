import 'package:flutter/material.dart';
import 'package:split_save/Home/GamesList.dart';
import 'package:split_save/Home/NewGame.dart';
import 'package:split_save/Widgets/UnderlineContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GamesList> games = [GamesList("New Game", 32, 4000)];

  void addGames(){
    GamesList newGame=GamesList("fefb", 6, 2000);
    games.add(newGame);
    setState(() {
    });
  }


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
                    child: Text("DashBoard",
                    style: TextStyle(
                      fontFamily: "Inter",
                      //fontWeight: FontWeight.w500,
                      fontSize: 34
                    ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                      child: Underline(MediaQuery.of(context).size.width*.43)),
                  SizedBox(height: MediaQuery.of(context).size.height*.04,),
                  games.length==0? Container(
                    width: MediaQuery.of(context).size.width*.88,
                    height: MediaQuery.of(context).size.height*.66,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/NoGames.png"
                        )
                      )
                    ),
                  ):
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width*.88,
                          height: MediaQuery.of(context).size.height*.72,
                          child: ListView.builder(
                              itemCount: games.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,

                              itemBuilder: (BuildContext context,int index) {
                              return Container(
                                width: MediaQuery.of(context).size.width*.6,
                                  height: MediaQuery.of(context).size.height*.18,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: <BoxShadow>[BoxShadow(
                                      blurRadius: 5.0,
                                      color: Colors.black38,
                                      offset: Offset(0.0,5.0)
                                    )]
                                  ),

                                    child: MaterialButton(
                                      onPressed: (){},
                                      padding: EdgeInsets.all(0.0),
                                      child: Stack(
                                        children:<Widget>[ Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(games[index].members.toString()+" members",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: "Inter"
                                                ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Total Pool: "+games[index].totalPool.toString(),
                                                  style: TextStyle(
                                                    fontFamily: "Inter",
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),

                                          ],
                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height*.05,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                                                color: Color(0xFF79D30F)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5.0,left: 18.0),
                                                child: Text(games[index].name,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Inter",
                                                    color: Color(0xFFFFFFFF)
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ]),
                                    ),

                          );
                        }
                          ),
                        ),
                      )
                ],
              ),
            )
          ),
        resizeToAvoidBottomInset: false,
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
            child: Image.asset('assets/images/addicon.png'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    ) ;

  }
}


