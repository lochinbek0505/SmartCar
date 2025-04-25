import 'package:flutter/material.dart';
import 'package:smart_car/services/themes/colors.dart';

class LocationPage extends StatelessWidget {
  final List<Map<String, String>> gasStations = [
    {
      'name': 'АЗС Узнефтепродукт',
      'distance': '0.8 км от вас',
      'address': 'улица Рудакий, Самарканд',
    },
    {
      'name': 'Petro Invest АЗС',
      'distance': '1.5 км от вас',
      'address': 'проспект Истиқлол, 54',
    },
    {
      'name': 'EcoOil Самарканд',
      'distance': '2.3 км от вас',
      'address': 'улица Беруни, 12',
    },
    {
      'name': 'Шерхон АЗС',
      'distance': '3.0 км от вас',
      'address': 'улица Бунёдкор, рядом с базаром',
    },
    {
      'name': 'Ёшлик Нефтебаза',
      'distance': '4.1 км от вас',
      'address': 'Чиланзарский район, Самарканд',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text('АЗС в Самарканде', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: gasStations.length,
        itemBuilder: (context, index) {
          final station = gasStations[index];
          return Card(
            color: Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(
                Icons.local_gas_station,
                color: Colors.amber,
                size: 32,
              ),
              title: Text(
                station['name']!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    station['distance']!,
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    station['address']!,
                    style: TextStyle(color: Colors.white54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
