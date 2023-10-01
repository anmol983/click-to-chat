import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:country_code_picker/country_code_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var phone = "";
  var text = "";
  var code = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('WHATSAPP DIRECT MESSAGE'),
      ),
      body: Card(
        margin: EdgeInsets.all(10.0),
        shadowColor: Color.fromARGB(255, 156, 231, 203),
        color: Colors.white30,
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat,
              size: 50.0,
            ),
            Container(
              child: Text("Send Whatsapp message without saving the contact"),
            ),
            Divider(
              color: Colors.black,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: CountryCodePicker(
                      onChanged: (code1) {
                        code = code1.toString();
                      },
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        phone = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "ENTER THE WHATSAPP NUMBER",
                        hintStyle: TextStyle(),
                        icon: Icon(
                          Icons.phone_android_outlined,
                        ),
                        //enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        text = value;
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(),
                        hintText: "ENTER THE MESSAGE",
                        icon: Icon(
                          Icons.message_outlined,
                        ),
                        //enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      code = code.replaceAll("+", "");
                      var _url =
                          Uri.parse('https://wa.me/$code$phone?text=$text');
                      if (!await launchUrl(_url)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: const Text('SEND MESSAGE'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
