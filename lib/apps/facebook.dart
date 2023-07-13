import 'package:flutter/material.dart';

class Facebook extends StatefulWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35, top: 30),
            child: Text(
              'Facebook',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ]),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50, top: 70),
              child: SingleChildScrollView(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text('Historia'),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
