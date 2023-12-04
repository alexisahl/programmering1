import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ["Code Flutter", "Code Done", "Swipe"]; //gör listan av tasks, men lägger till 
  List<bool> checkboxValues = [false, false, false]; //initialiserar alla checkbox values som false
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [ //children
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (BuildContext context, int index) {
                return Dismissible( //Gör en dismissable class
                  background: Container( //färg och style på allt i slide funktionen
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [ //ikonen som synns på swipe funktion och dens properites
                          Icon(Icons.delete, color: Colors.white),
                          SizedBox(width: 8.0,),
                          Text('Move to trash', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  key: ValueKey<String>(items[index]), //removar items
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  confirmDismiss: (DismissDirection direction) async { //gör en popup, om int så raderar den instantly
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Remove Item"),
                          content: const Text("Are you sure you wish to remove this task?"),
                          actions: <Widget>[ //gör textbuttons som man kan trycka på
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text("No"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CheckboxListTile( //gör checkboxerna, pretty straightforward. får nammen från items list index
                    title: Text(items[index], style: TextStyle(color: Colors.black),),
                    activeColor: Colors.lightGreen,
                    tileColor: Colors.grey,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: checkboxValues[index],
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValues[index] = value ?? true;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding( //gör add task buttons
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20 ),
            child: ElevatedButton(
              onPressed: () async {
                String? newTask = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Add New Task"),
                      content: TextField( //gör en textfield vart man kan skriva
                        controller: taskController,
                        onChanged: (value) => value.trim(),
                        decoration: const InputDecoration(
                          hintText: "Enter task",
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(taskController.text);
                          },
                          child: const Text("Add"),
                        ),
                      ],
                    );
                  },
                );

                if (newTask != null && newTask.isNotEmpty) { //gör en new task om det finns något skrivet
                  setState(() {
                    items.add(newTask!);
                    checkboxValues.add(false);
                  });
                }

                taskController.clear();
              },
              child: const Text("Add Task"),
            ),
          ),
        ],
      ),
    );
  }
}
