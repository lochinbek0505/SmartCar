import 'package:flutter/material.dart';

import '../services/notifacation_service.dart';

class Oilpage extends StatefulWidget {
  const Oilpage({super.key});

  @override
  State<Oilpage> createState() => _OilpageState();
}

class _OilpageState extends State<Oilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationService.showSimpleNotification(
              'Salom! Bu oddiy bildirishnoma.',
            );
          },
          child: Text("data"),
        ),
      ),
    );
  }
}
