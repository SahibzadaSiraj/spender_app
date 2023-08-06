import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneyp/product/constant/color_settings.dart';

// ignore: must_be_immutable
class HnadlingResponseChatGPT extends StatefulWidget {
  String textResponse;
  HnadlingResponseChatGPT({super.key, required this.textResponse});

  @override
  State<HnadlingResponseChatGPT> createState() =>
      _HnadlingResponseChatGPTState();
}

class _HnadlingResponseChatGPTState extends State<HnadlingResponseChatGPT> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
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
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.07,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       image: const DecorationImage(
                    //           image: AssetImage("assets/images/logosp.png"),
                    //           fit: BoxFit.cover)),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "ChatGPT Response",
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
                      widget.textResponse,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: 2,
                        color: ColorSettings.themeColor.shade200,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Are you agree with this response!",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: ColorSettings.themeColor.shade400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            color: Colors.green,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("That's amazing!")));
                              Future.delayed(const Duration(seconds: 1));
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            color: Colors.red,
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Feedback has been sent, thank you!")));
                              Future.delayed(const Duration(seconds: 1));
                              Navigator.pop(context);
                            },
                            child: Text(
                              "No",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
