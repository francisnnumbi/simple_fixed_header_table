import 'package:collection_ext/all.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:simple_fixed_header_table/fixed_header_table.dart';
import 'package:simple_fixed_header_table/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Faker faker = Faker();
  late List<UserModel> users;

  @override
  void initState() {
    users = List.generate(50, (index) {
      return UserModel(name: faker.person.name(), sex: faker.randomGenerator.element(["M", "F"]), age: faker.randomGenerator.integer(90, min: 7));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Simple Fixed Header Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FixedHeaderTable(
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(50.0),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(0.2),
            3: FlexColumnWidth(0.3),
          },
          header: TableRow(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(4),
                child: const Center(
                    child: Text(
                  '#',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Center(
                    child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Center(
                    child: Text(
                  'Sex',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                child: const Center(
                    child: Text(
                  'Age',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
              ),
            ],
          ),
          rows: users.mapIndexed((i, user) {
            return TableRow(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        (i + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Center(
                      child: Text(
                    user.sex,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  )),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        user.age.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            );
          }).toList(),
        ),

        /* ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              UserModel user = users[index];
              return ListTile(
                title: Text(user.name),
                leading: CircleAvatar(
                  child: Text(
                    user.sex,
                  ),
                ),
                trailing: Text("${user.age} yrs"),
              );
            }),*/
      ),
    );
  }
}
