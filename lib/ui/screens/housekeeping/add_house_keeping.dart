import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_org/controller/user_controller.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/ui/screens/dashboard/dashboard.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddHousekeeping extends StatefulWidget {
  const AddHousekeeping({Key? key}) : super(key: key);

  @override
  State<AddHousekeeping> createState() => _AddHousekeepingState();
}

class _AddHousekeepingState extends State<AddHousekeeping> {
  TextEditingController? _name;
  TextEditingController? _age;
  TextEditingController? _mobileNo;
  TextEditingController? _serviceDescription;
  TextEditingController? _serviceType;
  @override
  void initState() {
    _name = TextEditingController();
    _age = TextEditingController();
    _mobileNo = TextEditingController();
    _serviceDescription = TextEditingController();
    _serviceType = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name!.dispose();
    _age!.dispose();
    _mobileNo!.dispose();
    _serviceDescription!.dispose();
    _serviceType!.dispose();
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
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Age: " + _age!.text + " " + _genderValue,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Mobile No: " + _mobileNo!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Service Type: " + _serviceType!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_serviceDescription!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
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
                  onPressed: () async {
                    DocumentReference dr = FirebaseFirestore.instance
                        .collection('Organizations')
                        .doc(UserController.loggedInUser.value.uid)
                        .collection('Housekeeping')
                        .doc();
                    await dr.set({
                      "name": _name!.text,
                      "serviceType": _serviceType!.text,
                      "serviceDescription": _serviceDescription!.text,
                      "mobile": _mobileNo!.text,
                      "age": _age!.text,
                      "gender": _genderValue,
                      "uploadDate": DateTime.now().millisecondsSinceEpoch,
                    }).then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
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
  var gender = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: "Add Housekeeper",
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
              Row(
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
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ))),
                  )
                ],
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
                controller: _serviceType,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Service Type",
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
                  controller: _serviceDescription,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Description",
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
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: FinColours.mainColor),
                  child: const Center(
                    child: Text(
                      'Add Housekeeper',
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
