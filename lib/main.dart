import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTac(),
    );
  }
}

class TicTac extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TicTacState();
  }
}

class TicTacState extends State<TicTac>{

  String _p1Name = 'X';
  String _p2Name = '0';

  List<String> _displayElement = ['', '', '', '', '', '', '', '', ''];

  //false = X and true = 0
  bool _turn = false;
  int _xScore = 0;
  int _0Score = 0;


  void _signTask(int num){
    setState(() {
      if(_turn && _displayElement[num]==''){
        _displayElement[num] = 'X';
      }
      else if (!_turn && _displayElement[num] == ''){
        _displayElement[num] = '0';
      }
    });

    _turn = !_turn;
    _winnerCheck();
  }

  void _clearBoard(){
    setState(() {
      for(int i =0 ; i<_displayElement.length ; i++){
        _displayElement[i] = '';
      }
    });
  }

  void _clearAll(){
    setState(() {
      for(int i =0 ; i<_displayElement.length ; i++){
        _displayElement[i] = '';
      }
      _0Score=0;
      _xScore=0;
    });
  }

  void _winnerCheck(){
    if(_displayElement[0] == _displayElement[1] &&
        _displayElement[0] == _displayElement[2] &&
        _displayElement[0] != ''
    ){
      _displayWinner(_displayElement[0]);
      switch (_displayElement[0]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }
    if(_displayElement[3] == _displayElement[4] &&
        _displayElement[3] == _displayElement[5] &&
        _displayElement[3] != ''
    ){
      _displayWinner(_displayElement[3]);
      switch (_displayElement[3]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }
    if(_displayElement[6] == _displayElement[7] &&
        _displayElement[6] == _displayElement[8] &&
        _displayElement[6] != ''
    ){
      _displayWinner(_displayElement[6]);
      switch (_displayElement[6]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }


    if(_displayElement[0] == _displayElement[3] &&
        _displayElement[0] == _displayElement[6] &&
        _displayElement[0] != ''
    ){
      _displayWinner(_displayElement[0]);
      switch (_displayElement[0]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }

    if(_displayElement[1] == _displayElement[4] &&
        _displayElement[1] == _displayElement[7] &&
        _displayElement[1] != ''
    ){
      _displayWinner(_displayElement[1]);
      switch (_displayElement[1]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }

    if(_displayElement[2] == _displayElement[5] &&
        _displayElement[2] == _displayElement[8] &&
        _displayElement[2] != ''
    ){
      _displayWinner(_displayElement[2]);
      switch (_displayElement[2]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }



    if(_displayElement[0] == _displayElement[4] &&
        _displayElement[0] == _displayElement[8] &&
        _displayElement[0] != ''
    ){
      _displayWinner(_displayElement[0]);
      switch (_displayElement[0]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }

    if(_displayElement[2] == _displayElement[4] &&
        _displayElement[2] == _displayElement[6] &&
        _displayElement[2] != ''
    ){
      _displayWinner(_displayElement[2]);
      switch (_displayElement[2]){
        case '0':
          _0Score++;
          break;

        case 'X':
          _xScore++;
          break;
      };
    }
  }

  void _displayWinner(String _winner){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            elevation: 28,
            title: Text('$_winner Wins !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
                  elevation: WidgetStatePropertyAll(5),

                ),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TicTac',
      home: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text("TicTacToe", style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold)),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                Expanded(
                  flex:1,
                  child: GridView.builder(
                    itemCount:9,
                    itemBuilder:(context , index){
                      return GestureDetector(
                        onTap: (){
                          _signTask(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              _displayElement[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black,
                        offset: Offset(3, 3),
                        blurRadius: 10,
                      )],
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Player X : $_xScore',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Text('Player 0 : $_0Score',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStatePropertyAll(19),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                          child:Icon(Icons.delete,size: 49),
                          onPressed: (){
                            _clearAll();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}