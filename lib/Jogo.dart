import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  //variavel
  String _result = 'Escolha uma oção a baixo!';
  var _imageApp = AssetImage("imagens/padrao.png");

  _selectOption(String optionUser){
    var options = ["pedra", "papel", "tesoura"];
    var escolhaApp = options[Random().nextInt(options.length)];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imageApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    if(optionUser == "tesoura" && escolhaApp =="papel"){
      setState(() {
        _result = "Você ganhou :D";
      });
    }else if(optionUser == "papel" && escolhaApp == "pedra"){
      setState(() {
        _result = "Você ganhou :D";
      });
    }else if(optionUser == "pedra" && escolhaApp == "tesoura"){
      setState(() {
        _result = "Você ganhou :D";
      });
    }else if(optionUser ==  escolhaApp ){
      setState(() {
        _result = "Empate!!";
      });
    }else{
      setState(() {
        _result = "Você perdeu :(";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JakemPo",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Image(image: this._imageApp,),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(_result,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: ()=> _selectOption("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: ()=> _selectOption("papel"),
                child: Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: ()=> _selectOption("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100,),
              ),
            ],
          ),
          //image
          //text
          //image
        ],
      ),
    );
  }
}
