import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class DragAndDropOrAddPhotoWidget extends StatefulWidget {
  DragAndDropOrAddPhotoWidget({
    super.key,
    required this.image,
    required this.showimagegallery,
    required this.showimagecamera,
    required this.removeprofile,
  });

  File? image;
  VoidCallback? showimagegallery;
  VoidCallback? showimagecamera;
  VoidCallback? removeprofile;

  @override
  State<DragAndDropOrAddPhotoWidget> createState() =>
      _DragAndDropOrAddPhotoWidgetState();
}

class _DragAndDropOrAddPhotoWidgetState
    extends State<DragAndDropOrAddPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.h),
      child: DottedBorder(
        color: Colors.black.withOpacity(.2),
        strokeWidth: 1,
        dashPattern: const [
          5,
          5,
        ],
        child: SizedBox(
          height: 71.h,
          child: widget.image != null
              ? Stack(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await showimageSource(context);
                        },
                        child: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.removeprofile!();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.highlight_remove_outlined,
                              color: ThemeConstents.appBodyBlack, size: 30.sp),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showmydialogue();
                      },
                      child: SizedBox(
                        height: 150.h,
                        width: 60.w,
                        child: Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.cloud_upload),
                      InkWell(
                        onTap: () async {
                          await showimageSource(context);
                        },
                        child: Text(
                          "Click to select.",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> showmydialogue() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          icon: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.highlight_remove_outlined,
                color: ThemeConstents.appBodyBlack,
              ),
            ),
          ),
          content: Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 150.h,
              width: 100.h,
              child: Image.file(
                widget.image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }

  Future showimageSource(BuildContext context) async {
    if (Platform.isAndroid) {
      return showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: 130,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  widget.showimagegallery!();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("camera"),
                onTap: () {
                  widget.showimagecamera!();
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
