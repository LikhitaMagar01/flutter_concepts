import 'package:flutter/material.dart';
import 'package:freezed_project/model/person_model.dart';

class FreezedHomePageView extends StatefulWidget {
  final String title;
  const FreezedHomePageView({super.key, required this.title});

  @override
  State<FreezedHomePageView> createState() => _FreezedHomePageViewState();
}

class _FreezedHomePageViewState extends State<FreezedHomePageView> {
  List<PersonModel> personList = [];

  @override
  void initState() {
    super.initState();
    var data = [
      {'name': 'first man'},
      {'name': null},
      {'name': 'second man'},
    ];

    for (int i = 0; i < data.length; i++) {
      personList.add(PersonModel.fromJson(data[i]));
    }
  }

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
            title: Text(
              personList[index].name ?? '',
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, dynamic> data = {
            'name': null,
          };

          PersonModel model = PersonModel.fromJson(data);
          print('value' + model.name.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
