import 'package:flutter/material.dart';
import 'package:want_to_go_home/pages/access_list_page.dart';

class OpeningGatePage extends StatelessWidget {
  const OpeningGatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Открыть шлагбаум'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Точка доступа',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Нажмите здесь, чтобы открыть шлагбаум'),
                  ],
                ),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, AccessListPage.rout);
              },
              label: const Text(
                'Изменить',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
