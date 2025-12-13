import 'package:flutter/material.dart';

//importar los archivos de las diferentes pantallas
import 'package:recetario/screens/home_screen.dart';

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
    return DefaultTabController(
      length: 4, //numero de pestañas
      child: Scaffold( //se crea una hoja en blanco
        appBar: AppBar( //se muestra titulo y define color
          backgroundColor: Colors.green[400], //define el color de fondo del AppBar
          title: const Text(
            'Libro de recetas',
            style: TextStyle( //modifica color, tamaño y estilo del texto
              color: Colors.white,
            ),
          ),
          //me permite navegar entre pantallas
          bottom: TabBar(
            //define las pestañas
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green[100],
            tabs: [
              //primera pantalla
              Tab(icon: Icon(Icons.home),
                text: 'Home')
            ]
          ),
        ),
      
        //se muestra el contenido de la app
        body: 
        TabBarView(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}


