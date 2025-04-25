import 'package:flutter/material.dart';

import '../views/components/fuild_dailog.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  void _showFuelDialog(BuildContext context, String state) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Введите количество топлива'),
          content: FuelInputDialog(state),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Документы и штрафы',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            _buildCard(
              Icons.music_note,
              'Штрафы ГУБДД',
              'Все хорошо\nнет штрафов',
            ),
            _buildCard(Icons.shield, 'Штрафы МИБ', 'Все хорошо\nнет штрафов'),
            _buildProgressCard(
              Icons.description,
              'Страховка • OSAGO',
              '8 месяцев, 18 дней',
              '08-янв. 2026',
            ),
            _buildProgressCard(
              Icons.check_circle,
              'Технический осмотр',
              '7 лет, 8 месяцев, 11 дней',
              '01-янв. 2033',
            ),
            _buildAddCard(
              Icons.add,
              'Доверенность',
              'Добавьте информацию, чтобы перед истечением срока получать напоминания',
            ),
            _buildCard(
              Icons.blur_on,
              'Тонировка',
              'Информация о тонировке не найдена',
            ),
            GestureDetector(
              onTap: () {
                _showFuelDialog(context, 'fuel');
              },
              child: GestureDetector(
                onTap: () {
                  _showFuelDialog(context, 'oil');
                },
                child: _buildAddCard(
                  Icons.add,
                  'Масло',
                  'Добавьте информацию, чтобы перед истечением срока получать напоминания',
                ),
              ),
            ),
            _buildAddCard(
              Icons.add,
              'Газ',
              'Добавьте информацию, чтобы перед истечением срока получать напоминания',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(
    IconData icon,
    String title,
    String timeLeft,
    String date,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(timeLeft, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: 0.3,
            color: Colors.green,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(date, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildAddCard(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
