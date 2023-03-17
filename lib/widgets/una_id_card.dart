import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/repository/usrls.dart';
import 'package:project_una/view_model/account_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class UnaMyIdCard {
  static Future<File> convertImageToFile(
      Uint8List imageBytes, String fileName) async {
    final directory =
        await getApplicationDocumentsDirectory(); // requires `path_provider` package
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(imageBytes);
    log(file.toString());
    return file;
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);

  static showMyCard(
      context, String? name, designation, address, dob, expiry, String? image) {
    final accountViewmodal =
        Provider.of<AccountScreenViewModel>(context, listen: false);
    Image? image;
    WidgetsToImageController controller = WidgetsToImageController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: ThemeConstents.appPrimeryColor),
              borderRadius: BorderRadius.circular(15.r)),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WidgetsToImage(
                  controller: controller,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 22, 63, 230),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage("images/idcardlogo.png"),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    width: 70,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "UNITED NURSES ASSOCIATION",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        "THRISSUR",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        width: 170,
                                        height: 30,
                                        child: const Center(
                                          child: Text(
                                            "IDENTITY CARD",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 22, 63, 230),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              height: 150,





















                              
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/rect.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 14, left: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        height: 75,
                                        width: 75,
                                        child: accountViewmodal.dataList.isEmpty
                                            ? Shimmer.fromColors(
                                                period: const Duration(
                                                    milliseconds: 1500),
                                                baseColor: Colors.grey.shade400,
                                                highlightColor:
                                                    Colors.grey.shade100,
                                                child: Container(
                                                  height: 100,
                                                  width: 75,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            : Image.network(
                                                AppUrls.baseUrl +
                                                    image.toString(),
                                                fit: BoxFit.cover,
                                                height: 75,
                                                width: 75,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 110,
                                    top: 10,
                                    child: Container(
                                      height: 80,
                                      width: 250,
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Name:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              accountViewmodal.dataList.isEmpty
                                                  ? Shimmer.fromColors(
                                                      period: const Duration(
                                                          milliseconds: 1500),
                                                      baseColor:
                                                          Colors.grey.shade400,
                                                      highlightColor:
                                                          Colors.grey.shade100,
                                                      child: Container(
                                                        height: 12,
                                                        width: 150,
                                                        color: Colors.white,
                                                      ))
                                                  : Text(
                                                      name.toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Designation:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              accountViewmodal.dataList.isEmpty
                                                  ? Shimmer.fromColors(
                                                      period: const Duration(
                                                          milliseconds: 1500),
                                                      baseColor:
                                                          Colors.grey.shade400,
                                                      highlightColor:
                                                          Colors.grey.shade100,
                                                      child: Container(
                                                        height: 12,
                                                        width: 150,
                                                        color: Colors.white,
                                                      ))
                                                  : Text(
                                                      designation.toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Address:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              accountViewmodal.dataList.isEmpty
                                                  ? Shimmer.fromColors(
                                                      period: const Duration(
                                                          milliseconds: 1500),
                                                      baseColor:
                                                          Colors.grey.shade400,
                                                      highlightColor:
                                                          Colors.grey.shade100,
                                                      child: Container(
                                                        height: 12,
                                                        width: 150,
                                                        color: Colors.white,
                                                      ))
                                                  : Text(
                                                      address.toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "D.O.B:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              accountViewmodal.dataList.isEmpty
                                                  ? Shimmer.fromColors(
                                                      period: const Duration(
                                                          milliseconds: 1500),
                                                      baseColor:
                                                          Colors.grey.shade400,
                                                      highlightColor:
                                                          Colors.grey.shade100,
                                                      child: Container(
                                                        height: 12,
                                                        width: 150,
                                                        color: Colors.white,
                                                      ))
                                                  : Text(
                                                      dob.toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 9, bottom: 8),
                                      child: Row(
                                        children: [
                                          const Text(
                                            "Valid Upto:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromARGB(
                                                  255, 22, 63, 230),
                                            ),
                                          ),
                                          accountViewmodal.dataList.isEmpty
                                              ? Shimmer.fromColors(
                                                  period: const Duration(
                                                      milliseconds: 1500),
                                                  baseColor:
                                                      Colors.grey.shade400,
                                                  highlightColor:
                                                      Colors.grey.shade100,
                                                  child: Container(
                                                    height: 12,
                                                    width: 150,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : Text(
                                                  expiry.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 22, 63, 230),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: const Color.fromARGB(255, 22, 63, 230),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "“Together we are Strong”",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue),
                  width: 100,
                  height: 60,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      Uint8List? bytes = await controller.capture();

                      convertImageToFile(bytes!, "card.png");
                    },
                    icon: const Icon(Icons.camera),
                  ),
                ),
              ],
            ),
          ),
          titlePadding: const EdgeInsets.all(20),
          backgroundColor: Colors.white.withOpacity(0.1),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: const [],
        );
      },
    );
  }
}
