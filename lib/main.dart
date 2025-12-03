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
    return Scaffold( //creamos una hoja en blanco
      appBar: AppBar( //mostramos un titulo y definimos color
        backgroundColor: Colors.orange, //definimos el color de fondo del AppBar
        title: const Text(
          'Libro de recetas',
          style: TextStyle( //modificamos color, tamaño y estilo del texto
            color: Colors.white,
          ),
        ),
      ),
      body: const Center( //mostramos el contenido
        child: Text('Bienvenido al libro de recetas'),
      ),
    );
  }
}