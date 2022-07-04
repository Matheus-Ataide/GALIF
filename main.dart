import 'package:flutter/material.dart';

void main() => runApp(MyApp());
int _selectedIndex = 0; //New

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
    );
  }
}


/*class NewPageScreen extends StatelessWidget { //classe para a mudança de página ao clicar o botao do BottomNavigationBar
  final String texto;

  NewPageScreen(this.texto);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}*/


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  int _indiceAtual = 1; //bottomNavigation / Contador
  final List<Widget> _telas = [//bottomNavigation
    //NewPageScreen("Meus pedidos"),
    //NewPageScreen("teste 2"),
    //NewPageScreen("Favoritos")
  ]; //bottomNavigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF25305),
      //onTap: onTabTapped,
      appBar: AppBar(
        leading: Icon(
            Icons.arrow_back_sharp, color: Color(0xFF571F04), size: 45),

        backgroundColor: const Color(0xFFF4DE9C),
        toolbarHeight: 120,

        title: Text("GALIF", style: TextStyle(fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF571F04),),),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(59),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.network(
                'https://i.ibb.co/ZzCVW80/gabiogol.jpg',
                width: 200,
                height: 300,
                //fit: BoxFit.fitHeight,
              ),

              SizedBox(height: 2),


              ElevatedButton(
                onPressed: onPressedButton,
                child: const Text(
                  'INSERIR',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF571F04),
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF4DE9C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, //retirar label
        showUnselectedLabels: false, //retirar label ao ser selecionada
        backgroundColor: const Color(0xFFF4DE9C), //cor da barra do BottomNavigationBar
        currentIndex: _indiceAtual,
        onTap: onTabTapped, //ação ao clicar no icone
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert, size: 40),
              label: "Minha conta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse_outlined, size: 40),
              label:"Meus pedidos"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 40),
              label: "Favoritos"
          ),
        ],
      ),
    );
  }


  void onTabTapped(int index) { //colocar a ação que será feita ao clicar nos botões
    setState(() {
      _indiceAtual = index;
    });
  }


  void onPressedButton() {}

}
