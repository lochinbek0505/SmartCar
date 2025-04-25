import 'package:flutter/material.dart';

import '../../services/notifacation_service.dart';

class FuelInputDialog extends StatefulWidget {
  String state;

  FuelInputDialog(this.state);

  @override
  _FuelInputDialogState createState() => _FuelInputDialogState();
}

class _FuelInputDialogState extends State<FuelInputDialog> {
  final TextEditingController _fuelController = TextEditingController();
  String? _fuelAmount;
  String selectedFuelType = 'fuel'; // Default: 'fuel'

  giveMessage(count) {
    if (selectedFuelType == 'fuel') {
      if (count < 5) {
        NotificationService.showSimpleNotification(
          'Топливо на исходе',
          'Пожалуйста, заправьте топливо',
        );
      }
      // NotificationService.showSimpleNotification(
      //   'Salom! Bu oddiy bildirishnoma.',
      // );
    } else {
      if (count > 999) {
        NotificationService.showSimpleNotification(
          'Время заменить моторное масло',
          'Пожалуйста, замените моторное масло',
        );
      }
    }
  }

  void _submitFuelAmount() {
    var value = int.parse(_fuelController.text.toString());
    giveMessage(value);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFuelType = widget.state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Fuel type selection (fuel or motor oil)
        SizedBox(height: 20),

        // Fuel amount input
        TextField(
          controller: _fuelController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Введите количество в литрах',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: Icon(Icons.local_gas_station),
          ),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),

        // Submit button
        Container(
          width: 200,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
          child: ElevatedButton(
            onPressed: _submitFuelAmount,
            child: Text('Отправить', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ),

        // Display result
        SizedBox(height: 20),
      ],
    );
  }
}
