import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); //constructor

@override
  Widget build(BuildContext context) {
    return Scaffold( //crea una hoja en blanco
      body: column( //organiza los elementos en columna
        children <Widget>[ //lista de widgets dentro de la columna
          _RecipesCard(context), //llama a la función que contiene la tarjeta personalizada
          _RecipesCard(context),
        ],
      )
    );
  }

  //función que contiene la tarjeta personalizada
  Widget _RecipesCard(BuildContext context){
    return Padding( 
      padding: const EdgeInsets.all(8.0), //define el espacio alrededor del contenedor
      child: Container(
        width: MediaQuery.of(context).size.width, //define el ancho del contenedor
        height: 125, //define la altura del contenedor
        child: Card( //crea una tarjeta
          child: Row( //organiza los elementos en fila
            children: <Widget>[
              Container( //contiene la imagen
                height: 125, 
                width: 100,
                decoration: BoxDecoration( //decora el contenedor
                  borderRadius: BorderRadius.circular(12.0), //define el radio de los bordes
                  color: Colors.green, //define el color de fondo
                ),
              ),
              SizedBox(width: 26), //espacio entre la imagen y el texto
              Column(
                mainAxisAlignment: MainAxisAlignment.center, //centra el texto verticalmente
                crossAxisAlignment: CrossAxisAlignment.start, //alinea el texto a la izquierda
                children: <Widget>[ //lista de widgets dentro de la columna
                  Text('LASAÑA', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  SizedBox(height: 4), //espacio entre el titulo y autor
                  Container( //barra verde decorativa
                    height: 1, //define la altura de la barra
                    width: 75, //define el ancho de la barra
                    color: Colors.green, //define el color de la barra
                  ),
                  Text('Alison Jimenez', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      );
    )
  }
}
