import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_to_go_home/pages/access_list_page.dart';
import 'package:want_to_go_home/pages/add_phone_page.dart';
import 'package:want_to_go_home/pages/editing_phone_page.dart';
import 'package:want_to_go_home/pages/opening_gate_page.dart';
import 'models/phone_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: PhoneList())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.limeAccent),
          ),
        home: const OpeningGatePage(),
        routes: {
          EditingPhonePage.rout: (context) => const EditingPhonePage(),
          AddPhonePage.rout: (context) => const AddPhonePage(),
          AccessListPage.rout: (context) => const AccessListPage(),
        },
      ),
    );
  }
}
