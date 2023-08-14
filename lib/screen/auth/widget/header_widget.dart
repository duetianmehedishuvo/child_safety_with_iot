import 'package:flutter/material.dart';
import 'package:women_safety/util/size.util.dart';
import 'package:women_safety/util/theme/app_colors.dart';
import 'package:women_safety/util/theme/text.styles.dart';
import 'package:women_safety/widgets/custom_button.dart';
import 'package:women_safety/widgets/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {this.title = 'Login', this.isShowBackButton = false, this.subTitle = 'Welcome back, please login to your account.', Key? key})
      : super(key: key);
  final String title;
  final String subTitle;
  final bool isShowBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getAppSizeHeight() * 0.4,
      width: getAppSizeWidth(),
      decoration: const BoxDecoration(
          color: colorPrimary, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: isShowBackButton ? 40 : 50),
          isShowBackButton
              ? Container(
                  width: getAppSizeWidth(),
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(backIcon(context), color: Colors.white), const CustomText(title: 'Back')],
                    ),
                  ))
              : const SizedBox.shrink(),
          SizedBox(height: isShowBackButton ? 10 : 0),
          Container(
              width: getAppSizeWidth() * 0.6,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              height: 84,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Text('Child Safety and security systems',
                  style: sfProStyle500Medium.copyWith(color: colorPrimary, fontSize: 13), textAlign: TextAlign.center)),
          const SizedBox(height: 8),
          Center(child: CustomText(title: title, textStyle: sfProStyle600SemiBold.copyWith(color: Colors.white, fontSize: 18))),
          const SizedBox(height: 5),
          Center(
            child: CustomText(
              title: subTitle,
              textStyle: sfProStyle300Light.copyWith(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
