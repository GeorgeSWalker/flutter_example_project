import 'package:flutter/material.dart';

// Form imports
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = '';
  String email = '';
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Project'),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 0, 50, 20),
        child: ListView(
          children: [
            FormBuilderTextField(
                name: 'Name',
              decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(1),
              ]),
              onChanged: (value) {
                  setState(() {
                    name = value!;
                  });
              },
            ),
            FormBuilderTextField(
              name: 'Email',
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
              },
            ),
            const SizedBox(height: 200,),
            Text('Name: $name'),
            Text('Email: $email'),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: submitData,
        label: const Text('Submit'),
        tooltip: 'Submit',
        icon: const Icon(Icons.send),
        isExtended: isSwitched,
      ),
    );
  }

  submitData() async {
    print('Name: $name');
    print('Email: $email');
    setState(() {
      isSwitched = true;
    });
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) => setState(() {
        isSwitched = false;
      })
    );
  }

  //Create a function that will navigate to a new page called settings
  void navigateToSettings() {
    Navigator.pushNamed(context, '/settings');
  }
}
