import 'dart:convert'; //importa la librería para decodificar JSON

import 'package:flutter/material.dart';
import 'package:recetario/screens/recipe_detail.dart'; //importa la pantalla de detalles de la receta

import 'package:http/http.dart' as http; //importa la librería http para realizar peticiones

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); //constructor

  Future<List<dynamic>> fetchRecipes() async {
    // Android 10.0.2.2
    // IOS 127.0.0.1
    // WEB
    final url = Uri.parse('http://localhost:3001/recipes'); //URL del servidor local
    final response = await http.get(url); //realiza una petición GET al servidor
    final data = jsonDecode(response.body); //decodifica la respuesta JSON
    return data['recipes']; //retorna la lista de recetas
  }

  @override
  Widget build(BuildContext context) {
    fetchRecipes(); //llama a la función para obtener las recetas
    return Scaffold(
      //crea una hoja en blanco
      body: Column(
        children: <Widget>[_RecipesCard(context), _RecipesCard(context)],
      ),
      floatingActionButton: FloatingActionButton(
        //botón flotante
        onPressed: () {
          _showBottom(context);
        }, //acción al presionar el botón
        backgroundColor: Colors.green[400], //color de fondo del botón
        child: const Icon(Icons.add, color: Colors.white), //icono del botón
      ),
    );
  }

  //función que muestra el modal inferior
  Future<void> _showBottom(BuildContext context) {
    return showModalBottomSheet(
      //muestra un modal desde la parte inferior
      context: context, //contexto de la pantalla
      builder: (contexto) => Container(
        //contenedor del modal
        width: MediaQuery.of(context).size.width, //ancho del contenedor
        height: 500, //altura del contenedor
        color: Colors.white, //color de fondo del contenedor
        child: RecipeForm(), //llama al formulario de receta
      ),
    );
  }

  //función que contiene la tarjeta personalizada
  Widget _RecipesCard(BuildContext context) {
    return GestureDetector(
      onTap: () { //navega a la pantalla de detalles de la receta
        Navigator.push(//
          context, 
          MaterialPageRoute( //crea una ruta de navegación
            builder: (context) => RecipeDetail(recipeName: 'Lasagna') //navega a RecipeDetail pasando el nombre de la receta
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0,), //define el espacio alrededor del contenedor
        child: Container(
          width: MediaQuery.of(context,).size.width, //define el ancho del contenedor
          height: 125, //define la altura del contenedor
          child: Card(
            //crea una tarjeta
            child: Row(
              //organiza los elementos en fila
              children: <Widget>[
                Container(
                  //contiene la imagen
                  height: 125,
                  width: 100,
                  child: ClipRRect(
                    //recorta la imagen en forma de rectángulo
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ), //define el radio de los bordes del rectángulo
                    child: Image.asset(
                      //carga la imagen desde los assets
                      'assets/images/lasana.jpg', //ruta de la imagen
                      fit: BoxFit
                          .cover, //ajusta la imagen para cubrir el contenedor
                    ),
                  ),
                ),
                SizedBox(width: 26), //espacio entre la imagen y el texto
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //centra el texto verticalmente
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //alinea el texto a la izquierda
                  children: <Widget>[
                    //lista de widgets dentro de la columna
                    Text(
                      'LASAÑA',
                      style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                    ),
                    SizedBox(height: 4), //espacio entre el titulo y autor
                    Container(
                      //barra verde decorativa
                      height: 1, //define la altura de la barra
                      width: 75, //define el ancho de la barra
                      color: Colors.green, //define el color de la barra
                    ),
                    Text(
                      'Alison Jimenez',
                      style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//clase estatica para el formulario
class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); //llave global para el formulario

    final TextEditingController _recipeName =
        TextEditingController(); //controlador para el campo de texto
    final TextEditingController _recipeAuthor =
        TextEditingController(); //controlador para el campo de texto
    final TextEditingController _recipeIMG =
        TextEditingController(); //controlador para el campo de texto
    final TextEditingController _recipeDecription =
        TextEditingController(); //controlador para el campo de texto

    return Padding(
      padding: EdgeInsets.all(8), //define el espacio alrededor del formulario
      child: Form(
        key: _formKey, //llave para validar el formulario
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, //alinea los elementos al inicio de la columna
          children: [
            Text(
              'Add New Recipe',
              style: TextStyle(color: Colors.green, fontSize: 24),
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _recipeName, //controlador del campo de texto
              label: 'Recipe Name', //etiqueta del campo de texto
              validator: (value) { //validador del campo de texto
                if (value == null || value.isEmpty) { //verifica si el campo está vacío
                  return 'Please enter the name recipe'; //mensaje de error
                }
                return null; //retorna nulo si el campo es válido
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _recipeAuthor, //controlador del campo de texto
              label: 'Recipe Author', //etiqueta del campo de texto
              validator: (value) { // validador del campo de texto
                if (value == null || value.isEmpty) { //verifica si el campo está vacío
                  return 'Please enter the author name'; //mensaje de error
                }
                return null; //retorna nulo si el campo es válido
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _recipeIMG, //controlador del campo de texto
              label: 'Image URL', //etiqueta del campo de texto
              validator: (value) { //validador del campo de texto
                if (value == null || value.isEmpty) { //verifica si el campo está vacío
                  return 'Please enter the image URL'; //mensaje de error
                }
                return null; //retorna nulo si el campo es válido
              },
            ),
            SizedBox(height: 16),
            _buildTextField(
              maxLines: 4, //número máximo de líneas del campo de texto
              controller: _recipeDecription, //controlador del campo de texto
              label: 'Description', //etiqueta del campo de texto
              validator: (value) { //validador del campo de texto
                if (value == null || value.isEmpty) { //verifica si el campo está vacío
                  return 'Please enter a description'; //mensaje de error
                }
                return null; //retorna nulo si el campo es válido
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton( //botón para enviar el formulario
                onPressed: () { //acción al presionar el botón
                  if (_formKey.currentState!.validate()) { //valida el formulario
                    Navigator.pop(context); //cierra el modal
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, //color de fondo del botón
                  shape: RoundedRectangleBorder( //forma del botón
                    borderRadius: BorderRadius.circular(10), //borde redondeado
                  ),
                ),
                child: Text('Save Recipe', style: TextStyle(
                  color: Colors.white, //color del texto
                  fontSize: 16, //tamaño del texto
                  fontWeight: FontWeight.bold //estilo del texto
                )), //texto del botón
              ),
            )
          ],  
        ),
      ),
    );
  }

  //función que crea un campo de texto personalizado
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,}) {
    return TextFormField(
      //campo de texto para formularios
      controller: controller, //asigna el controlador al campo de texto
      decoration: InputDecoration(
        //decora el campo de texto
        labelText: label, //texto de la etiqueta
        labelStyle: TextStyle(fontFamily: 'Quicksand', color: Colors.green),
        border: OutlineInputBorder(
          //borde del campo de texto
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          //borde cuando el campo está enfocado
          borderSide: BorderSide(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator, //asigna el validador al campo de texto
      maxLines: maxLines, //número máximo de líneas del campo de texto
    );
  }
}
