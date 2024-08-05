import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'home_page.dart';
import 'module_4.dart';
//#TODO: Yeni Appbar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: const Mtable(),
      routes: {
        '/Home': (context) => const HomePage(),
        '/M4': (context) => const M4Page(),
      },
    );
  }
}

class Mtable extends StatefulWidget {
  const Mtable({Key? key}) : super(key: key);

  @override
  State<Mtable> createState() => _MtableState();
}

class _MtableState extends State<Mtable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();

  void _submitForm() {
    print('Ne Oldu?: ${_controller1.text}');
    print('Ne Düşünün?: ${_controller2.text}');
    print('Ne Hissettin?: ${_controller3.text}');
    print('Bedeninde neler oldu?: ${_controller4.text}');
    print('Ne yaptın?: ${_controller5.text}');
    print('Kısa Vadede Sonuçlar: ${_controller6.text}');
    print('Uzun Vadede Sonuçlar: ${_controller7.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();
    _controller6.clear();
    _controller7.clear();

    Navigator.pushReplacementNamed(context, '/M4');
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Tablo'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png', // Arka plan resminizin yolu
              fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde ölçekle
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 650),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Öncüller',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller1,
                            decoration: InputDecoration(labelText: 'NE oldu?'),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller2,
                            decoration: InputDecoration(labelText: 'NE düşündün?'),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller3,
                            decoration: InputDecoration(labelText: 'NE hissettin?'),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller4,
                            decoration: InputDecoration(labelText: 'Bedeninde neler oldu?'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Davranış',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller5,
                            decoration: InputDecoration(labelText: 'NE Yaptın?'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sonuç',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller6,
                            decoration: InputDecoration(labelText: 'Kısa Vadede'),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _controller7,
                            decoration: InputDecoration(labelText: 'Uzun Vadede'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Gönder'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
