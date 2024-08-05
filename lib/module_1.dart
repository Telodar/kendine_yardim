import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'login.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_5.dart';
import 'module_6.dart';
import 'module_7.dart';
import 'module_8.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'signupPage.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: const M1Page(),
      routes: {
        '/Login': (context) => const LoginPage(),
        '/M1': (context) => const M1Page(),
        '/M2': (context) => M2Page(),
        '/M3T': (context) => const Mtable(),
        '/M3': (context) => const M3Page(),
        '/M5': (context) => const M5Page(),
        '/M4': (context) => const M4Page(),
        '/M6': (context) => const M6Page(),
        '/M7': (context) => const M7Page(),
        '/M8': (context) => const M8Page(),
        '/M0': (context) => const Mtable(),
        '/P1': (context) => const passwordPage(),
        '/S1': (context) => const Signup(),
        '/P2': (context) => const ProfilePage(),
      },
    );
  }
}

class M1Page extends StatefulWidget {
  const M1Page({super.key});

  @override
  State<M1Page> createState() => _M1PageState();
}

class _M1PageState extends State<M1Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();

  void _submitForm() {
    String text = _textController.text;
    print(text); // Terminale yazdırma
    _textController.clear(); // Textbox'ı temizleme
  }

  void _handleSubmit() {
    _submitForm();
    Navigator.pushReplacementNamed(context, '/M2'); // M2 sayfasına yönlendirme
  }

    @override
  Widget build(BuildContext context) {
      bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
      bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    final double sidePadding = isDesktop ? 200 : 30;
    final double horizontalPadding = isDesktop ? 200 : 0;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: isMobile
              ? const Text('1. Bölüm 1. Sayfa')
              : Row(
            children: [
              Image.asset(
                'android/assets/goplogo.png',
                height: 40,
              ),
              const SizedBox(width: 10),
              const Text('1. Bölüm 1. Sayfa'),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          centerTitle: true,
          actions: isMobile
              ? null
              : [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Login');
              },
              child: const Text(
                  'Giriş Yap', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text(
                  'Ana Sayfa', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/M0');
              },
              child: const Text(
                  '1. Bölüm 1. Sayfa', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/M6');
              },
              child: const Text(
                  'Ekibimiz', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        endDrawer: isMobile
            ? Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Text(
                    'Menü', style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                title: const Text('Giriş Yap'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/Login');
                },
              ),
              ListTile(
                title: const Text('Ana Sayfa'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text('Kendi Kendine Yardım'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/M0');
                },
              ),
              ListTile(
                title: const Text('Ekibimiz'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/M6');
                },
              ),
            ],
          ),
        )
            : null,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'android/assets/arkaplan.png', // Arka plan resminizin yolu
              fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde ölçekle
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Ortala
              crossAxisAlignment: CrossAxisAlignment.center, // Ortala
              children: [
                SizedBox(height: 50), // Sayfanın kaydırılabilir kısmı için boşluk
                Container(
                  constraints: BoxConstraints(maxWidth: 650), // Max genişlik sınırı
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Color(0xFF069BBF).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Ayşe Üniversite 2. Sınıf öğrencisi olan Ayşe ailesinden uzakta bir şehirde öğrenimine devam etmekteydi. Ailesiyle ilişkileri normal olan Ayşe daha önceleri günde en az bir kez "
                        "konuştuğu ailesiyle artık daha az telefonda görüşmeye başlamıştı. Son dönemde kendini"
                        "çökkün hissetmekte olan Ayşe daha önce severek gittiği derslere artık katılmak "
                        "istememekteydi. Daha çok yurtta tek başına kalmayı tercih etmekte ve arkadaşları "
                        "dışarda planlar yaptığında farklı bahanelerle onlara katılmamaktaydı. Aslında"
                        "arkadaşlarını seven onlarla yaptığı aktivitelerden keyif alan Ayşe'yi son zamanlarda arkadaşlarının enerjisinin yüksek olması bile rahatsız etmekteydi. Yalnız kalmayı tercih "
                        "etmekte ve böyle zamanlarda da daha önceki yaşadığı olayları zihninden geçirmekte o "
                        "olayları tekrar tekrar düşünmekteydi. Geceleri istediği gibi uyuyamamakta ve ertesi gün"
                        "içerisinde de yoğun olarak öfkeli olduğunu fark etmekteydi."
                        "Böyle günlerden birinde Ayşe ve oda arkadaşı Elif odanın düzeni ile ilgili bir konuda"
                        "tartışmışlardı. Ayşe bu tartışmada arkadaşına bağırarak -"
                        "yeter artık! her şeyi çok abartıyorsun.- Demiş, yatağına oturmuş ve göğsünde bir baskı hissetmişti ve aynı"
                        "zamanda elleri titremişti. Sonrasında arkadaşını hiç dinlemeden odadan ayrılarak kendini rahatlatmak için kulaklıklarını takıp yürüyüşe çıkmıştı. Yürüyüş boyunca -kimsenin onu"
                        "anlamadığını, ben niye böyleyim- diye aklından geçirmiş ve geçmişte yaşadığı olayları"
                        "tekrar tekrar düşünen Ayşe kendisi için -kimse beni sevmiyor, hiçbir şeyi"
                        "başaramıyorum- diye düşünmekteydi. Yürüyüş sonrası tekrar odasına dönen Ayşe"
                        "odasındakilerle çok az iletişim kurarak yatağına uzanmış ve kafasını dağıtmak için"
                        "internetten videolar izlemiş ve sosyal medyada gezinmişti. O günkü gitmesine gereken"
                        "derse de -bu kafayla gitsem zaten bir Şey anlamayacağım canım istemiyor- diyerek"
                        "gitmemişti."
                        "Yakın  arkadaşı Hacer son dönemde Ayşe'nin davranışlarında farklılık olduğunu görmüş ve"
                        "nasıl hissettiğini sormuştu. Ayşe'de -kendimi çok yorgun hissediyorum, canım hiçbir şey"
                        "yapmak istemiyor. Sanırım bende bir bozukluk var. Kendimi diğer insanların içinde bile"
                        "yalnız hissediyorum, çok değersizim- demişti.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(height: 50), // Sayfanın kaydırılabilir kısmı için boşluk
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 650), // Max genişlik sınırı
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    decoration: BoxDecoration(
                      color: Color(0xFF069BBF).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Ortala
                      crossAxisAlignment: CrossAxisAlignment.center, // Ortala
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mesajınızı buraya yazın',
                              fillColor: Colors.white, // İç rengi beyaz
                              filled: true, // Doldurulmuş olmalı
                            ),
                            onSubmitted: (value) {
                              _handleSubmit();
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _handleSubmit,
                          child: Text('Gönder'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}