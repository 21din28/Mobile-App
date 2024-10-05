import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/fonts.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/constants/text_strings.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _studentIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    String studentId = _studentIdController.text;
    String password = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Bọc trong SingleChildScrollView
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSizes.sm * 0.5),
          TextField(
            controller: _studentIdController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppText.sign_In_msv,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 2),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppText.sign_In_pass,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.main,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            ),
            onPressed: _signIn,
            child: const Text(
              AppText.sign_In,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: AppFonts.fontSizeMd,
                color: AppColors.bg,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.sm * 3),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/forgot');
            },
            child: const Text(
              AppText.sign_In_forgot,
              style: TextStyle(fontFamily: "Montserrat", color: AppColors.main),
            ),
          ),
        ],
      ),
    );
  }
}
