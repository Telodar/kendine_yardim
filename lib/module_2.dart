import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'home_page.dart';
import 'module_3.dart';


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
      home: M2Page(),
      routes: {
        '/Home': (context) => HomePage(), // HomePage yönlendirmesi Tanımı
        '/M3': (context) => const M3Page(),
      },
    );
  }
}

class M2Page extends StatefulWidget {
  const M2Page({super.key});

  @override
  State<M2Page> createState() => _M2PageState();
}

class _M2PageState extends State<M2Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<TextEditingController> _textControllers = List.generate(5, (index) => TextEditingController());

  void _submitForm() {
    for (var controller in _textControllers) {
      print(controller.text); // Terminale yazdırma
      controller.clear(); // Textbox'ı temizleme
    }
    Navigator.pushNamed(context, '/M3'); // /M3 sayfasına yönlendirme
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 1000;
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF3D1953).withOpacity(0.4),
        title: Text('Modül 2'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/Home'); // Ana sayfaya yönlendirme
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png', // Arka plan resminizin yolu
              fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde ölçekle
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Ortala
                crossAxisAlignment: CrossAxisAlignment.center, // Ortala
                children: [
                  SizedBox(height: 100), // Sayfanın kaydırılabilir kısmı için boşluk
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      color: Color(0xFF069BBF).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      "Hepimiz zaman zaman Ayşe ya da Efe gibi zor dönemler geçirebiliriz. Fakat bu süre"
                          "uzadığında kendimizle ilgili duygu düşünceler ve bedenimizde hissettiklerimiz"
                          "yoğunlaştığında sanki bir çıkmaz sokağa girmiş ve orada sıkışmış gibi hissedebiliriz. Gelin"
                          "bu sokakta başlayan yolculuğa birlikte çıkalım."
                          "Bugün yolculuğun başındayız, peki siz yolculuğun başarılı bir şekilde gerçekleştiğini siz"
                          "nereden anlayacaksınız? Yolculuğun sonuna geldiğimizi siz nereden anlayacaksınız? Artık"
                          "bugünden farklı olarak neyi yapmaya başlıyor olacaksınız? Bu süreçteki hedefleriniz"
                          "neler?"
                          "Kaygınızı azaltmayı veya kontrol etmeyi istediğinizi ya da içinde buluduğunuz olumsuz"
                          "bu duygudurumdan kurtulmak istediğinizi, daha mutlu veya özgüvenli olmayı istediğinizi"
                          "tahmin edebiliyorum. Ama benim asıl sormak istediğim bütün bunlar olduğunda siz ne"
                          "yapıyor olacaksınız? Aşağıya neler yapıyor olacağınızı belirtiniz.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20), // Sabit metin ve form arasında boşluk
                  Container(
                    constraints: BoxConstraints(maxWidth: 650),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Gri renk
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              controller: _textControllers[i],
                              decoration: InputDecoration(
                                labelText: 'Mesaj ${i + 1}',
                                border: UnderlineInputBorder(),
                              ),
                              onSubmitted: (value) {
                                _submitForm();
                              },
                            ),
                          ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Gönder'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Butonun altında boşluk
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
