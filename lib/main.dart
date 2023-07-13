import 'package:flutter/material.dart';
import 'package:app_contactos/Pages/home_Page.dart';
import 'package:app_contactos/responsive/responsive_layout.dart';
import 'package:app_contactos/responsive/mobil_body.dart';
import 'package:app_contactos/responsive/tablet_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contactos',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
          mobileBody: MobilePage(),
          tabletBody: TabletPage(),
          desktopBody: HomePage()
      ),
    );
  }
}