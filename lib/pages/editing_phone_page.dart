import 'package:flutter/material.dart';

class EditingPhonePage extends StatelessWidget{
  const EditingPhonePage({super.key});

  static const String rout = '/edit_phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Редактирование точки доступа'),
      ),
      body: const Center(
        child: Text('Разрабатывается'),
      ),
    );
  }

}