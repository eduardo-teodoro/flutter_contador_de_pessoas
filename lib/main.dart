//importando bibliotecas
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//todo código começa com o main
void main() {
  //comando para rodar o App
  //passa como parametro um widget do tipo Material
  runApp(MaterialApp(
    //titulo do app, ele é usado internamente, então não é visto em nenhum local '
      title: "Contador de Pessoas",
      //tela inicial
      home: Home()));
}
// criando widget stateful
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

int _people = 0;
String infoText = "pode Entrar!";

void  _changePeople(int delta){
  // para atualizar a tela
  setState(() {
    _people += delta;
    if(_people<0){
      infoText ="Mundo inverto?!";
    }else if( _people<=10){
      infoText ="Pode Entrar!";
    }else{
      infoText ="Lotado";
    }

  });


}


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          //alinhamento da coluna
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas : $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople( 1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(- 1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
