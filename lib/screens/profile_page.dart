import 'package:flutter/material.dart';
import 'package:smart_car/services/themes/colors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Text('Профиль', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'НЕ ИДЕНТИФИЦИРОВАН',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+998885788448',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
            ],
          ),
          SizedBox(height: 24),
          _settingsTile(Icons.language, 'Язык интерфейса', 'Русский'),
          _settingsTile(Icons.color_lens, 'Настройки темы', 'Тема смартфона'),
          _settingsTile(Icons.credit_card, 'Карты'),
          _settingsTile(Icons.devices, 'Устройства'),
          _settingsTile(Icons.security, 'Безопасность'),
          _settingsTile(Icons.feedback, 'Обратная связь'),
          _settingsTile(Icons.share, 'Поделиться'),
          ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.red),
            title: Text('Выход', style: TextStyle(color: Colors.red)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white54,
              size: 16,
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Публичная оферта',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _settingsTile(IconData icon, String title, [String? subtitle]) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle:
          subtitle != null
              ? Text(subtitle, style: TextStyle(color: Colors.white70))
              : null,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
      onTap: () {},
    );
  }
}
