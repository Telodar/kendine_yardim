import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'home_page.dart';
import 'login.dart';
import 'module_table.dart';

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
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      home: const HomePage(),
      routes: {
        '/Login': (context) => const LoginPage(),
        '/M3T': (context) => const Mtable(),
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
  final List<int?> selectedValues = List<int?>.filled(45, null);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.of(context).isSmallerThan(TABLET);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kendine Yardım'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
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
                'Menü',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
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
          ],
        ),
      )
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isMobile ? _buildVerticalLayout() : _buildResponsiveTable(),
        ),
      ),
    );
  }

  // Mobilde her elementi ayrı ayrı gösteren yapı
  Widget _buildVerticalLayout() {
    return Column(
      children: [
        _buildTableCell('Macera', 'Yeni ve heyecan verici deneyimler yaşamak', 0),
        _buildTableCell('Boş Vakit', 'Dinlenmek ve eğlenmek için zaman ayırmak', 1),
        _buildTableCell('Cesaret', 'Cesaretle hareket etmek', 2),
        _buildTableCell('Mizah', 'Kendimin ve dünyanın mizahi yanını görmek', 3),
        _buildTableCell('Bilme', 'Değerli bilgileri öğrenmek ve katkıda bulunmak', 4),
        _buildTableCell('Yaratıcılık', 'Yeni ve özgün fikirlere sahip olmak', 5),
        _buildTableCell('Oluşturma', 'Bir şeyler inşa etmek, tasarlamak ve/veya oynamak', 6),
        _buildTableCell('Güvenlik', 'Kendimin ve sevdiklerimin emniyet ve güvenliğini sağlamak', 7),
        _buildTableCell('Yetkinlik', 'Yaptığım işte yetkin olmak', 8),
        _buildTableCell('Yetki', 'Otoriteye sahip olmak ve başkalarından sorumlu olmak', 9),
        _buildTableCell('Açıklık', 'Yeni deneyimlere, fikirlere ve seçeneklere açık olmak', 10),
        _buildTableCell('Problem çözme', 'Bir şeyleri anlamak, sorunları çözmek', 11),
        _buildTableCell('Aidiyet', 'Bir grubun parçası olmak ve bir gruba katkıda bulunmak', 12),
        _buildTableCell('Sadakat', 'Arkadaşlara, aileye ve/veya grubuma sadık olmak', 13),
        _buildTableCell('Sevgi doluluk', 'Hassasiyet, sevgi ve şefkat içeren ilişkilere sahip olmak', 14),
        _buildTableCell('Gelişme', 'Değişmeye ve büyümeye devam etmek', 15),
        _buildTableCell('Saygı duyma', 'Başkalarına saygılı olma', 16),
        _buildTableCell('Şefkat', 'Başkaları için endişe duymak ve buna göre hareket etmek', 17),
        _buildTableCell('Yardımseverlik', 'Başkalarına yardımcı olmak', 18),
        _buildTableCell('Katkı', 'Bir şeyin, gelişmesine, gerçekleşmesine ya da yapılmasına emek, bilgi, para vb. ile yardım etmek', 19),
        _buildTableCell('Güzellik', 'Çevremde güzelliği oluşturmak ve/veya takdir etmek', 20),
        _buildTableCell('Yarışma', 'Başkalarıyla rekabet etmek', 21),
        _buildTableCell('Cömertlik', 'Sahip olduklarımı başkalarıyla paylaşmak', 22),
        _buildTableCell('Barış', 'Dünyada barışı teşvik etmek için çalışmak', 23),
        _buildTableCell('Adalet', 'Herkes için adil ve eşit muameleyi teşvik etmek', 24),
        _buildTableCell('Merak', 'Meraklı olmak ve yeni şeyleri keşfetmek', 25),
        _buildTableCell('Sorgulama', 'Otorite ve normları sorgulamak ve onlara meydan okumak', 26),
        _buildTableCell('Özgünlük', 'Olduğum kişi olarak davranmak', 27),
        _buildTableCell('İlişkisellik', 'Başkalarıyla yakın, destekleyici ilişkilere sahip olmak', 28),
        _buildTableCell('Dindarlık', 'Dini inançlarıma uygun hareket etmek', 29),
        _buildTableCell('Çevrecilik', 'Doğa ve çevre ile uyum içinde yaşamak', 30),
        _buildTableCell('Rasyonellik', 'Akıl ve mantık tarafından yönlendirilmek', 31),
        _buildTableCell('Bağlılık', 'Kalıcı, anlamlı ilişkilerde bulunmak', 32),
        _buildTableCell('Sorumluluk', 'Sorumlu kararlar almak ve yükümlülüklerimi yerine getirmek', 33),
        _buildTableCell('Eğlence', 'Keyif almak için faaliyetler yapmak', 34),
        _buildTableCell('Sağlık', 'Fiziksel olarak iyi ve sağlıklı olmak', 35),
        _buildTableCell('Tutku', 'Fikirler, etkinlikler ve insanlar hakkında derin duygulara sahip olmak', 36),
        _buildTableCell('Basitlik', 'Hayatı basit, minimum ihtiyaçlarla yaşamak', 37),
        _buildTableCell('Maneviyat', 'Ruhsal olarak büyümek ve olgunlaşmak', 38),
        _buildTableCell('Gelenek', 'Geçmişin saygın kalıplarını takip etmek', 39),
        _buildTableCell('Aşk', 'Hayatımda yoğun, heyecan verici bir aşka sahip olmak', 40),
        _buildTableCell('Cesaret', 'Risk veya tehlike içeren şeyleri üstlenmeye istekli olmak', 41),
        _buildTableCell('Özerklik', 'Kendi kaderini tayin etmek ve bağımsız olmak', 42),
        _buildTableCell('Sıkı Çalışma', 'Hayatımdaki görevlerimde sıkı ve iyi çalışmak', 43),
        _buildTableCell('Meydan Okumak', 'Zor görevleri ve sorunları üstlenmek', 44),
        _buildTableCell('İradeli Olma', 'Kendi eylemlerimde disiplinli olmak', 45),
        _buildTableCell('Erdemlilik', 'Ahlaki olarak saf ve mükemmel bir hayat yaşamak', 46),
        _buildTableCell('Dürüstlük', 'Dürüst ve doğru olmak', 47),
        _buildTableCell('Güvenirlik', 'Güvenilir olmak', 48),
        _buildTableCell('Samimiyet', 'En derin deneyimleri başkalarıyla paylaşacak ilişkileri kurmak', 49),
      ],
    );
  }


  // Daha büyük ekranlar için tablo yapısı
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
              ['Katkı', 'Bir şeyin, gelişmesine ya da gerçekleşmesine emek, bilgi, para vb. ile yardım etmek'],
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
      return Container(); // Out of bounds durumunda boş container döndür
    }
    return Container(
      height: 250,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            continuationText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30, // Butonun genişliği
                height: 30, // Butonun yüksekliği
                child: _buildResponseButton('1', 1, cellIndex),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 30,
                height: 30,
                child: _buildResponseButton('2', 2, cellIndex),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 30,
                height: 30,
                child: _buildResponseButton('3', 3, cellIndex),
              ),
            ],
          )

        ],
      ),
    );
  }

  Widget _buildResponseButton(String label, int value, int cellIndex) {
    bool isSelected = selectedValues[cellIndex] == value;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedValues[cellIndex] = value;
        });
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40, 40),
        backgroundColor: isSelected ? Colors.blue : Colors.grey,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths(double maxWidth) {
    if (maxWidth < 600) {
      return {
        0: const FlexColumnWidth(3),
        1: const FlexColumnWidth(3),
        2: const FlexColumnWidth(3),
        3: const FlexColumnWidth(3),
        4: const FlexColumnWidth(3),
      };
    } else {
      return {
        0: const FlexColumnWidth(3),
        1: const FlexColumnWidth(2),
        2: const FlexColumnWidth(2),
        3: const FlexColumnWidth(2),
        4: const FlexColumnWidth(2),
      };
    }
  }
}
