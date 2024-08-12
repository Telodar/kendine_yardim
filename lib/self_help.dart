import 'package:flutter/material.dart';
import 'package:test3/home_page.dart';
import 'login.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'module_1.dart';
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
      },
    );
  }
}

class selfHelpPage extends StatefulWidget {
  const selfHelpPage({super.key});

  @override
  _selfHelpPageState createState() => _selfHelpPageState();
}

class _selfHelpPageState extends State<selfHelpPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(-50.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


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
                'Deneme Metni',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Deneme Metni Deneme Metni',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Deneme Metni Deneme Metni',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Deneme Metni Deneme Metni',
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
                              width: 400,
                              height: 400,
                              child: AnimatedBuilder(
                                animation: _animation,
                                child: Image.asset('android/assets/help.png'),
                                builder: (BuildContext context, Widget? child) {
                                  return Transform.translate(
                                    offset: _animation.value,
                                    child: child,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildTextContainer(600, 600),
                            const SizedBox(height: 20),
                            _buildTextContainer(600, 600),
                            const SizedBox(height: 20),
                            _buildTextContainer(600, 600),
                            Padding(
                              padding: const EdgeInsets.all(10), // Kutu İçerik arası mesafe
                              child: Container(
                                padding: const EdgeInsets.all(0.0), // Kutu İçerik arası mesafe
                                child: Image.asset(
                                  'android/assets/goplogo.png',
                                  height: 250,
                                ),
                              ),
                            ),
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
                                      width: 400,
                                      height: 400,
                                      child: AnimatedBuilder(
                                        animation: _animation,
                                        child: Image.asset('android/assets/help.png'),
                                        builder: (BuildContext context, Widget? child) {
                                          return Transform.translate(
                                            offset: _animation.value,
                                            child: child,
                                          );
                                        },
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