import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneyp/product/constant/color_settings.dart';
import 'package:kartal/kartal.dart';
import 'package:quickalert/quickalert.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final TextEditingController _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: ColorSettings.themeColor.shade200),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
          color: ColorSettings.themeColor.shade200,
          iconSize: 34,
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
            left: 20,
            right: 20,
            top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: context.isKeyBoardOpen
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: context.isKeyBoardOpen ? 0 : 275,
              child: Image(
                image: const Svg('assets/images/forgot_password.svg'),
                width: MediaQuery.of(context).size.width,
                height: 275,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Forgot Password',
              style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: ColorSettings.themeColor.shade200),
            ),
            Text(
              'Dont worry if you forgot your password! You can easily reset your password by entering your e-mail address in the box below.',
              style: GoogleFonts.poppins(
                  color: const Color(0xff565656), letterSpacing: 1, fontSize: 16),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.mail_lock_outlined),
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
                  controller: _mailController,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: const InputDecoration(hintText: 'Enter email'),
                ))
              ],
            ),
            const SizedBox(),
            ElevatedButton(
              onPressed: () async {
               if(_mailController.text !=""){
                 try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: _mailController.text.trim());
                  // ignore: use_build_context_synchronously
                  QuickAlert.show(
                      onConfirmBtnTap: () {
                        Get.offAllNamed('/login');
                      },
                      context: context,
                      type: QuickAlertType.success,
                      text:
                          "Password reset link has been sent. Please check your e-mail address. (Don't forget to check your spam folder.)");
                } catch (e) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text:
                          'User not found. \n Make sure your information is correct.');
                }
               }else{
                 QuickAlert.show(
                        context: context,
                        type: QuickAlertType.warning,
                        text:
                            'Please make sure that you fill out all your information completely.');
               }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)), backgroundColor: ColorSettings.themeColor.shade200,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              child: Text("Submit",
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
