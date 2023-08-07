import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyp/feature/home/controller/auth_controller.dart';
import 'package:moneyp/feature/home/controller/home_controller.dart';
import 'package:moneyp/feature/wallet_onboard/controller/wallet_controller.dart';
import 'package:moneyp/product/constant/color_settings.dart';

class BadgesUI extends StatefulWidget {
  const BadgesUI({super.key});

  @override
  State<BadgesUI> createState() => _BadgesUIState();
}

class _BadgesUIState extends State<BadgesUI> {
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
          child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
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
                            "Awarded Badges",
                            style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: ColorSettings.themeColor.shade200),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'The following badges will be awarded based on your stats of income vs expanses',
                          style: GoogleFonts.poppins(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/silver.png",
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                    opacity: const AlwaysStoppedAnimation(.3),
                                  ),
                                ),
                                Text(
                                  "Badge 1",
                                  style: GoogleFonts.poppins(
                                      color: ColorSettings.themeColor.shade200,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            // CircleAvatar(
                            //   radius: 25,
                            //   foregroundColor: Colors.white,
                            //   backgroundColor: Colors.blueGrey.shade100,
                            //   child: Text(
                            //     "1",
                            //     style: GoogleFonts.poppins(
                            //         color: Colors.white,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.w400),
                            //   ),
                            // ),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/bronze.png",
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                    opacity: const AlwaysStoppedAnimation(.3),
                                  ),
                                ),
                                Text(
                                  "Badge 2",
                                  style: GoogleFonts.poppins(
                                      color: ColorSettings.themeColor.shade200,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/gold.png",
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                    opacity: const AlwaysStoppedAnimation(.3),
                                  ),
                                ),
                                Text(
                                  "Badge 3",
                                  style: GoogleFonts.poppins(
                                      color: ColorSettings.themeColor.shade200,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/diamond.png",
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                    opacity: const AlwaysStoppedAnimation(.3),
                                  ),
                                ),
                                Text(
                                  "Badge 4",
                                  style: GoogleFonts.poppins(
                                      color: ColorSettings.themeColor.shade200,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/platinum.png",
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.cover,
                                    opacity: const AlwaysStoppedAnimation(.3),
                                  ),
                                ),
                                Text(
                                  "Badge 5",
                                  style: GoogleFonts.poppins(
                                      color: ColorSettings.themeColor.shade200,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: const SizedBox(
                                  width: 120,
                                  height: 120,
                                )),
                          ],
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
                ])),
          ));
    });
  }
}
