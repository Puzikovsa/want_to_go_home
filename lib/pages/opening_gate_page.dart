import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:want_to_go_home/models/phone_list.dart';
import '../widgets/access_phone.dart';

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
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AccessPhone(),
            FloatingActionButton.extended(
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber(
                    PhoneList().accessPhone[0].number.toString());
              },
              label: const Text(
                'Открыть',
                style: TextStyle(color: Colors.black),
              ),
              icon: const Icon(Icons.phone,
              color: Colors.green,),
            ),
          ],
        ),
      ),
    );
  }
}
