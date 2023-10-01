import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:want_to_go_home/models/phone_list.dart';
import 'package:want_to_go_home/pages/add_phone_page.dart';

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
            const Text(
              'Для выбора нажать на поле точки доступа',
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const Text(
              'Для удаления нажать и удерживать его',
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                  future: Provider.of<PhoneList>(context, listen: false)
                      .fetchAndSetListPhone(),
                  builder: (context, snapshot) {
                    return Consumer<PhoneList>(
                      builder: (context, phoneList, child) => phoneList
                              .items.isEmpty
                          ? child!
                          : ListView.builder(
                              itemCount:
                                  Provider.of<PhoneList>(context).items.length,
                              itemBuilder: (context, index) => ListTile(
                                splashColor: Colors.red,
                                title: Text(Provider.of<PhoneList>(context)
                                    .items[index]
                                    .number),
                                subtitle: Text(Provider.of<PhoneList>(context)
                                    .items[index]
                                    .title),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                onTap: () {
                                  Provider.of<PhoneList>(context, listen: false)
                                      .changeAccessPhone(
                                          Provider.of<PhoneList>(context,
                                                  listen: false)
                                              .items[index]
                                              .title,
                                          Provider.of<PhoneList>(context,
                                                  listen: false)
                                              .items[index]
                                              .number);
                                  Navigator.of(context).pop();
                                },
                                onLongPress: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Удалить номер?'),
                                      duration: const Duration(seconds: 3),
                                      action: SnackBarAction(
                                          label: 'Да',
                                          onPressed: () {
                                            Provider.of<PhoneList>(context,
                                                    listen: false)
                                                .deletePhone(
                                                    phoneList.items[index]);
                                          }),
                                    ),
                                  );
                                },
                              ),
                            ),
                      child: const Center(
                        child: Text(
                          'Не найдено ни одного места.\nСамое время добавить новое!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
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
