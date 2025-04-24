import 'dart:ui';

import 'package:flutter/material.dart';

class CobaltInfoPage extends StatelessWidget {
  const CobaltInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("GM Cobalt"),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/img_tesla_grey.png', // o'zing rasm joylashtir
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.4)),
                ],
              ),
            ),
            backgroundColor: Colors.deepPurple.shade900,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Neon effect title
                  Text(
                    'Техническая информация',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.cyanAccent,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Stat cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoCard("Макс. скорость", "170 км/ч", Icons.speed),
                      _infoCard("Расход", "7 л/100км", Icons.local_gas_station),
                      _infoCard("Безопасность", "ABS + 2 ПБ", Icons.security),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _glassBox(
                    title: "🔍 Обзор",
                    content:
                        "GM Cobalt — это компактный и надежный седан, идеально подходящий для городской езды. Отличается простым обслуживанием и доступной ценой.",
                  ),
                  const SizedBox(height: 16),
                  _glassBox(
                    title: "🎨 Интерьер",
                    content:
                        "Удобные сиденья, современная панель, мультимедиа с Bluetooth и USB. Просторный салон делает каждую поездку комфортной.",
                  ),
                  const SizedBox(height: 16),
                  _glassBox(
                    title: "⚙️ Двигатель",
                    content:
                        "Двигатель объемом 1.5L обеспечивает хорошую динамику и топливную экономичность. Доступны как МКПП, так и АКПП.",
                  ),

                  const SizedBox(height: 24),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Stat card widget
  Widget _infoCard(String label, String value, IconData icon) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.cyanAccent, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Glass-style info box
  Widget _glassBox({required String title, required String content}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
