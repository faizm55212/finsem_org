import 'package:finsem_org/controller/user_controller.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController? _name;
  TextEditingController? _age;
  TextEditingController? _block;
  TextEditingController? _flatNo;
  TextEditingController? _mobileNo;
  TextEditingController? _idNo;
  TextEditingController? _occupation;
  TextEditingController? _email;
  TextEditingController? _passwd;
  @override
  void initState() {
    _name = TextEditingController();
    _age = TextEditingController();
    _block = TextEditingController();
    _flatNo = TextEditingController();
    _mobileNo = TextEditingController();
    _idNo = TextEditingController();
    _occupation = TextEditingController();
    _email = TextEditingController();
    _passwd = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name!.dispose();
    _age!.dispose();
    _block!.dispose();
    _flatNo!.dispose();
    _mobileNo!.dispose();
    _idNo!.dispose();
    _occupation!.dispose();
    _email!.dispose();
    _passwd!.dispose();
    super.dispose();
  }

  void _submit() {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Detail'),
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
                    child: Text("Email: " + _email!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_block!.text + "  " + _flatNo!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_occupation!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_idTypeValue + " No: " + _idNo!.text,
                        style: const TextStyle(fontWeight: FontWeight.w700))),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                  child: const Text('Go to Home'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, // so the alert dialog is closed when navigating back to main page
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                  ),
                  child: const Text('Submit'),
                  onPressed: () async {
                    HttpsCallable callable =
                        FirebaseFunctions.instanceFor(region: 'asia-south1')
                            .httpsCallable('manageUser');
                    callable.call(<String, dynamic>{
                      'req': 'add_user',
                      'email': _email!.text,
                      'passwd': _passwd!.text,
                      'name': _name!.text,
                      'age': _age!.text,
                      'gender': _genderValue,
                      'mobile': _mobileNo!.text,
                      'block': _block!.text,
                      'flatNo': _flatNo!.text,
                      'idType': _idTypeValue,
                      'idNo': _idNo!.text,
                      'occupation': _occupation!.text,
                      'org': UserController.loggedInUser.value.name,
                      'oid': UserController.loggedInUser.value.uid,
                      'monthly': 3500,
                      'pending': 3500,
                    }).then((value) {
                      Fluttertoast.showToast(msg: value.data.toString());
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }).catchError((onError) {
                      Fluttertoast.showToast(
                        msg: onError,
                        backgroundColor: Colors.red,
                      );
                    });
                  },
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
              SizedBox(height: 15.h),
              TextFormField(
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
              TextFormField(
                controller: _mobileNo,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 165.w,
                    child: TextFormField(
                      controller: _block,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Block",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 165.w,
                    child: TextFormField(
                      controller: _flatNo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Flat No",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _occupation,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: "Occupation",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                              borderRadius: BorderRadius.circular(10),
                              value: _idTypeValue,

                              items: idType.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),

                              onChanged: (String? newValue) {
                                setState(() {
                                  _idTypeValue = newValue!;
                                });
                              }, //dropdown background color
                              underline: Container(),
                              isExpanded: true,
                              icon: const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ))),
                  ),
                  SizedBox(
                    width: 165.w,
                    child: TextFormField(
                      controller: _idNo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "ID Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _passwd,
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
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
                      'Add User',
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
