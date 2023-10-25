import 'package:expence_data_model/screen/expenses.dart';
import 'package:expence_data_model/todo/todo.dart';
import 'package:expence_data_model/todo/todo_models.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = -1;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<TodoModel> register = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: nameController,
              maxLength: 20,
              keyboardType: TextInputType.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.00)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: numberController,
              maxLength: 10,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Number",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.00),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.00,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(nameController);
                  print(numberController);
                  setState(() {
                    int parsedNumber = int.parse(numberController.text);
                    register.add(
                      TodoModel(nameController.text, parsedNumber),
                    );
                    nameController.clear();
                    numberController.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150.00, 50.00),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String actualName = nameController.text;
                  int actualNumber = int.parse(numberController.text);
                  setState(
                    () {
                      register[selectedIndex].name = actualName;
                      register[selectedIndex].number = actualNumber;
                      selectedIndex - 1;
                      nameController.text = '';
                      numberController.text = '';
                      // register.add(
                      //   TodoModel(actualName, actualNumber),
                      // );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150.00, 50.00),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: register.length,
              itemBuilder: (context, index) {
                final item = register[index];
                print(register.length);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.00),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.cyanAccent,
                        child: Text(
                          item.name.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.00),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        item.number.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              nameController.text = register[index].name;
                              numberController.text =
                                  register[index].number.toString();
                              setState(
                                () {
                                  selectedIndex = index;
                                },
                              );
                            },
                            child: const Icon(Icons.edit, color: Colors.blue),
                          ),
                          const SizedBox(
                              width: 10), // Add spacing between icons
                          InkWell(
                            onTap: () {
                              setState(() {
                                register.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

//
// return ListTile(
// leading: InkWell(
// child: const Icon(Icons.person),
// // child:  Text(nameController.text.length),
// onTap: () {},
// ),
// title: Padding(
// padding: const EdgeInsets.only(bottom: 10.00),
// child: Text(
// item.name,
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.black,
// ),
// ),
// ),
// subtitle: Text(
// item.number.toString(),
// style: const TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w400,
// color: Colors.black,
// ),
// ),
// trailing: const InkWell(
// child: Icon(Icons.delete),
// ),
// );
