import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final double iconSize = 40.0;
  final TextStyle customTextStyle = TextStyle(
    fontFamily: 'MiFuente',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 19, 168, 214),
        scaffoldBackgroundColor: Color.fromARGB(255, 46, 44, 44),
        canvasColor: Color.fromARGB(255, 0, 0, 0),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 200, 26, 223),
          title: Text("MovieApp-200931"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // Acción a ejecutar cuando se presiona el botón de búsqueda
              },
            ),
          ],
        ),
        drawer: _buildDrawer(context),
        body: Center(
          // Contenido de tu aplicación
          child: Text(
            "Contenido de la aplicación",
            style: TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(), // Contenido del DrawerHeader
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icono.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          _buildDrawerItem(context, "Peliculas", "assets/1.png"),
          _buildDivider(),
          _buildDrawerItem(context, "Television", "assets/2.png"),
          _buildDivider(),
          _buildDrawerItem(context, "Cerrar", "assets/3.png"),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, String imagePath) {
    return ListTile(
      title: Text(
        title,
        style: customTextStyle,
      ),
      leading: Image.asset(
        imagePath,
        width: iconSize,
        height: iconSize,
      ),
      onTap: () {
        if (title == "Cerrar") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
        // Realiza otras acciones si es necesario
      },
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 5.0,
      color: Colors.white,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _obtenerIconos(),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        label: "Populares",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        label: "Proximamente",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        label: "Mejor valorados",
      ),
    ];
  }
}
