import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fabriapps Academy 4',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildProfileTab(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Perfil de Usuario'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Nombre: Usuario'),
                    Text('Correo: usuario@correo.com'),
                    Image.network('https://url-de-la-imagen.com'),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Productos relacionados a cursos de Inteligencia Artificial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Producto',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Precio',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ver más',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Curso básico de IA')),
                    DataCell(Text('\$100')),
                    DataCell(IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {})),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Curso avanzado de IA')),
                    DataCell(Text('\$200')),
                    DataCell(IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {})),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Curso de IA aplicada')),
                    DataCell(Text('\$300')),
                    DataCell(IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {})),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      _buildProfileTab(context),
      Center(
        child: Text(
          'Ajustes',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fabriapps Academy'),
        leading: Image.asset('assets/logo.png'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Página de Login'),
      ),
    );
  }
}