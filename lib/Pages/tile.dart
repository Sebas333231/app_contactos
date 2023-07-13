import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final _controller = TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: 250,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(
                    FontAwesomeIcons.envelope,
                    size: 17,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    name = _controller.text;
                  });
                },
                child: const Text(
                    'Aceptar'
                )
            )
          ],
        ),
      )
    );
  }
}
