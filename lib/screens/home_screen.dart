import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        width: MediaQuery.of(context).size.width, //define el ancho del contenedor
        height: 125, //define la altura del contenedor
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                height: 125, 
                width: 100,
                child: ClipRRect( //permite que la imagen tenga bordes circulares
                  borderRadius: BorderRadius.circular(10.0), //borde circular
                  child: Container( //llama a la función que contiene la imagen

                  ), 
                ),
              ),
              SizedBox(width: 26), //espacio entre la imagen y el texto
              Column(
                children: <Widget>[
                  Text('LASAÑA'),
                  Text('Alison Jimenez'),
                  Container(
                    height: 1,
                    width: 75,
                    color: Colors.green,
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
