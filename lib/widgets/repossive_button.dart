import 'package:flutter/material.dart';
import 'package:slider_app_flutter/misc/colors.dart';

class ResponsiveButtons extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButtons({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('img/button-one.png'),
        ],
      ),
    );
  }
}
