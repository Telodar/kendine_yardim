import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'login.dart';
import 'home_page.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_6.dart';
import 'module_7.dart';
import 'module_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: const M5Page(),
      routes: {
        '/Home': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M4': (context) => const M4Page(),
        '/M6': (context) => const M6Page(),
        '/M7': (context) => const M7Page(),
      },
    );
  }
}

class M5Page extends StatefulWidget {
  const M5Page({super.key});

  @override
  State<M5Page> createState() => _M5PageState();
}

class _M5PageState extends State<M5Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  void _submitForm() {
    print('Cevap 1: ${_controller1.text}');
    print('Cevap 2: ${_controller2.text}');
    print('Cevap 3: ${_controller3.text}');
    print('Cevap 4: ${_controller4.text}');
    print('Cevap 5: ${_controller5.text}');

    _controller1.clear();
    _controller2.clear();
    _controller3.clear();
    _controller4.clear();
    _controller5.clear();

    // Formu gönderdikten sonra M6Page'e yönlendirme
    Navigator.pushNamed(context, '/M6');
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Modül 5'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home');
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 650),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Ortala
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
                    _buildQuestionContainer(
                      "Şimdi bu kontrol yöntemleri ile ilgili aşağıdaki soruları kendinize sorun ve her birini cevapladıktan sonra diğer soruya geçiniz.",
                      _controller1,
                    ),
                    _buildQuestionContainer(
                      "Kontrol yöntemi uyguladığımda içsel deneyimle (duygu, düşünce ve bedensel hisler) başa çıkmak kısa vadede kolaylaşıyor gibi görünebilir. Peki ya uzun vadede kolaylaşıyor mu, zorlaşıyor mu?",
                      _controller2,
                    ),
                    _buildQuestionContainer(
                      "Kendinizi değerlendirdiğinizde bu stratejilerden hangilerini, ne sıklıkta kullanıyorsunuz?",
                      _controller3,
                    ),
                    _buildQuestionContainer(
                      "Bu stratejilerden herhangi birini uygulamak hayatınızı nasıl etkiliyor? (zaman ve para maliyeti açısından? Sağlık, boş zaman ve ilişkiler açısından?)",
                      _controller4,
                    ),
                    _buildQuestionContainer(
                      "İç deneyimlerinize (duygu, düşünce ve bedensel hisler) karşı bu mücadeleyi daha ne kadar sürdürebilirsiniz?",
                      _controller5,
                    ),
                    SizedBox(height: 20),
                    Container(
                      constraints: BoxConstraints(maxWidth: 650),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Color(0xFF069BBF).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Peki bu sorulara verdiğiniz cevaplardan sonra İçsel deneyimlerinizi kontrol etmeye yönelik bu"
                                  " girişimlerin iyi sonuç vermediğini veya kısmen sonuç verdiğini ve oldukça fazla zaman ve "
                                  "enerji harcadığınızı söyleyebilir misiniz?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Gönder'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContainer(
      String question, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      constraints: BoxConstraints(maxWidth: 650),
      decoration: BoxDecoration(

        color: Color(0xFF069BBF).withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Cevabınızı buraya yazınız',
            ),
          ),
        ],
      ),
    );
  }
}
