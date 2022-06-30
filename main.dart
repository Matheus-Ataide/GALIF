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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF25305),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_sharp, color: Color(0xFF571F04), size: 45),

        backgroundColor: const Color(0xFFF4DE9C),
        toolbarHeight: 120,

        title:Text("GALIF", style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold, color: Color(0xFF571F04),),),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(59),
          ),
        ),
      ),
      //body

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox( height: 2),

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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xFFF4DE9C),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert, size: 40,),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, size: 40,),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 40,),
            label: 'Chats',
          ),
          //currentIndex: _selectedIndex, //New
          //onTap: _onItemTapped,
        ],
      ),
    );
  }
  void onPressedButton() { }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
