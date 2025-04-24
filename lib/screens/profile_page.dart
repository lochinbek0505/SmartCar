import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Color(0xFF0f0f1a)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Добро пожаловать, Азамат",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Car preview (just a box here, replace with your image or 3D)
                  Center(
                    child: Container(
                      height: 160,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white12,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/cobalt_preview.png",
                          ), // own car image
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Car status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _carStatus("Бензин", "75%", Icons.local_gas_station),
                      _carStatus("Темп.", "82°C", Icons.thermostat),
                      _carStatus("Блокировка", "Открыта", Icons.lock_open),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Центр управления",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Control buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _controlButton(Icons.power, "Запуск"),
                      _controlButton(Icons.lock, "Закрыть"),
                      _controlButton(Icons.lock_open, "Открыть"),
                      _controlButton(Icons.volume_up, "Сигнал"),
                      _controlButton(Icons.ac_unit, "Кондиционер"),
                      _controlButton(Icons.map, "GPS"),
                    ],
                  ),

                  const Spacer(),

                  // Bottom bar (optional)
                  Center(
                    child: Text(
                      "GM Cobalt Connected",
                      style: TextStyle(color: Colors.greenAccent, fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Car status widget
  Widget _carStatus(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.cyanAccent, size: 28),
        const SizedBox(height: 6),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
      ],
    );
  }

  // Control button widget
  Widget _controlButton(IconData icon, String label) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.lightBlueAccent, size: 28),
          const SizedBox(height: 6),
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }
}
