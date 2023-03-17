import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/view_model/transaction_screen_viewmodel.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late TransactionViewModal transactionViewModal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      transactionViewModal.GetHistoryByPhone(
          await SecureStore.getPhone(), context);
      transactionViewModal.historyList;
    });
  }

  @override
  Widget build(BuildContext context) {
    transactionViewModal = Provider.of<TransactionViewModal>(context);
    List amount = transactionViewModal.historyList
        .map(
          (e) => e.amount,
        )
        .toList();
    List paymentId = transactionViewModal.historyList
        .map(
          (e) => e.paymentId,
        )
        .toList();
    List date = transactionViewModal.historyList
        .map(
          (e) => DateTime.tryParse(e.createdAt.toString()),
        )
        .toList();

    List status = transactionViewModal.historyList
        .map(
          (e) => e.status,
        )
        .toList();

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarWidget(text: "Payment History"),
      // CustomAppbarWidget(
      //   leadingIcon: SvgPicture.asset(
      //     "images/Group.svg",
      //     height: 20,
      //     width: 20,
      //   ),
      //   centerTitle: Text(
      //     "Payment History",
      //     style: TextStyle(color: ThemeConstents.appBodyBlack),
      //   ),
      // ),
      body: transactionViewModal.loading
          ? const Center(child: CupertinoActivityIndicator())
          : transactionViewModal.TextLoading
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'images/99955-empty-notifications.json',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                          repeat: true,
                          alignment: Alignment.center,
                        ),
                        const Text("No Transactions Yet")
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: transactionViewModal.historyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 2),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          elevation: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 130,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: status[index] == "Success"
                                              ? ThemeConstents.appPrimeryColor
                                              : Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Icon(
                                        status[index] == "Success"
                                            ? Icons.arrow_circle_up_rounded
                                            : Icons.arrow_circle_down_sharp,
                                        color: ThemeConstents.appBodyColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Payment ID:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              transactionViewModal
                                                  .historyList[index].paymentId
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Status:",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  transactionViewModal
                                                      .historyList[index].status
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: status[index] ==
                                                              "Success"
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "Amount:",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    transactionViewModal
                                                        .historyList[index]
                                                        .amount
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: status[index] ==
                                                                "Success"
                                                            ? Colors.green
                                                            : Colors.red,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ]),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Payment Type:",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              transactionViewModal
                                                  .historyList[index]
                                                  .paymentType
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Date:",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy E').format(
                                                date[index],
                                              ),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     IconButton(
                                        //       icon: Icon(Icons.print),
                                        //       onPressed: () {},
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

      //  Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(10),
      //       child: Container(
      //         padding: const EdgeInsets.all(20),
      //         width: 358.w,
      //         height: 113.h,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             color: Colors.grey.shade200),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceAround,
      //           children: const [
      //             Icon(
      //               Icons.done,
      //               size: 18,
      //               color: Colors.green,
      //             ),
      //             Text(
      //               "Test Message",
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //             ),
      //             Text(
      //               "1500",
      //               style: TextStyle(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w500,
      //                   color: Colors.green),
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
