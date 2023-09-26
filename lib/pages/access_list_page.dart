import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_to_go_home/models/phone_list.dart';
import 'package:want_to_go_home/pages/add_phone_page.dart';
import 'editing_phone_page.dart';

class AccessListPage extends StatelessWidget {
  const AccessListPage({super.key});

  static const String rout = '/access_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('выбор точки доступа'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Consumer<PhoneList>(
                    builder: (context, phoneList, child) =>
                        phoneList.items.isEmpty
                            ? child!
                            : ListView.builder(
                                itemCount: Provider.of<PhoneList>(context)
                                    .items.length,
                                itemBuilder: (context, index) => ListTile(
                                  title: Text(Provider.of<PhoneList>(context)
                                      .items[index].number),
                                  subtitle: Text(Provider.of<PhoneList>(context)
                                      .items[index].title),
                                  trailing: IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, EditingPhonePage.rout);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                    child: const Center(
                      child: Text(
                        'Не найдено ни одного места.\nСамое время добавить новое!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPhonePage.rout);
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
