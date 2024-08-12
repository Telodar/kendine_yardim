import 'package:flutter/material.dart';
import 'login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'module_1.dart';
import 'module_2.dart';
import 'module_3.dart';
import 'module_4.dart';
import 'module_5.dart';
import 'module_6.dart';
import 'module_6v1.dart';
import 'module_7.dart';
import 'module_8.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'signupPage.dart';
import 'profile.dart';
import 'module_6v2.dart';

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
        '/M61': (context) => const M6v1Page(),
        '/M62': (context) => const M6v2Page(),
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isDesktop = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    Widget _buildTextContainer(double width, double height) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15.0),
        ),
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: height,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Kendi Kendine Yardım Nedir?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'İnsanoğlu hayatı boyunca karşılaştığı farklı yaşam zorluklarıyla mücadele etmektedir. Çeşitli yaşam zorluklarıyla başa çıkabilmenin farklı yolları vardır, bunlardan en yaygını/önemlisi profesyonel bir yardım almaktır. Bu yardım içerisinde ilaçla tedavi ve psikoterapiler yer almaktadır. Bunların dışında yardım almanın önemli bir yolu da kendi kendine yardımdır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Kendi Kendine Yardım',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Kendi kendine yardım, kitaplar, kılavuzlar, ses dosyaları, videolar ve ya bu formatların bazı kombinasyonlarını kullanarak kişinin kendisi tarafından yürütülen yardım türüdür (Gould ve Clum, 1993). Kişinin bu süreci tamamlaması için uzmanla temas şart değildir: fakat bu çalışmak kapsamında bir uzman destekleyici ve kolaylaştırıcı olmak amacıyla sizinle haftalık olarak mail ya da telefonla iletişim sağlayacaktır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Bu Kılavuzdan Nasıl Yararlanacağım?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Bu kılavuz Kabul ve Kararlılık Terapisi (KKT) ilke, yöntem ve tekniklerine dayalı olarak hazırlanmıştır. Kılavuz içerisinde depresif duygu durum, kaygı ve stres sorunlarında etkili olduğu daha önce kanıtlanmış yöntem ve teknikleri barındırmaktadır.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Kılavuz İçeriği',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Bu kılavuz, içerisindeki bilgileri sadece okuyup geçebileceğiniz bir kılavuz değildir: aksine içerisinde yer alan alıştırmaları ve egzersizleri o an ve sonrasında günlük hayatınızda gerçekleştireceğiniz bir yol arkadaşıdır. Bu süreç aslında bir enstrüman çalmayı öğrenmek gibidir. Nasıl bir gitarın çalınacağını okuyarak ya da birinin bize anlatması ile öğrenemiyor ve egzersiz yapmaya ihtiyaç duyuyorsak, burada da notaları birlikte öğrenerek ve egzersiz sayesinde gitar çalmaya başlayabilirsiniz.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Alıştırmalar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Buradaki alıştırmaları gerçekleştirebilmeniz için şartları olabildiğince sizin açınızdan daha rahat uygulanabilir hale getirmeye çalışıyoruz. Bazı alıştırmaların içerisinde karekodlar göreceksiniz ve bu karekodlar sizi alıştırmanın sesli dosyasına ulaştırmak içindir. O karekod sayesinde alıştırmayı sesli dinleyerek gerçekleştirebilirsiniz.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Zorluklar ve Kolaylaştırıcılar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Başlangıçta bu alıştırmaları gerçekleştirmek bazılarımız için zorlayıcı olabilir fakat bu alıştırmaları yapmaya devam ettikçe uygulamanın kolaylaştığını fark edebilirsiniz.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Hatırlatma',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Bu kitaptaki kavramlar ve stratejiler kişisel gelişiminize yardımcı olabilse de bu kitabın tıbbi tavsiye içermediğini ve psikoterapi ve ya tıbbi tedavinin yerini alma amacı taşımadığını hatırlatmak istiyoruz. Eğer yaşadığınız durumun daha ciddi düzeyde olduğunu düşünüyorsanız bir ruh sağlığı uzmanına başvurunuz.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }



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
                'Kendi Kendine Yardım', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/M1');
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
                  colors: [Colors.green, Colors.purple],
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
                Navigator.pushReplacementNamed(context, '/M1');
              },
            ),
          ],
        ),
      )
          : null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'android/assets/arkaplan.png',
            fit: BoxFit.cover,
          ),
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    if (isMobile)
                      Center (
                        child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15.0),

                            ),
                            child: Image.asset(
                              'android/assets/goplogo.png',
                              height: 250,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextContainer(600, 600),
                        ],
                      ),
                      )
                    else
                      SingleChildScrollView(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16.0), // Pencere kenarlarından uzaklık
                        child: Column( // Tek Sütun gibi davranış
                          children: [
                            Row(
                              // üst Satır
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Sol kutu
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(50), // Kutu İçerik arası mesafe
                                    child: Container(
                                      padding: const EdgeInsets.all(120.0), // Kutu İçerik arası mesafe
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'android/assets/goplogo.png',
                                        height: 250,
                                      ),
                                    ),
                                  ),
                                ),
                                // Sağ kutu
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    margin: const EdgeInsets.all(50.0), //kutular arası boşluk
                                    child: _buildTextContainer(double.infinity, 500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              // Alt satır
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(50.0), // Kutular arasında boşluk
                                    child: _buildTextContainer(400, 500),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(50), // Kutu İçerik arası mesafe
                                    child: Container(
                                      padding: const EdgeInsets.all(120.0), // Kutu İçerik arası mesafe
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'android/assets/goplogo.png',
                                        height: 250,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),



                    const SizedBox(height: 30),
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