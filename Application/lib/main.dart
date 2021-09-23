import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => Servizzi();
}

class Servizzi extends State<Test> {

  int _currentIndex = 0;
  String _currentTitle = "Home";

  final List<String> _titles = ["Home", "Servizzi", "Bandisti", "Calendar"];

  //const Servizzi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        /*shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0)
          )
        ),*/
        leading: const Icon(Icons.queue_music_rounded, size: 35.0),
        leadingWidth: 70.0,
        actions: [
          SizedBox(
            width: 30.0,
            child: GestureDetector(
              onTap: () {showMessage(context, "Notifications");},
              child: const Icon(Icons.notifications, size: 35.0),
            )
          ),
          SizedBox(
            width: 50.0,
            child: GestureDetector(
              onTap: () {
                const snackBar = SnackBar(content: Text('Account'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);},
              child: const Icon(Icons.account_circle_rounded, size: 35.0),
            )
          )
        ],

        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent
        ),
        titleSpacing: 0.0,
        toolbarHeight: 75.0,
        elevation: 0.0,
        title: Text(_currentTitle, style: TextStyle(fontSize: 50))
      ),
      body: Container(

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        backgroundColor: Colors.blue.shade700,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _currentTitle = _titles[value];
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 35.0),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined, size: 35.0),
            label: "Servizzi"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined, size: 35.0),
            label: "Bandisti"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined, size: 35.0),
            label: "Calendar"
          ),
        ],
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
