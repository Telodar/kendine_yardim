import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class LifeArea {
  final String name;
  int importance; // 1 ile 5 arasında bir değer
  int alignment;  // 1 ile 5 arasında bir değer

  LifeArea({
    required this.name,
    this.importance = 1,
    this.alignment = 1,
  });
}

class LifeAreaProvider with ChangeNotifier {
  List<LifeArea> _lifeAreas = [
    LifeArea(name: 'Aile', importance: 1, alignment: 1),
    LifeArea(name: 'Kariyer', importance: 1, alignment: 1),
    LifeArea(name: 'Sağlık', importance: 1, alignment: 1),
    LifeArea(name: 'Sosyal Yaşam', importance: 1, alignment: 1),
    LifeArea(name: 'Hobiler', importance: 1, alignment: 1),
    LifeArea(name: 'Mali Durum', importance: 1, alignment: 1),
    LifeArea(name: 'Kişisel Gelişim', importance: 1, alignment: 1),
    LifeArea(name: 'Eğitim', importance: 1, alignment: 1),
    LifeArea(name: 'İlişkiler', importance: 1, alignment: 1),
    LifeArea(name: 'Zaman Yönetimi', importance: 1, alignment: 1),
  ];

  List<LifeArea> get lifeAreas => _lifeAreas;

  void updateImportance(int index, int value) {
    _lifeAreas[index].importance = value;
    notifyListeners();
  }

  void updateAlignment(int index, int value) {
    _lifeAreas[index].alignment = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LifeAreaProvider()),
      ],
      child: MaterialApp(
        title: 'Yaşam Alanları Uygulaması',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LifeAreaProvider>(context);
    final lifeAreas = provider.lifeAreas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Yaşam Alanları'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
              painter: SpiderChartPainter(lifeAreas),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lifeAreas.length,
              itemBuilder: (context, index) {
                final area = lifeAreas[index];
                return ListTile(
                  title: Text(area.name),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Slider(
                          min: 1,
                          max: 5,
                          divisions: 4,
                          value: area.importance.toDouble(),
                          onChanged: (value) {
                            provider.updateImportance(index, value.toInt());
                          },
                        ),
                      ),
                      Text('Önem: ${area.importance}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Davranış:'),
                      SizedBox(width: 10),
                      DropdownButton<int>(
                        value: area.alignment,
                        items: List.generate(5, (i) => i + 1)
                            .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.toString()),
                        ))
                            .toList(),
                        onChanged: (value) {
                          provider.updateAlignment(index, value ?? 1);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SpiderChartPainter extends CustomPainter {
  final List<LifeArea> lifeAreas;

  SpiderChartPainter(this.lifeAreas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;
    final step = 360 / lifeAreas.length;

    for (int i = 0; i < lifeAreas.length; i++) {
      final area = lifeAreas[i];
      final angle = step * i * (pi / 180);
      final radius = maxRadius * (area.importance / 5);
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), paint);
    }

    paint.color = Colors.blue.withOpacity(0.5);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    for (int i = 0; i < lifeAreas.length; i++) {
      final area = lifeAreas[i];
      final angle = step * i * (pi / 180);
      final radius = maxRadius * (area.importance / 5);
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
