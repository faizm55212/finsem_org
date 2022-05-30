import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  TextEditingController? _noticeName;
  TextEditingController? _noticeDesc;

  @override
  void initState() {
    _noticeName = TextEditingController();
    _noticeDesc = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _noticeName!.dispose();
    _noticeDesc!.dispose();

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
      title: 'Add Notice',
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
                  controller: _noticeName,
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
                  controller: _noticeDesc,
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
              //TODO:Add Image Picker for notice
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
                      'Post Notice',
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
