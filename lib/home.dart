import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double iconSize = 40.0; // Tamaño del icono
  // Estilo de fuente personalizado
  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente', // Nombre de la fuente definido en pubspec.yaml
    fontSize: 22.0, // Tamaño de fuente deseado
    fontWeight: FontWeight
        .bold, // Puedes ajustar el peso de la fuente según tus preferencias
  );

  @override
  Widget build(BuildContext context) {
    // Crear un tema personalizado para la aplicación
    final ThemeData appTheme = ThemeData.dark().copyWith(
      primaryColor:
          Color.fromARGB(255, 214, 19, 165), // Color azul para la AppBar
      scaffoldBackgroundColor:
          Color.fromARGB(255, 46, 44, 44), // Fondo negro del cuerpo
      canvasColor: Color.fromARGB(255, 0, 0, 0), // Fondo oscuro del Drawer
    );

    // Aplicar el tema personalizado a la aplicación
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 179, 8, 93),
          // Barra de navegación superior (AppBar) con un título y un botón de búsqueda
          title: Text("MovieApp-200931"), // Título de la aplicación
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                // Acción a ejecutar cuando se presiona el botón de búsqueda
              },
            ),
          ],
        ),
        drawer: Drawer(
          // Menú lateral (Drawer) que se despliega desde el borde izquierdo
          child: ListView(
            children: <Widget>[
              new DrawerHeader(
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 24,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icono.png'),
                        fit: BoxFit.cover)),
              ), // Elemento del menú "peliculas"
              ListTile(
                title: Text(
                  "Peliculas",
                  style: customTextStyle.copyWith(
                      color: Colors.white), // Texto en blanco
                ),
                trailing: Image.asset(
                  "assets/1.png", // Ruta de la imagen para películas en assets
                  width: iconSize,
                  height: iconSize,
                ),
              ),

              // Separador en el menú
              Divider(
                height: 5.0,
                color: Colors.white, // Línea de separación en blanco
              ),

              // Elemento del menú "Television"
              ListTile(
                title: Text(
                  "Television",
                  style: customTextStyle.copyWith(
                      color: Colors.white), // Texto en blanco
                ),
                trailing: Image.asset(
                  "assets/2.png", // Ruta de la imagen para televisión en assets
                  width: iconSize,
                  height: iconSize,
                ),
              ),

              // Separador en el menú
              Divider(
                height: 5.0,
                color: Colors.white, // Línea de separación en blanco
              ),

              // Elemento del menú "Cerrar"
              ListTile(
                title: Text(
                  "Cerrar",
                  style: customTextStyle.copyWith(
                      color: Colors.white), // Texto en blanco
                ),
                trailing: Image.asset(
                  "assets/3.png", // Ruta de la imagen para cerrar en assets
                  width: iconSize,
                  height: iconSize,
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // Barra de navegación inferior (BottomNavigationBar) con iconos y etiquetas
          items: _obtenerIconos(),
        ),
      ),
      theme: appTheme, // Aplicar el tema personalizado aquí
    );
  }

  // Método para obtener los elementos de la barra de navegación inferior
  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up), // Icono de pulgar hacia arriba
        label: "populares", // Etiqueta para la opción "populares"
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update), // Icono de actualización
        label: "Proximamente", // Etiqueta para la opción "Proximamente"
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star), // Icono de estrella
        label: "Mejor valorados", // Etiqueta para la opción "Mejor valorados"
      ),
    ];
  }
}
