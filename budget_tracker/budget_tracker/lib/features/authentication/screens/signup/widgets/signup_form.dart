import 'package:budget_tracker/features/authentication/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controller/login_controller.dart';
import '../verify.dart';

class AppSignUpForm extends StatefulWidget {
  const AppSignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  State<AppSignUpForm> createState() => _AppSignUpFormState();
}

class _AppSignUpFormState extends State<AppSignUpForm> {
  RegisterController registerController = Get.put(RegisterController());

  bool _isChecked = false;
  bool _isVisible = false;

  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: registerController.nameController,
            expands: false,
            decoration: const InputDecoration(
              labelText: AppTexts.name,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            controller: registerController.eOrPController,
            expands: false,
            decoration: const InputDecoration(
              labelText: AppTexts.eOrp,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            controller: registerController.passwordController,
            obscureText: !_isVisible,
            expands: false,
            decoration: InputDecoration(
              labelText: AppTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: Icon(
                  _isVisible ? Iconsax.eye : Iconsax.eye_slash,
                ),
                onPressed: _toggleVisibility,
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          /// Terms & Conditions Checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _isChecked,
                  onChanged: _handleCheckboxChange,
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItems,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${AppTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '${AppTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: widget.dark
                                  ? AppColors.white
                                  : AppColors.black,
                              decoration: TextDecoration.underline,
                              decorationColor: widget.dark
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                      ),
                      TextSpan(
                        text: '${AppTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: AppTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: widget.dark
                                  ? AppColors.white
                                  : AppColors.black,
                              decoration: TextDecoration.underline,
                              decorationColor: widget.dark
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),

          /// Sign up
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => registerController.register(),
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}