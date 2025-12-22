import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); //constructor

@override
  Widget build(BuildContext context) {
    return Scaffold( //crea una hoja en blanco
      body: Column(
        children: <Widget>[
        _RecipesCard(context),
        _RecipesCard(context),
      ],
      ),
      floatingActionButton: FloatingActionButton( //botón flotante
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
    return showModalBottomSheet( //muestra un modal desde la parte inferior
      context: context, //contexto de la pantalla
      builder: (contexto) => Container( //contenedor del modal
        width: MediaQuery.of(context).size.width, //ancho del contenedor
        height: 500, //altura del contenedor
        color: Colors.white, //color de fondo del contenedor
        child: RecipeForm(), //llama al formulario de receta
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
                child: ClipRRect( //recorta la imagen en forma de rectángulo
                  borderRadius: BorderRadius.circular(12.0), //define el radio de los bordes del rectángulo
                  child: Image.asset( //carga la imagen desde los assets
                    'assets/images/lasagna.jpg', //ruta de la imagen
                    fit: BoxFit.cover, //ajusta la imagen para cubrir el contenedor
                  ),
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
      ),
    );
  }
}

//clase estatica para el formulario
class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8), //define el espacio alrededor del formulario
        child: Form(
          //key: _formKey, //llave para validar el formulario
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start, //alinea los elementos al inicio de la columna
            children: [
              Text(
                'Add New Recipe',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              _buildTextField(label: 'Recipe Name') //llama a la función para crear el campo de texto
            ],
          ),
        ));
  }

  //función que crea un campo de texto personalizado
  Widget _buildTextField({required String label}) {
    return TextFormField( //campo de texto para formularios
      decoration: InputDecoration( //decora el campo de texto
        labelText: label, //texto de la etiqueta
        labelStyle: TextStyle( 
          fontFamily: 'Quicksand',
          color: Colors.green,
        ),
        border: OutlineInputBorder( //borde del campo de texto
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder( //borde cuando el campo está enfocado
          borderSide: BorderSide(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}