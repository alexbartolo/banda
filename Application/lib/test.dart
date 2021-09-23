import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Servizzi(),
    );
  }
}

class Servizzi extends StatelessWidget {

  const Servizzi({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0)
          )
        ),
        leading: Icon(Icons.queue_music_rounded, size: 35.0),
        leadingWidth: 70.0,
        actions: [
          Container(
            width: 30.0,
            child: GestureDetector(
              onTap: () {showMessage(context, "Notifications");},
              child: Icon(Icons.notifications, size: 35.0),
            )
          ),
          Container(
            width: 50.0,
            child: GestureDetector(
              onTap: () {
                const snackBar = SnackBar(content: Text('Account'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);},
              child: Icon(Icons.account_circle_rounded, size: 35.0),
            )
          )
        ],

        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent
        ),
        titleSpacing: 0.0,
        toolbarHeight: 75.0,
        elevation: 0.0,
        title: const Text('Servizzi', style: TextStyle(fontSize: 50))
      ),
      body: Container(

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
