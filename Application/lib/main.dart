import 'dart:ui';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  int _currentIndex = 1;
  final List<String> _titles = ["Home", "Servizzi", "Bandisti", "Calendar"];
  String _currentTitle = "";

  @override
  initState() {
    _currentTitle = _titles[_currentIndex];
  }

  //const Servizzi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue[100],
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
                  onTap: () {
                    showMessage(context, "Notifications");
                  },
                  child: const Icon(Icons.notifications, size: 35.0),
                )
            ),
            SizedBox(
                width: 50.0,
                child: GestureDetector(
                  onTap: () {
                    showMessage(context, "Account");
                  },
                  child: const Icon(Icons.account_circle_rounded, size: 35.0),
                )
            )
          ],
          backgroundColor: Colors.blue.shade800,
          foregroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Color(0x00010000)
          ),
          titleSpacing: 0.0,
          toolbarHeight: 75.0,
          elevation: 0.0,
          title: Text(_currentTitle, style: TextStyle(fontSize: 50))
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ShortServizzInfo(),
                ShortServizzInfo(),
                ShortServizzInfo(),
                ShortServizzInfo()
              ]
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext _) {
              return Container(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 24, 30, 40),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
                      child: Wrap(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("New Servizz", style: TextStyle(fontSize: 50, color: Colors.white)),
                                const SizedBox(height: 15),
                                InputField("Feast", Icons.album_outlined, "text"),
                                const SizedBox(height: 15),
                                InputField('Location', Icons.location_on_outlined, "text"),
                                const SizedBox(height: 15),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(child: InputField('Date', Icons.calendar_view_week, 'date')),
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 58.0,
                                        width: 58.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 0),
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                                          //shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            print("Hello");
                                            // You enter here what you want the button to do once the user interacts with it
                                          },
                                          icon: const Icon(
                                            Icons.email,
                                            color: Colors.white,
                                          ),
                                          iconSize: 20.0,
                                        ),
                                      )
                                    ]
                                ),
                                const SizedBox(height: 15),
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(child: InputField('Time', Icons.access_time_sharp, "time")),
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 58.0,
                                        width: 58.0,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 0),
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                                          //shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            print("Hello");
                                            // You enter here what you want the button to do once the user interacts with it
                                          },
                                          icon: const Icon(
                                            Icons.email,
                                            color: Colors.white,
                                          ),
                                          iconSize: 20.0,
                                        ),
                                      )
                                    ]
                                ),
                                const SizedBox(height: 15),
                                InputField('Type of Servizz', Icons.weekend_outlined, "text"),
                                const SizedBox(height: 30),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Button("Add Bandisti"),
                                      const SizedBox(width: 10),
                                      Button("Save"),
                                    ]),

                              ],
                            ),
                          ]
                      )
                  )
              );
            },
            isScrollControlled: true,
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[700],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        backgroundColor: Colors.blue.shade900,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _currentTitle = _titles[value];
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 35.0), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined, size: 35.0),
              label: "Servizzi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined, size: 35.0),
              label: "Bandisti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined, size: 35.0),
              label: "Calendar"),
        ],
      ),
    );
  }
}

class ShortServizzInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Ink(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 4.0, left: 20.0, bottom: 8.0),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Feast", style: TextStyle(fontSize: 50, color: Colors.white)),
                      const SizedBox(height: 10),
                      Row(children: const [
                        Icon(Icons.date_range_rounded, size: 35.0, color: Colors.white),
                        SizedBox(width: 10),
                        Text("Date", style: TextStyle(fontSize: 35, color: Colors.white))
                      ]),
                      Row(children: const [
                        Icon(Icons.location_pin, size: 35.0, color: Colors.white),
                        SizedBox(width: 10),
                        Text("Place", style: TextStyle(fontSize: 35, color: Colors.white))
                      ]),
                      Row(children: const [
                        Icon(Icons.music_note_rounded, size: 35.0, color: Colors.white),
                        SizedBox(width: 10),
                        Text("Banda", style: TextStyle(fontSize: 35, color: Colors.white))
                      ])
                    ]
                )
            ),
            //onTap: () {showMessage(context, "Servizz");}
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext _) {
                  return Container(
                      padding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
                      child: Wrap(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Servizz", style: TextStyle(fontSize: 50, color: Colors.white)),
                                const SizedBox(height: 15),
                                Container(
                                  height: 150.0,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      color: Colors.blueAccent
                                  ),
                                  child: const Center(child: Text("Image", style: TextStyle(fontSize: 40, color: Colors.white))),
                                ),
                                const SizedBox(height: 15),
                                const Text("Feast", style: TextStyle(fontSize: 40, color: Colors.white)),
                                const Text("Feast", style: TextStyle(fontSize: 30, color: Colors.white)),
                                const SizedBox(height: 15),
                                const Text("Location", style: TextStyle(fontSize: 40, color: Colors.white)),
                                const Text("Location", style: TextStyle(fontSize: 30, color: Colors.white)),
                                const SizedBox(height: 15),
                                Row(children: const [
                                  Expanded(child: Text("Date", style: TextStyle(fontSize: 40, color: Colors.white))),
                                  Expanded(child: Text("Time", style: TextStyle(fontSize: 40, color: Colors.white))),
                                ]),
                                Row(children: const [
                                  Expanded(child: Text("Date", style: TextStyle(fontSize: 30, color: Colors.white))),
                                  Expanded(child: Text("Time", style: TextStyle(fontSize: 30, color: Colors.white))),
                                ]),
                                const SizedBox(height: 15),
                                const Text("Type of Servizz", style: TextStyle(fontSize: 40, color: Colors.white)),
                                const Text("Type of Servizz", style: TextStyle(fontSize: 30, color: Colors.white)),
                                const SizedBox(height: 40),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Button("Edit List"),
                                      const SizedBox(width: 10),
                                      Button("View List"),
                                      const SizedBox(width: 10),
                                      Button("Start")
                                    ]),

                              ],
                            ),
                          ]
                      )
                  );
                },
                isScrollControlled: true,
              );


              /*showModalBottomSheet<dynamic>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  //isScrollControlled:true,
                  builder: (BuildContext context){

                    return Container(
                        height: double.infinity,
                      padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Servizz", style: TextStyle(fontSize: 50, color: Colors.white)),
                            const SizedBox(height: 10),
                            const Text("Feast", style: TextStyle(fontSize: 40, color: Colors.white)),
                            const Text("Feast", style: TextStyle(fontSize: 30, color: Colors.white)),
                            const SizedBox(height: 10),
                            const Text("Location", style: TextStyle(fontSize: 40, color: Colors.white)),
                            const Text("Location", style: TextStyle(fontSize: 30, color: Colors.white)),
                            const SizedBox(height: 10),
                            const Text("Location", style: TextStyle(fontSize: 40, color: Colors.white)),
                            const Text("Location", style: TextStyle(fontSize: 30, color: Colors.white)),
                            const SizedBox(height: 10),
                            Row(children: const [
                              Text("Date", style: TextStyle(fontSize: 40, color: Colors.white)),
                              SizedBox(width: 10),
                              Text("Time", style: TextStyle(fontSize: 40, color: Colors.white))
                            ]),
                            Row(children: const [
                              Text("Date", style: TextStyle(fontSize: 30, color: Colors.white)),
                              SizedBox(width: 10),
                              Text("Time", style: TextStyle(fontSize: 30, color: Colors.white))
                            ]),
                            const SizedBox(height: 10),
                            const Text("Type of Servizz", style: TextStyle(fontSize: 40, color: Colors.white)),
                            const Text("Type of Servizz", style: TextStyle(fontSize: 30, color: Colors.white)),


                          ]
                      )
                    );
                  }
              );*/
            }
        )
    );
  }
}

void showMessage(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

class Button extends StatelessWidget {

  Button(this.buttonText);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            child: Text(buttonText),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom:8.0),
                primary: Colors.white,
                onPrimary: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
            )
        )
    );
  }
}

class InputTextField extends StatelessWidget {

  InputTextField(this.inputLabelText, this.icon);
  final String inputLabelText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: inputLabelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
        prefixIcon: Icon(icon,color: Colors.white),
      ),
    );
  }
}

class InputField extends StatefulWidget {

  InputField(this.inputLabelText, this.icon, this.type);
  final String inputLabelText;
  final IconData icon;
  final String type;

  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class TextMask {
  TextInputType textInputType;
  TextEditingController controller;

  TextMask({required this.textInputType, required this.controller});
}

class InputFieldState extends State<InputField> {

  late TextInputType _textInputType;
  late var controller;

  final Map textMasks = {
    'date': TextMask(
        textInputType: TextInputType.number,
        controller: MaskedTextController(mask: '00/00/0000')
    ),
    'time': TextMask(
        textInputType: TextInputType.number,
        controller: MaskedTextController(mask: '00:00')
    ),
    'text': TextMask(
        textInputType: TextInputType.text,
        controller: TextEditingController()
    ),
  };

  void chooseType(){
    if (widget.type == "date") {
      _textInputType = textMasks['date'].textInputType;
      controller = textMasks['date'].controller;
    } else if (widget.type == "time") {
      _textInputType = textMasks['time'].textInputType;
      controller = textMasks['time'].controller;
    } else if (widget.type == "text") {
      _textInputType = textMasks['text'].textInputType;
      controller = textMasks['text'].controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    chooseType();
    return TextField(
      style: const TextStyle(color: Colors.white),
      textCapitalization: TextCapitalization.words,
      keyboardType: _textInputType,
      controller: controller,
      //inputFormatters: [_maskTextInputFormatter.getMask()],
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: widget.inputLabelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
