import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety/provider/auth_provider.dart';
import 'package:women_safety/screen/auth/widget/header_widget.dart';
import 'package:women_safety/util/size.util.dart';
import 'package:women_safety/util/theme/app_colors.dart';
import 'package:women_safety/util/theme/text.styles.dart';
import 'package:women_safety/widgets/custom_button.dart';
import 'package:women_safety/widgets/custom_text.dart';
import 'package:women_safety/widgets/custom_text_field.dart';
import 'package:women_safety/widgets/snackbar_message.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Stack(
          children: [
            SizedBox(width: getAppSizeWidth(), height: getAppSizeHeight()),
            const HeaderWidget(title: 'Create Account', subTitle: 'Fill the below form to create a new account.', isShowBackButton: true),
            Container(
              margin: const EdgeInsets.only(top: 70),
              height: getAppSizeHeight(),
              width: getAppSizeWidth(),
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) => ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: getAppSizeHeight() * 0.18),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(color: colorShadow2, blurRadius: 10.0, spreadRadius: 3.0, offset: Offset(0.0, 0.0))],
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 3),
                              const Expanded(child: CustomText(title: 'Select Role', color: Colors.black, fontSize: 16)),
                              DropdownButton<String>(
                                value: authProvider.selectUserRoll,
                                items: authProvider.userRollLists
                                    .map((label) =>
                                        DropdownMenuItem(value: label, child: CustomText(title: label, color: Colors.black, fontSize: 17)))
                                    .toList(),
                                underline: const SizedBox.shrink(),
                                onChanged: (value) {
                                  authProvider.changeUserRoll(value!);
                                },
                              ),
                            ],
                          ),
                          CustomTextField(
                            hintText: 'Name *',
                            prefixIconUrl: Icons.share_location_outlined,
                            inputType: TextInputType.name,
                            isShowPrefixIcon: true,
                            verticalSize: 13,
                            focusNode: nameFocus,
                            nextFocus: phoneFocus,
                            controller: nameController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: 'Phone Number *',
                            prefixIconUrl: Icons.account_circle,
                            inputType: TextInputType.phone,
                            isShowPrefixIcon: true,
                            verticalSize: 13,
                            focusNode: phoneFocus,
                            nextFocus: addressFocus,
                            controller: phoneController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: 'address *',
                            prefixIconUrl: Icons.account_circle,
                            inputType: TextInputType.streetAddress,
                            isShowPrefixIcon: true,
                            verticalSize: 13,
                            focusNode: addressFocus,
                            nextFocus: passwordFocus,
                            controller: addressController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: 'Enter your password *',
                            prefixIconUrl: Icons.lock,
                            inputType: TextInputType.text,
                            isShowPrefixIcon: true,
                            verticalSize: 13,
                            controller: passwordController,
                            focusNode: passwordFocus,
                            inputAction: TextInputAction.done,
                            isShowSuffixIcon: true,
                            isPassword: true,
                          ),
                          const SizedBox(height: 20),
                          authProvider.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  btnTxt: 'Register',
                                  onTap: () {
                                    if (nameController.text.isEmpty ||
                                        phoneController.text.isEmpty ||
                                        addressController.text.isEmpty ||
                                        passwordController.text.isEmpty) {
                                      showMessage( message: 'Please fill upp all the fields');
                                    } else {

                                    }
                                  }),
                          const SizedBox(height: 20),
                          CustomText(title: 'Have an account?', textStyle: sfProStyle300Light.copyWith(color: colorPrimary, fontSize: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  title: 'Please Login ', textStyle: sfProStyle400Regular.copyWith(color: colorPrimary, fontSize: 16)),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const CustomText(
                                      title: 'Click Here', decoration: TextDecoration.underline, color: colorBlueDark, fontSize: 16)),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
