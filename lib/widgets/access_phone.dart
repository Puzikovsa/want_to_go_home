import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_to_go_home/models/phone_list.dart';
import '../pages/access_list_page.dart';

class AccessPhone extends StatelessWidget {
  const AccessPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AccessListPage.rout);
          },
          child: FutureBuilder(
              future:
                  Provider.of<PhoneList>(context, listen: false).setAccessPhone(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Consumer<PhoneList>(
                  builder: (context, phoneList, child) =>
                      phoneList.accessPhone.isEmpty
                          ? child!
                          : ListView.builder(
                              itemCount: Provider.of<PhoneList>(context)
                                  .accessPhone
                                  .length,
                              itemBuilder: (context, index) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                               children:[
                                 Text(Provider.of<PhoneList>(context)
                                   .accessPhone[index]
                                   .number,
                                 style: const TextStyle(
                                   fontSize: 28,
                                   fontWeight: FontWeight.bold
                                 ),
                                 ),
                                 Text(Provider.of<PhoneList>(context)
                                     .accessPhone[index]
                                     .title),
                                  const Divider(),
                                  const Text('Для изменения нажмите здесь'),
                               ]
                              ),
                            ),
                  child: const Text(
                      'Здесь пока пусто \nНажмите, чтобы добавить\nточку доступа ',
                      textAlign: TextAlign.center),
                );
              }),
        ),
      ),
    );
  }
}
