import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:moneyp/feature/home/controller/auth_controller.dart';
import 'package:moneyp/feature/home/controller/monzo_transaction.dart';
import 'package:moneyp/product/constant/color_settings.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final monzo = Provider.of<MonzoController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
            color: ColorSettings.themeColor.shade200,
            iconSize: 34),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top),
          child: Column(children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: context.isKeyBoardOpen ? 0 : 275,
              child: Image(
                width: MediaQuery.of(context).size.width,
                height: 275,
                image: const Svg("assets/images/signUp.svg"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: ColorSettings.themeColor.shade200),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.mail_lock_outlined),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return "Email is not valid";
                        } else {
                          return null;
                        }
                      },
                      style: GoogleFonts.poppins(fontSize: 16),
                      controller: _emailController,
                      decoration: const InputDecoration(hintText: "Email"),
                    ))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.lock_clock_outlined),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please enter a minimum of 6 characters.';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: GoogleFonts.poppins(fontSize: 16),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                    ))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.lock_clock_outlined),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please enter a minimum of 6 characters.';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: GoogleFonts.poppins(fontSize: 16),
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: "Confirm Password"),
                    ))
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Icon(Icons.person_outline_outlined),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: GoogleFonts.poppins(fontSize: 16),
                      controller: _nameController,
                      decoration: const InputDecoration(hintText: "Full name"),
                    ))
                  ],
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text != "" &&
                        _passwordController.text != "" &&
                        _nameController.text != "") {
                      controller.signUp(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                          monzo);
                    } else {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text:
                              'Please make sure that you fill out all your information completely.');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: ColorSettings.themeColor.shade200,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                  child: Text("Sign Up",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
