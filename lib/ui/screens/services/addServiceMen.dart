import 'dart:developer';

import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/screens/dashboard/dashboard.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddServiceMen extends StatefulWidget {
  const AddServiceMen({Key? key}) : super(key: key);

  @override
  State<AddServiceMen> createState() => _AddServiceMenState();
}

class _AddServiceMenState extends State<AddServiceMen> {
  TextEditingController? _name;
  TextEditingController? _age;
  TextEditingController? _mobileNo;
  TextEditingController? _occupation;
  TextEditingController? _email;
  @override
  void initState() {
    _name = TextEditingController();
    _age = TextEditingController();
    _mobileNo = TextEditingController();
    _occupation = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name!.dispose();
    _age!.dispose();
    _mobileNo!.dispose();
    _occupation!.dispose();
    _email!.dispose();
    super.dispose();
  }

  void _submit() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Service Added'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Name: " + _name!.text,
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Age: " + _age!.text + " " + _genderValue,
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Mobile No: " + _mobileNo!.text,
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email: " + _email!.text,
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_occupation!.text,
                        style: TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    ); // Empty the form fields
                    setState(() {});
                  }, // so the alert dialog is closed when navigating back to main page
                ),
              ],
            )
          ],
        );
      },
    );
  }

  String _genderValue = "Male";
  String _idTypeValue = "Aadhar";
  var gender = [
    'Male',
    'Female',
  ];
  var idType = [
    'Aadhar',
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: "Add User",
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                child: TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 165.w,
                      child: TextFormField(
                        controller: _age,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Age",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 165.w,
                      height: 55.h,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black38,
                                width: 1), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                20), //border raiuds of dropdown button
                          ),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: DropdownButton(
                                value: _genderValue,

                                items: gender.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    _genderValue = newValue!;
                                  });
                                }, //dropdown background color
                                underline: Container(),
                                isExpanded: true,
                                icon: const Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Icon(
                                        Icons.keyboard_arrow_down_rounded)),
                              ))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                //width: 165.w,
                child: TextFormField(
                  controller: _mobileNo,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                child: TextFormField(
                  controller: _occupation,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Service",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 40.h,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Container(
                  height: 35,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: FinColours.mainColor),
                  child: const Center(
                    child: Text(
                      'Add Service',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  _submit();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
