import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../apps/facebook.dart';
import 'favorite_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  final _controller = TextEditingController();
  final _apellido = TextEditingController();
  final _telefono = TextEditingController();
  final _empresa = TextEditingController();

  late AnimationController _animationController;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;

  final _text = 'La admiración';

  final List<Personas> _personas = [
    Personas('Mark', 'zuckerberg', '+1112234556', 'mark.jpeg', 'Facebook',
        'https://www.biografiasyvidas.com/biografia/z/zuckerberg.htm'),
    Personas('Larry', 'Page', '+134556', 'larry.jpeg', 'Google',
        'https://es.wikipedia.org/wiki/Larry_Page'),
    Personas('Bill', 'Gates', '+1112234556', 'bill.jpeg', 'Facebook',
        'https://es.wikipedia.org/wiki/Bill_Gates'),
    Personas('Elon', 'Musk', '+3214664', 'elon.jpeg', 'Tesla', 'https://es.wikipedia.org/wiki/Elon_Musk')
  ];
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
        vsync: this,
    )..repeat(reverse: true);
    _styleTween = TextStyleTween(
      begin: const TextStyle(fontSize: 30, color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontFamily: 'Comic WSans MS'),
      end: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)
    );
    _curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut
    );
  }
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: DefaultTextStyleTransition(
            style: _styleTween.animate(_curvedAnimation),
            child: Text(
              _text
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext) => Facebook()
                    )
                  );
                },
                icon: Icon(FontAwesomeIcons.facebook),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: (){},
                icon: Icon(FontAwesomeIcons.google),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: (){},
                icon: Icon(FontAwesomeIcons.microsoft),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: IconButton(
                onPressed: (){},
                icon: Icon(FontAwesomeIcons.twitter),
              ),
            ),
          ],
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, childAspectRatio: (0.9)),
            itemCount: _personas.length,
            itemBuilder: (context, index) {
              var item = _personas[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]
                ),
                child: Card(
                    child: SingleChildScrollView(
                      child: Container(
                        height: 420,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF8A2387),
                              Color(0xFFE94057),
                              Color(0xFFF27121)
                            ],
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: IconButton(
                                      onPressed: () {
                                        this._borrarPersona(
                                            context, _personas[index]);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.delete,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: IconButton(
                                      onPressed: () {
                                        showDialogFunc(context, _personas[index]);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.pen,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: IconButton(
                                      onPressed: () {
                                        this._Advertencia(
                                            context);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.photo,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: IconButton(
                                      onPressed: () {
                                        this._Advertencia(context);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.camera,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image(
                                    image: AssetImage(
                                      '../image/' + _personas[index].Image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  _personas[index].name +
                                      ' ' +
                                      _personas[index].lastname,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text('Telefono: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(_personas[index].phone,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text('Empresa: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(_personas[index].empresa,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 5),
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                String url = _personas[index].urll;
                                                final Uri _url = Uri.parse(url);

                                                await launchUrl(_url);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white),
                                              child: const Text(
                                                'Biografia',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                        ),
                                      ],
                                    )),
                              )
                            ]),
                      ),
                    )),
              );
            }));
  }
  _Advertencia(context, ){
    showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: const Text('Advertencia', style: TextStyle(fontWeight: FontWeight.bold),),
        content: const Text('Lo sentimos, No se ha generado una función aún'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
            child: const Text(
              'Aceptar',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),

          ),
        ],
      ),
    );
  }

  _borrarPersona(context, Personas _personas) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: const Text(
            'Eliminar card',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Estas seguro de eliminar a ' + _personas.name + '?',
            style: const TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                this.setState(() {
                  this._personas.remove(_personas);
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text(
                'Eliminar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ]),
    );
  }
  showDialogFunc(context, Personas _personas) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2))
                  ]),
              padding: const EdgeInsets.all(35),
              height: 400,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        suffixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 17,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: _apellido,
                      decoration: const InputDecoration(
                        labelText: 'Apellido',
                        suffixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 17,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: _telefono,
                      decoration: const InputDecoration(
                        labelText: 'Telefono',
                        suffixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 17,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: TextField(
                      controller: _empresa,
                      decoration: const InputDecoration(
                        labelText: 'Empresa',
                        suffixIcon: Icon(
                          FontAwesomeIcons.envelope,
                          size: 17,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _personas.name = _controller.text;
                          _personas.lastname = _apellido.text;
                          _personas.phone = _telefono.text;
                          _personas.empresa = _empresa.text;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF8A2387),
                                Color(0xFFE94057),
                                Color(0xFFF27121)
                              ]),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Aceptar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Personas {
  late String name;
  late String lastname;
  late String phone;
  late String Image;
  late String empresa;
  late String urll;

  Personas(name, lastname, phone, Image, empresa, urll) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
    this.Image = Image;
    this.empresa = empresa;
    this.urll = urll;
  }
}
