import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'converter_kotlin.dart';

void main() => runApp(const MaterialApp(
      home: converterUI(),
    ));

class converterUI extends StatefulWidget {
  const converterUI({super.key});

  @override
  State<converterUI> createState() => _converterUIState();
}

class _converterUIState extends State<converterUI> {
  late TextEditingController controller;
  String text = '';
  String convertedText = '...';
  Converter converter = Converter();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  int maxLength = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.grey[900]),
        title: const Text(
          'Decimal Text Converter',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter a Decimal Number to Convert",
                  style: TextStyle(color: Colors.white54, fontSize: 20),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  controller: controller,
                  onChanged: (String value) {
                    setState(() {
                      text = value;
                      num? number = num.tryParse(text);
                      if (number != null) {
                        convertedText = converter.operation(number);
                      } else {
                        convertedText = "Invalid input";
                      }
                    });
                  },
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(10),
                      color: Colors.black38
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      convertedText,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
