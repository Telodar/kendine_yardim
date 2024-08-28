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
import 'module_2_4.dart';
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';

//TODO: Elementler ortalanacak.
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
        '/M24': (context) => const M2_4Page(),
        '/SH': (context) => const SelfhelpPage(),
      },
    );
  }
}

class M2_3Page extends StatefulWidget {
  const M2_3Page({super.key});

  @override
  State<M2_3Page> createState() => _M2_3PageState();
}

class _M2_3PageState extends State<M2_3Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


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
                          child: Image.asset('android/assets/kalp.png'),
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
                                  'Bölüm 3: Değerleri sıralayalım',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Değerleri Sıralayalım (Veage, S., Ciarrochi, J., ve Heaven, 2014)"
                                      "Değerler tercih edilmiş hayat istikametleridir. Aşağıda farklı insanlar için farklı önemleri olan değerler verilmiştir."
                                      "Bu değerler herkes için ayrı öneme sahiptir ve hiçbiri bir diğerinden daha önemli değildir. Aşağıdaki değerleri"
                                      "öncelikle bir inceleyiniz ve kimse (aile, arkadaş veya önem verdiğin kişiler) ne seçtiğinizi bilmeyecek olsa bile"
                                      "neyi seçerdiniz ona göre hareket ediniz."
                                  "Yaşamdaki değerler aşağıda tablo olarak sunulmuştur. Şimdi sizden bu değerlerin hayatınızda ne kadar önemli"
                                      "olmasını istediğinize göre farklı kategorilere ayırmanızı istiyorum. Bu, başkalarının sizin “değer vermeniz”"
                                      "gerektiğini söylediği şey değil, seçmekte tamamen özgür olduğunuz, hayatınızda önemli kılmak isteyeceğiniz"
                                      "şeyler. Sizin hayatınızı neyi temsil etmesini istiyorsanız ona değerlendiriniz."
                                  "Değerleri seçerken aşağıdaki soruları göz önünde bulundurun."
                                "-Bu değerler sizin değerleriniz mi yoksa bir aile/arkadaş/toplumun sizin için sundukları değerler mi?"
                                  "-Bu eylemleri yaptığınızı başka kimse bilmeseydi, yine de yapar mıydınız?"
                                "-Sizi rahatsız eden içsel deneyimlerinizle başa çıkmak veya onları kontrol etmeye çalışmak için çaba"
                                "harcamıyor olsaydınız, bugün neleri farklı yapıyor olurdunuz?"
                                "1. Tüm değer kartlarını, size göre (“Çok önemli”, “Önemli” ve “Çok önemli değil”) üç kategoriye ayırınız. Değerin"
              "bulunduğu kategorinin içerisine Çok önemli için “1”, Önemli için “2” ve Çok önemli değil için “3” yazınız."
              "2. Yalnızca “Çok önemli” kategorisine koyduğunuz değerleri alınız. Bu değerler içerisinden en önemli"
              "gördüğünüz 10 değeri seçiniz."
              ,
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.start,
                                ),

                                Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/M24');
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
                            'Bölüm 3: Değerleri sıralayalım',
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
                              "Değerleri Sıralayalım (Veage, S., Ciarrochi, J., ve Heaven, 2014)"
                                "Değerler tercih edilmiş hayat istikametleridir. Aşağıda farklı insanlar için farklı önemleri olan değerler verilmiştir."
                            "Bu değerler herkes için ayrı öneme sahiptir ve hiçbiri bir diğerinden daha önemli değildir. Aşağıdaki değerleri"
                            "öncelikle bir inceleyiniz ve kimse (aile, arkadaş veya önem verdiğin kişiler) ne seçtiğinizi bilmeyecek olsa bile"
                          "neyi seçerdiniz ona göre hareket ediniz."
                          "Yaşamdaki değerler aşağıda tablo olarak sunulmuştur. Şimdi sizden bu değerlerin hayatınızda ne kadar önemli"
                          "olmasını istediğinize göre farklı kategorilere ayırmanızı istiyorum. Bu, başkalarının sizin “değer vermeniz”"
                          "gerektiğini söylediği şey değil, seçmekte tamamen özgür olduğunuz, hayatınızda önemli kılmak isteyeceğiniz"
                            "şeyler. Sizin hayatınızı neyi temsil etmesini istiyorsanız ona değerlendiriniz.""Değerleri seçerken aşağıdaki soruları göz önünde bulundurun."
                                  "-Bu değerler sizin değerleriniz mi yoksa bir aile/arkadaş/toplumun sizin için sundukları değerler mi?"
                                  "-Bu eylemleri yaptığınızı başka kimse bilmeseydi, yine de yapar mıydınız?"
                                  "-Sizi rahatsız eden içsel deneyimlerinizle başa çıkmak veya onları kontrol etmeye çalışmak için çaba"
                                  "harcamıyor olsaydınız, bugün neleri farklı yapıyor olurdunuz?"
                                  "1. Tüm değer kartlarını, size göre (“Çok önemli”, “Önemli” ve “Çok önemli değil”) üç kategoriye ayırınız. Değerin"
                                  "bulunduğu kategorinin içerisine Çok önemli için “1”, Önemli için “2” ve Çok önemli değil için “3” yazınız."
                                  "2. Yalnızca “Çok önemli” kategorisine koyduğunuz değerleri alınız. Bu değerler içerisinden en önemli"
                                  "gördüğünüz 10 değeri seçiniz.",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: 20),
                          Image.asset('android/assets/kalp.png'),

                          Center(
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/M24');
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
