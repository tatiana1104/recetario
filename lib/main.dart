import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recetario',
      home: RecipeBook(),
    );
  }
}

//clase dinamica
class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //se crea una hoja en blanco
      appBar: AppBar( //se muestra titulo y define color
        backgroundColor: Colors.green[400], //define el color de fondo del AppBar
        title: const Text(
          'Libro de recetas',
          style: TextStyle( //modifica color, tamaño y estilo del texto
            color: Colors.white,
          ),
        ),
      ),

      //se muestra el contenido de la app
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