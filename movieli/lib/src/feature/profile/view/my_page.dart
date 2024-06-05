import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movieli/src/feature/profile/view/my_page_notifier.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        StateNotifierProvider<MyPageNotifier, MyPageState>(
          create: (context) => MyPageNotifier(
            context: context,
          ),
        )
      ],
      child: const MyPage(),
    );
  }

  // void (no return value) method_name (arguments here) {
  // Some actual processing
  // }

  //   string method name(arguments here){
  //     return nankamozi;
  // }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MyPageNotifier>();
    print('notifier');
    return Scaffold(
      appBar: AppBar(
        title: const Text('An app to save weight'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child: Builder(builder: (BuildContext context) {
                  final records = context.select((MyPageState state) => state.record);
                  return ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (BuildContext context, int index) {
                        final record = records[index];
                        return Container(
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 26,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(10, 10),
                              ),
                            ],
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.only(left: 12),
                                    width: 100,
                                    child: Text(
                                      '${record['weight']!} Kg',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 24,
                                            child: Icon(Icons.calendar_today),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            record['day']!,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 24,
                                          child: Icon(Icons.comment),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          record['comment']!,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  editBox(context, records, index, notifier);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              const SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  notifier.deleteRecord(index);
                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          ),
                        );
                      });
                }),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: Colors.blue,
                child: Column(
                  children: [
                    const Text(
                      'Add Weight',
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        popUpForm(context, notifier);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void popUpForm(BuildContext context, MyPageNotifier notifier) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text('Enter today\n s weight'),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 24,
        ),
        children: [
          Row(
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.only(left: 4),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'do not lie',
                    labelText: 'Today s weight',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    notifier.saveWeight(value);
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Kg'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.only(left: 4),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Do not regret it first',
                labelText: 'A word of confession',
              ),
              onChanged: (value) {
                notifier.saveComment(value);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Registration',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              notifier.register();
            },
          )
        ],
      );
    },
  );
}

void editBox(BuildContext context, List<Map<String, String>> records, int index, MyPageNotifier notifier) {
  final record = records[index];
  final weightController = TextEditingController(text: record['weight']);
  final commentController = TextEditingController(text: record['comment']);
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text('Edit Weight Record'),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 24,
        ),
        children: [
          Row(
            children: [
              Container(
                width: 200,
                padding: const EdgeInsets.only(left: 4),
                child: TextFormField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'do not lie',
                    labelText: 'Today\'s weight',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Kg'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            padding: const EdgeInsets.only(left: 4),
            child: TextFormField(
              controller: commentController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Do not regret it first',
                labelText: 'A word of confession',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Save',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              notifier.saveEditedRecord(index, weightController.text, commentController.text);
            },
          ),
        ],
      );
    },
  );
}
