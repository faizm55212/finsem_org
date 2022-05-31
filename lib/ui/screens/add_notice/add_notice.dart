import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finsem_org/controller/api.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as debug;

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  TextEditingController? _noticeName;
  TextEditingController? _noticeDesc;
  final ImagePicker _picker = ImagePicker();
  File file = File('');

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
              SizedBox(height: 15.h),
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 15.h),
              file.path == ''
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              _imgFromGallery();
                            },
                            child: Container(
                              height: 100.h,
                              width: 130.w,
                              color: const Color(0xffF0F0F0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/gallery.svg',
                                    height: 30,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text('Add Images')
                                ],
                              ),
                            ),
                          )),
                    )
                  : Container(
                      height: 100.h,
                      width: 130.w,
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Stack(
                          children: [
                            Container(
                                height: 100.h,
                                width: 130.w,
                                color: const Color(0xffF0F0F0),
                                child: Image.file(
                                  file,
                                  fit: BoxFit.cover,
                                )),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    file = File('');
                                  });
                                },
                                child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: SvgPicture.asset(
                                    'assets/icons/deleteimage.svg',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: 10.h),
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
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            color: Colors.white,
                            height: 100,
                            width: 100,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      });
                  final uploadedImageURL =
                      await Api.uploadImageToFirebase(file, 'Notices');
                  DocumentReference dr = FirebaseFirestore.instance
                      .collection('Organizations')
                      .doc('tw2TPyM4WQgbLJ3w4hxAfGnc9JE2')
                      .collection('Notices')
                      .doc();
                  debug.log(uploadedImageURL);
                  await dr.set({
                    "title": _noticeName!.text,
                    "desc": _noticeDesc!.text,
                    "imageLink": uploadedImageURL,
                    "uploadDate": DateTime.now().millisecondsSinceEpoch,
                  }).then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imgFromGallery() async {
    //IF PERSON CANCELS THEN THE PATH WILL BE '' -- KEEP IN MIND
    XFile? image = (await _picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 40,
        )) ??
        XFile('');

    setState(() {
      // _videoPlayerController.dispose();
      // video = File('');
      if (image.path == '') {
        debug.log('Cancelled');
      } else {
        setState(() {
          file = File(image.path);
        });
      }
    });
  }
}
