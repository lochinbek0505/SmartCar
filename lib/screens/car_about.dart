import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_car/services/themes/colors.dart';

class CobaltInfoPage extends StatelessWidget {
  const CobaltInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.backgroundDark,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("GM Cobalt", style: TextStyle(color: Colors.white)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Neon effect title
                  const SizedBox(height: 20),

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
