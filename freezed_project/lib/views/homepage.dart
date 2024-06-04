import 'package:flutter/material.dart';
import 'package:freezed_project/model/person_no_freezed_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonModel> personList = [
    PersonModel(name: null),
    PersonModel(name: 'auta manxe'),
    PersonModel(name: 'duita manxe'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personList[index].name ?? ''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PersonModel personModel = PersonModel(name: 'manxe');
          PersonModel personModel1 = PersonModel(name: 'manxe');
          print(personModel1.hashCode.toString() == personModel.hashCode.toString());

          Map<String, dynamic> data = {
            'name': 'manse',
          };

          PersonModel model = PersonModel.fromJson(data);
          print(model.name.toString());

          PersonModel model1 = PersonModel();
          model1 = model.copyWith(name: 'naya manxe');
          print(model1.name);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
