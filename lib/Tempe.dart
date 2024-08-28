import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
import 'module_final.dart';
import 'module_table.dart';
import 'password_forget.dart';
import 'profile.dart';
import 'signupPage.dart';

// TODO: başlık yaılacak kartlar küçültülecek ve ekran kenarlarından uzaklık verilecek

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
        '/M21': (context)=> const M2_1Page(),
      },
    );
  }
}

class M2_4Page extends StatefulWidget {
  const M2_4Page({super.key});

  @override
  State<M2_4Page> createState() => _M2_4PageState();
}

class _M2_4PageState extends State<M2_4Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<int?> selectedValues = List<int?>.filled(45, null); // Ensure the size matches the number of cells



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
                Navigator.pushReplacementNamed(context, '/SH');
              },
            ),
            ListTile(
              title: const Text('Ekibimiz'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildResponsiveTable(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleSubmit();
                  Navigator.pushNamed(
                      context, '/'
                  );
                },
                child: Text('İleri'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveTable() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: _getColumnWidths(constraints.minWidth),
          children: [
            _buildTableRow([
              ['Macera', 'Yeni ve heyecan verici deneyimler yaşamak'],
              ['Boş Vakit', 'Dinlenmek ve eğlenmek için zaman ayırmak'],
              ['Cesaret', 'Cesaretle hareket etmek'],
              ['Mizah', 'Kendimin ve dünyanın mizahi yanını görmek'],
              ['Bilme', 'Değerli bilgileri öğrenmek ve katkıda bulunmak'],
            ], 0),
            _buildTableRow([
              ['Yaratıcılık', 'Yeni ve özgün fikirlere sahip olmak'],
              ['Oluşturma', 'Bir şeyler inşa etmek, tasarlamak ve/veya oynamak'],
              ['Güvenlik', 'Kendimin ve sevdiklerimin emniyet ve güvenliğini sağlamak'],
              ['Yetkinlik', 'Yaptığım işte yetkin olmak'],
              ['Yetki', 'Otoriteye sahip olmak ve başkalarından sorumlu olmak'],
            ], 5),
            _buildTableRow([
              ['Açıklık', 'Yeni deneyimlere, fikirlere ve seçeneklere açık olmak'],
              ['Problem çözme', 'Bir şeyleri anlamak, sorunları çözmek'],
              ['Aidiyet', 'Bir grubun parçası olmak ve bir gruba katkıda bulunmak'],
              ['Sadakat', 'Arkadaşlara, aileye ve/veya grubuma sadık olmak'],
              ['Sevgi doluluk', 'Hassasiyet, sevgi ve şefkat içeren ilişkilere sahip olmak'],
            ], 10),
            _buildTableRow([
              ['Gelişme', 'Değişmeye ve büyümeye devam etmek'],
              ['Saygı duyma', 'Başkalarına saygılı olma'],
              ['Şefkat', 'Başkaları için endişe duymak ve buna göre hareket etmek'],
              ['Yardımseverlik', 'Başkalarına yardımcı olmak'],
              ['Katkı', 'Bir şeyin, gelişmesine, gerçekleşmesine ya da yapılmasına emek, bilgi, para vb. ile yardım etmek'],
            ], 15),
            _buildTableRow([
              ['Güzellik', 'Çevremde güzelliği oluşturmak ve/veya takdir etmek'],
              ['Yarışma', 'Başkalarıyla rekabet etmek'],
              ['Cömertlik', 'Sahip olduklarımı başkalarıyla paylaşmak'],
              ['Barış', 'Dünyada barışı teşvik etmek için çalışmak'],
              ['Adalet', 'Herkes için adil ve eşit muameleyi teşvik etmek'],
            ], 20),
            _buildTableRow([
              ['Merak', 'Meraklı olmak ve yeni şeyleri keşfetmek'],
              ['Sorgulama', 'Otorite ve normları sorgulamak ve onlara meydan okumak'],
              ['Özgünlük', 'Olduğum kişi olarak davranmak'],
              ['İlişkisellik', 'Başkalarıyla yakın, destekleyici ilişkilere sahip olmak'],
              ['Dindarlık', 'Dini inançlarıma uygun hareket etmek'],
            ], 25),
            _buildTableRow([
              ['Çevrecilik', 'Doğa ve çevre ile uyum içinde yaşamak'],
              ['Rasyonellik', 'Akıl ve mantık tarafından yönlendirilmek'],
              ['Bağlılık', 'Kalıcı, anlamlı ilişkilerde bulunmak'],
              ['Sorumluluk', 'Sorumlu kararlar almak ve yükümlülüklerimi yerine getirmek'],
              ['Eğlence', 'Keyif almak için faaliyetler yapmak'],
            ], 30),
            _buildTableRow([
              ['Sağlık', 'Fiziksel olarak iyi ve sağlıklı olmak'],
              ['Tutku', 'Fikirler, etkinlikler ve insanlar hakkında derin duygulara sahip olmak'],
              ['Basitlik', 'Hayatı basit, minimum ihtiyaçlarla yaşamak'],
              ['Maneviyat', 'Ruhsal olarak büyümek ve olgunlaşmak'],
              ['Gelenek', 'Geçmişin saygın kalıplarını takip etmek'],
            ], 35),
            _buildTableRow([
              ['Aşk', 'Hayatımda yoğun, heyecan verici bir aşka sahip olmak'],
              ['Cesaret', 'Risk veya tehlike içeren şeyleri üstlenmeye istekli olmak'],
              ['Özerklik', 'Kendi kaderini tayin etmek ve bağımsız olmak'],
              ['Sıkı Çalışma', 'Hayatımdaki görevlerimde sıkı ve iyi çalışmak'],
              ['Meydan Okumak', 'Zor görevleri ve sorunları üstlenmek'],
            ], 40),
            _buildTableRow([
              ['İradeli Olma', 'Kendi eylemlerimde disiplinli olmak'],
              ['Erdemlilik', 'Ahlaki olarak saf ve mükemmel bir hayat yaşamak'],
              ['Dürüstlük', 'Dürüst ve doğru olmak'],
              ['Güvenirlik', 'Güvenilir olmak'],
              ['Samimiyet', 'En derin deneyimleri başkalarıyla paylaşacak ilişkileri kurmak'],
            ], 45),
          ],
        );
      },
    );
  }

  TableRow _buildTableRow(List<List<String>> cellData, int startIndex) {
    return TableRow(
      children: List.generate(
        cellData.length,
            (index) => _buildTableCell(cellData[index][0], cellData[index][1], startIndex + index),
      ),
    );
  }

  Widget _buildTableCell(String mainText, String continuationText, int cellIndex) {
    if (cellIndex >= selectedValues.length) {
      return Container(); // Return an empty container if out of bounds
    }
    return Container(
      height: 140, // Increased height for better readability on mobile
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            continuationText,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          Spacer(), // Push buttons to the bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildResponseButton('1', 1, cellIndex),
              SizedBox(width: 8),
              _buildResponseButton('2', 2, cellIndex),
              SizedBox(width: 8),
              _buildResponseButton('3', 3, cellIndex),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResponseButton(String label, int value, int cellIndex) {
    if (cellIndex >= selectedValues.length) {
      return Container(); // Return an empty container if out of bounds
    }
    bool isSelected = selectedValues[cellIndex] == value;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedValues[cellIndex] = value;
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(40, 40),
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
      ),
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  void _handleSubmit() {
    // Handle the submission of the selected values
    print('Selected values: $selectedValues');
    // Implement further logic here
  }

  Map<int, TableColumnWidth> _getColumnWidths(double maxWidth) {
    if (maxWidth < 600) {
      // Adjust column width for small screens
      return {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(3),
        4: FlexColumnWidth(3),
      };
    } else {
      // Standard column width for larger screens
      return {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
      };
    }
  }
}
