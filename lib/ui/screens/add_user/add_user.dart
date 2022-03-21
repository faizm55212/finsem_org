import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwd = TextEditingController();
  final TextEditingController _add = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            controller: _name,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextFormField(
            controller: _add,
            keyboardType: TextInputType.streetAddress,
            maxLines: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextFormField(
            controller: _passwd,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              HttpsCallable callable =
                  FirebaseFunctions.instanceFor(region: 'asia-south1')
                      .httpsCallable('manageUser');
              callable.call(<String, dynamic>{
                'req': 'add_user',
                'name': _name.text,
                'email': _email.text,
                'add': _add.text,
                'passwd': _passwd.text,
                'org': 'Calc',
                'oid': 'OU7N0lCaWVxbYssLmM19',
                'monthly': 100,
                'pending': 15
              }).then((value) =>
                  Fluttertoast.showToast(msg: value.data.toString()));
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }
}