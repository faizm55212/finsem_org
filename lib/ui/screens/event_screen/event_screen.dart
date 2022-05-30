import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  TextEditingController? _eventName;
  TextEditingController? _eventDesc;
  TextEditingController? _eventLocation;
  TextEditingController? _eventDate;
  TextEditingController? _eventTime;

  @override
  void initState() {
    _eventName = TextEditingController();
    _eventDesc = TextEditingController();
    _eventLocation = TextEditingController();
    _eventDate = TextEditingController();
    _eventTime = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _eventName!.dispose();
    _eventDesc!.dispose();
    _eventLocation!.dispose();
    _eventDate!.dispose();
    _eventTime!.dispose();

    super.dispose();
  }

  String _eventTimeTypeValue = "AM";
  var timeType = [
    'AM',
    'PM',
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Add Events',
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
                  controller: _eventName,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Name",
                    //hintText: 'Name',
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
                child: TextFormField(
                  controller: _eventDesc,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Description",
                    //hintText: 'Name',
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
                      width: 130.w,
                      child: TextFormField(
                        controller: _eventDate,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: "Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: TextFormField(
                        controller: _eventTime,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: "Time",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
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
                              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                              child: DropdownButton(
                                value: _eventTimeTypeValue,

                                items: timeType.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    _eventTimeTypeValue = newValue!;
                                  });
                                }, //dropdown background color
                                underline: Container(),
                                isExpanded: true,
                                icon: Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: Icon(
                                        Icons.keyboard_arrow_down_rounded)),
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                child: TextFormField(
                  controller: _eventLocation,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Location",
                    //hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              //TODO:Add Funding Required Radio Check Box
              Text("Add Funding Required Radio Check Box"),
              //TODO:Add Image Picker for event
              Text("Add Image PIcker"),
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
                      'Post Event',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  //_submit();
                  //print(_genderValue);
                  //TODO: UPDATE POST METHOD OF ADD USER
                  // HttpsCallable callable =
                  //     FirebaseFunctions.instanceFor(region: 'asia-south1')
                  //         .httpsCallable('manageUser');
                  // callable.call(<String, dynamic>{
                  //   'req': 'add_user',
                  //   'name': _name!.text,
                  //   'email': _email!.text,
                  //   'add': _add!.text,
                  //   'passwd': _passwd!.text,
                  //   'org': 'Calc',
                  //   'oid': 'OU7N0lCaWVxbYssLmM19',
                  //   'monthly': 100,
                  //   'pending': 15
                  // }).then((value) =>
                  //     Fluttertoast.showToast(msg: value.data.toString()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
