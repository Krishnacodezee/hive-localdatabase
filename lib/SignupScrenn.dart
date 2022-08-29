import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localdatabse/DIsplayScreen.dart';
import 'package:localdatabse/hivemodel.dart';

late final Box box;

class Signuoscreen extends StatefulWidget {
  const Signuoscreen({Key? key}) : super(key: key);

  @override
  State<Signuoscreen> createState() => _SignuoscreenState();
}

class _SignuoscreenState extends State<Signuoscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    openbox();
  }

  openbox() async {
    await Hive.openBox("peopleBox");
    box = Hive.box('peopleBox');
  }

  _addInfo() async {
    Detail newPerson = Detail(
      name: _nameController.text,
      userid: int.parse(_useridController.text),
      mobilenumber: _mobileController.text,
      email: _emailController.text,
    );
    box.add(newPerson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp Screen",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Require";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _useridController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Require";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'User Id',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _mobileController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Require";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Mobile Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*Require";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _addInfo();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayScreen()),
                  );
                }
              },
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
