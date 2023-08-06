import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyp/feature/chat-gpt-api/chat_gpt_api.dart';
import 'package:moneyp/feature/home/controller/auth_controller.dart';
import 'package:moneyp/feature/home/controller/home_controller.dart';
import 'package:moneyp/feature/wallet_onboard/controller/wallet_controller.dart';
import 'package:moneyp/product/constant/color_settings.dart';
import 'package:provider/provider.dart';

import 'hanndle_response_chat_gpt.dart';

class ChatGPTUI extends StatefulWidget {
  const ChatGPTUI({super.key});

  @override
  State<ChatGPTUI> createState() => _ChatGPTUIState();
}

class _ChatGPTUIState extends State<ChatGPTUI> {
  WalletController walletController = Get.find();
  HomeController homeController = Get.find();
  AuthController authController = Get.find();
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  void dispose() {
    for (TextEditingController c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  late int enabledWalletAmount2;

  enabledWalletAmount() {
    enabledWalletAmount2 = homeController.wallets.length;
  }

  @override
  void initState() {
    enabledWalletAmount();
    super.initState();
  }

  int value = 0;
  @override
  Widget build(BuildContext context) {
    final gptController = Provider.of<ChatGPTController>(context);
    return walletController.obx(
        onLoading: Scaffold(
          body: Center(
              child: Lottie.asset('assets/loading.json',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5)),
        ), (state) {
      return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(246, 211, 226, 247),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/logosp.png"),
                              fit: BoxFit.cover)),
                    ),
                    // Lottie.asset('assets/onboard_wallet.json',
                    //     alignment: Alignment.topCenter,
                    //     width: MediaQuery.of(context).size.width,
                    //     height: MediaQuery.of(context).size.height * 0.30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ChatGPT APIs",
                              style: GoogleFonts.poppins(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: ColorSettings.themeColor.shade200),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'There are few chatGPT apis that help you to predict your future plan and management guides',
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   margin: const EdgeInsets.only(top: 13),
                          //   width: MediaQuery.of(context).size.width * 0.8,
                          //   height: MediaQuery.of(context).size.height * 0.09,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(16),
                          //     color: Colors.white,
                          //   ),
                          //   child: Text(
                          //     "Conversational Interface",
                          //     style: GoogleFonts.poppins(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w700,
                          //         color: ColorSettings.themeColor.shade200),
                          //   ),
                          // ),
                          // Container(
                          //   alignment: Alignment.center,
                          //   margin: const EdgeInsets.only(top: 13),
                          //   width: MediaQuery.of(context).size.width * 0.8,
                          //   height: MediaQuery.of(context).size.height * 0.09,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(16),
                          //     color: Colors.white,
                          //   ),
                          //   child: Text(
                          //     "Expense Input and Extraction",
                          //     style: GoogleFonts.poppins(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w700,
                          //         color: ColorSettings.themeColor.shade200),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              gptController
                                  .futurePersonalGuide(
                                      check: true,
                                      userTransactionList:
                                          "[{'food':'120£'},{'travel':'200£'},{'shhopping':'120£'},{'other':'120£'}], my total income of this month is 500£",
                                      userQuery:
                                          "Expance analytics and insights")
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HnadlingResponseChatGPT(
                                              textResponse:
                                                  "${value.choices![0].message!.content}",
                                            )));
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 13),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: gptController.loading
                                  ? Center(
                                      child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Loading...",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: ColorSettings
                                                    .themeColor.shade200),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: ColorSettings
                                                  .themeColor.shade200,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  : Text(
                                      "Expense Insights and Analytics",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: ColorSettings
                                              .themeColor.shade200),
                                    ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              gptController
                                  .futurePersonalGuide(
                                      check: false,
                                      userTransactionList:
                                          "[{'food':'120£'},{'travel':'200£'},{'shhopping':'120£'},{'other':'120£'}], my total income of this month is 500£",
                                      userQuery:
                                          "future recommendation and personal guidance ")
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HnadlingResponseChatGPT(
                                              textResponse:
                                                  "${value.choices![0].message!.content}",
                                            )));
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 13),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: gptController.loading1
                                  ? Center(
                                      child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Loading...",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: ColorSettings
                                                    .themeColor.shade200),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: ColorSettings
                                                  .themeColor.shade200,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  : Text(
                                      "Personalized Recommendations",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: ColorSettings
                                              .themeColor.shade200),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Center(
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       if (enabledWalletAmount2 != 0) {
                    //         homeController.currentWalletIndex.value = 0;
                    //         homeController.currentWalletLastIndex.value = 0;

                    //         // ignore: invalid_use_of_protected_member
                    //         walletController.change(null,
                    //             status: RxStatus.loading());

                    //         walletController.selectedUpdateWallets.clear();

                    //         walletController
                    //             .updateWalletsTextField(_controllers);

                    //         await walletController.walletUpdate(
                    //             authController.firebaseUser.value!.uid,
                    //             walletController.selectedUpdateWallets);
                    //         homeController.listBindStream();

                    //         // ignore: invalid_use_of_protected_member
                    //         walletController.change(null,
                    //             status: RxStatus.success());

                    //         Get.back();
                    //       } else {
                    //         QuickAlert.show(
                    //             context: context,
                    //             type: QuickAlertType.warning,
                    //             text:
                    //                 'Please enable at least 1 wallet in your account.');
                    //       }
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: ColorSettings.themeColor.shade200,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         minimumSize: Size(
                    //             MediaQuery.of(context).size.width * 0.84,
                    //             MediaQuery.of(context).size.height * 0.05)),
                    //     child: Text(
                    //       'Save',
                    //       style:
                    //           GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox()
                  ])));
    });
  }
}
