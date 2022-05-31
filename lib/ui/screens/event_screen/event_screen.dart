import 'dart:io';

import 'package:finsem_org/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:finsem_org/ui/component/curved_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as debug;

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
  bool _takeDontaions = false;
  final ImagePicker _picker = ImagePicker();
  File file = File('');

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
              Row(
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
                              icon: const Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                            ))),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
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
              SizedBox(height: 15.h),
              Row(
                children: [
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
                  SizedBox(width: 40.w),
                  Row(
                    children: [
                      Text(
                        'Accept\nDonations',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 30.w),
                      Checkbox(
                          value: _takeDontaions,
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent),
                          onChanged: (value) {
                            setState(() {
                              _takeDontaions = value!;
                            });
                          }),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: MaterialButton(
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
                  onPressed: () {},
                ),
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
