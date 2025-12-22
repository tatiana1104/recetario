import 'package:flutter/material.dart'; //importa el paquete de Flutter para construir interfaces de usuario

//clase estatica
class RecipeDetail extends StatelessWidget {
  final String recipeName; //definición de una variable final para el nombre de la receta
  const RecipeDetail({super.key, required this.recipeName}); //constructor que recibe el nombre de la receta

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //barra de navegación superior
        title: Text(recipeName), //muestra el nombre de la receta en el título  
        backgroundColor: Colors.green, //color de fondo de la barra de navegación
        leading: IconButton(
          icon: Icon(Icons.arrow_back), //icono de retroceso
          color: Colors.white , //color del icono
          onPressed:() {
            Navigator.pop(context); //regresa a la pantalla anterior
          }
        ), 
      ),
    );
  }
}