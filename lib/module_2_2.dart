import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test3/self_help.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_1_1.dart';
import 'module_1_2.dart';
import 'module_1_3.dart';
import 'module_1_4.dart';
import 'module_1_5.dart';
import 'module_1_6.dart';
import 'module_1_7.dart';
import 'module_2_1.dart';
import 'module_2_3.dart';
import 'module_2_4.dart';
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';


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
      home: const HomePage(),
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
        '/M21': (context) => const M2_1Page(),
        '/M22': (context) => const M2_2Page(),
        '/M23': (context) => const M2_3Page(),
        '/M24': (context) => const M2_4Page(),
        '/SH': (context) => const SelfhelpPage(),
      },
    );
  }
}

class M2_2Page extends StatefulWidget {
  const M2_2Page({super.key});

  @override
  State<M2_2Page> createState() => _M2_2PageState();
}

class _M2_2PageState extends State<M2_2Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();final TextEditingController question1Controller = TextEditingController();
  final TextEditingController question2Controller = TextEditingController();
  final TextEditingController question3Controller = TextEditingController();

  // Yanıtları terminale yazdırma fonksiyonu
  void submitAnswers() {
    print("Nasıl biri olmak istiyorsunuz?: ${question1Controller.text}");
    print("Diğer insanlarla nasıl ilişkiler kurmak istiyorsunuz?: ${question2Controller.text}");
    print("Daha anlamlı ve zengin bir hayat sürmek için neler yapmak istiyorsunuz?: ${question3Controller.text}");
  }

  @override
  void dispose() {
    // Belleği sızdırmamak için controller'ları temizliyoruz
    question1Controller.dispose();
    question2Controller.dispose();
    question3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    final double sidePadding = isDesktop ? 200 : 30;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: isMobile
              ? const Text('Kendine Yardım')
              : Row(
                  children: [
                    Image.asset(
                      'android/assets/goplogo.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text('Kendine Yardım'),
                  ],
                ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.purple],
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
                    child: const Text('Giriş Yap',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('Ana Sayfa',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/SH');
                    },
                    child: const Text('Kendi Kendine Yardım',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('Ekibimiz',
                        style: TextStyle(color: Colors.white)),
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
                          colors: [Colors.green, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Text('Menü',
                          style: TextStyle(color: Colors.white, fontSize: 24)),
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
                        Navigator.pushReplacementNamed(context, '/M1');
                      },
                    ),
                  ],
                ),
              )
            : null,
        body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Geniş ekran için düzen (Bilgisayar)
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('android/assets/otobus.png'),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bölüm 2: Değerle Temas',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Şimdi farz edelim “hayatınız” isimli bir otobüsünüz var ve bu otobüsü siz sürüyorsunuz. Otobüsün direksiyonu,"
                                  "gazı, freni sizin kontrolünüzde, şoför sizsiniz. Herhangi bir otobüs gibi yolda giderken duraklarda durup"
                                  "bekleyen yolcuları alıyorsunuz. Yolda devam ederken yolculardan biri radyo açmanızı istiyor açıyorsunuz başka"
                                  "bir yolcu çok ses oldu diye kapatmanızı istiyor. Ama radyo isteyenler orada ve hala isteklerinde kararlılar."
                                  "Klimayı açmanızı söyleyenler var ama soğuk oluyor diye şikayetlenenler de.. Bazı yolcular yanlış yöne doğru"
                                  "gittiğinizi söylerken bazıları da tam tersi doğru yolda olduğunuzu söylüyor. Yolculardan bazıları kabadayı,"
                                  "korkutucu çete üyelerine benziyor ve onların inip başka otobüse binmesini istiyorsunuz. Peki bütün bu"
                                  "yolcularla otobüsü sürerken neler yapabilirsiniz? Hepsinin dediklerini yapmak mümkün görünmüyor. Onların"
                                  "istediği yöne doğru gitseniz biri başka biri başka yöne götürüyor. Burada şoför olarak neler yapabilirsiniz?"
                                  "Yolcuları otobüsten indirmeyi deneseniz ve ikna etmeye çalışsanız otobüsü durdurmak zorunda kalacaksınız"
                                  "yola devam edemeyeceksiniz belki de hiç ikna olmayacaklar."
                                  "Onları susturmak için bağırsanız ilk başta susacaklar belki ama daha sonra tekrar konuşmaya başlayacaklar."
                                  "Sevmediklerini görmemek için arka sıraya oturtsanız yine de aynadan baktığınızda göreceksiniz veya seslerini"
                                  "duymaya devam edeceksiniz."
                                  "Bu yolcular sizin anılarınız, bedensel duyumlarınız, duygularınız, düşünceleriniz ve dürtülerinizdir. Bütün bunlar"
                                  "sizin hayatınız isimli otobüsteki yolculardır."
                                  "Hepsinin dediklerini yapmayı tercih edebilirsiniz ama bu sefer de kendi özgürlüğünüzü onların eline bırakmış"
                                  "olacaksınız ve bir o tarafa bir bu tarafa savrulacaksınız. “Hayatınız” otobüsünün kontrolünü kaybetmiş"
                                  "olacaksınız."
                                  "Otobüse bindiğinizde genellikle ön tarafta otobüsün nereye gittiğini söyleyen küçük bir tabela olur. Otobüsün"
                                  "nereye gideceği yolcuların heveslerine değil, otobüsün şoförüne bağlıdır ve oraya gidilir."
                                  "Şimdi siz tüm bu yolcuların otobüste bulunmalarına izin verseniz ve bu yolculukta sizi istediğiniz yöne doğru"
                                  "götürüyorlarsa söylediklerini yapsanız ama sizi gitmek istediğiniz yerden uzaklaştırıyorsa yolcuya teşekkür edip"
                                  "yolunuza devam etseniz…?Bu nasıl olur? Bu, arzu ettiğiniz istikamete gitmenizde size yardımcı olabilir mi?",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Sorular:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Nasıl biri olmak istiyorsunuz?',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                            TextField(
                              controller: question1Controller,
                              decoration: InputDecoration(
                                hintText: 'Cevabınızı buraya yazın',
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Diğer insanlarla nasıl ilişkiler kurmak istiyorsunuz?',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                            TextField(
                              controller: question2Controller,
                              decoration: InputDecoration(
                                hintText: 'Cevabınızı buraya yazın',
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Daha anlamlı ve zengin bir hayat sürmek için neler yapmak istiyorsunuz?',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start,
                            ),
                            TextField(
                              controller: question3Controller,
                              decoration: InputDecoration(
                                hintText: 'Cevabınızı buraya yazın',
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/M23');
                                    submitAnswers();
                                    // Cevapları terminale yazdırma
                                  },
                                  child: Text('İleri'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Mobil ekran için düzen
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bölüm 2: Değerle Temas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          "Şimdi farz edelim “hayatınız” isimli bir otobüsünüz var ve bu otobüsü siz sürüyorsunuz. Otobüsün direksiyonu,"
                              "gazı, freni sizin kontrolünüzde, şoför sizsiniz. Herhangi bir otobüs gibi yolda giderken duraklarda durup"
                              "bekleyen yolcuları alıyorsunuz. Yolda devam ederken yolculardan biri radyo açmanızı istiyor açıyorsunuz başka"
                              "bir yolcu çok ses oldu diye kapatmanızı istiyor. Ama radyo isteyenler orada ve hala isteklerinde kararlılar."
                              "Klimayı açmanızı söyleyenler var ama soğuk oluyor diye şikayetlenenler de.. Bazı yolcular yanlış yöne doğru"
                              "gittiğinizi söylerken bazıları da tam tersi doğru yolda olduğunuzu söylüyor. Yolculardan bazıları kabadayı,"
                              "korkutucu çete üyelerine benziyor ve onların inip başka otobüse binmesini istiyorsunuz. Peki bütün bu"
                              "yolcularla otobüsü sürerken neler yapabilirsiniz? Hepsinin dediklerini yapmak mümkün görünmüyor. Onların"
                              "istediği yöne doğru gitseniz biri başka biri başka yöne götürüyor. Burada şoför olarak neler yapabilirsiniz?"
                              "Yolcuları otobüsten indirmeyi deneseniz ve ikna etmeye çalışsanız otobüsü durdurmak zorunda kalacaksınız"
                              "yola devam edemeyeceksiniz belki de hiç ikna olmayacaklar."
                              "Onları susturmak için bağırsanız ilk başta susacaklar belki ama daha sonra tekrar konuşmaya başlayacaklar."
                              "Sevmediklerini görmemek için arka sıraya oturtsanız yine de aynadan baktığınızda göreceksiniz veya seslerini"
                              "duymaya devam edeceksiniz."
                              "Bu yolcular sizin anılarınız, bedensel duyumlarınız, duygularınız, düşünceleriniz ve dürtülerinizdir. Bütün bunlar"
                              "sizin hayatınız isimli otobüsteki yolculardır."
                              "Hepsinin dediklerini yapmayı tercih edebilirsiniz ama bu sefer de kendi özgürlüğünüzü onların eline bırakmış"
                              "olacaksınız ve bir o tarafa bir bu tarafa savrulacaksınız. “Hayatınız” otobüsünün kontrolünü kaybetmiş"
                              "olacaksınız."
                              "Otobüse bindiğinizde genellikle ön tarafta otobüsün nereye gittiğini söyleyen küçük bir tabela olur. Otobüsün"
                              "nereye gideceği yolcuların heveslerine değil, otobüsün şoförüne bağlıdır ve oraya gidilir."
                              "Şimdi siz tüm bu yolcuların otobüste bulunmalarına izin verseniz ve bu yolculukta sizi istediğiniz yöne doğru"
                              "götürüyorlarsa söylediklerini yapsanız ama sizi gitmek istediğiniz yerden uzaklaştırıyorsa yolcuya teşekkür edip"
                              "yolunuza devam etseniz…?Bu nasıl olur? Bu, arzu ettiğiniz istikamete gitmenizde size yardımcı olabilir mi?",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset('android/assets/otobus.png'),
                      SizedBox(height: 20),
                      Text(
                        'Sorular:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nasıl biri olmak istiyorsunuz?',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        controller: question1Controller,
                        decoration: InputDecoration(
                          hintText: 'Cevabınızı buraya yazın',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Diğer insanlarla nasıl ilişkiler kurmak istiyorsunuz?',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        controller: question2Controller,
                        decoration: InputDecoration(
                          hintText: 'Cevabınızı buraya yazın',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Daha anlamlı ve zengin bir hayat sürmek için neler yapmak istiyorsunuz?',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        controller: question3Controller,
                        decoration: InputDecoration(
                          hintText: 'Cevabınızı buraya yazın',
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/M23');
                              submitAnswers(); // Cevapları terminale yazdırma
                            },
                            child: Text('İleri'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );

          }
        }
        )
    );
  }
}
