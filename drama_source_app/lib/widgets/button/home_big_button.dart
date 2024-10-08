import 'package:drama_source_app/app/app_style.dart';
import 'package:drama_source_app/widgets/highlight_widget.dart';
import 'package:drama_source_core/drama_source_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeBigButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final AppFocusNode focusNode;
  final Function()? onTap;
  final bool autofocus;
  const HomeBigButton({
    required this.iconData,
    required this.text,
    this.onTap,
    required this.focusNode,
    this.autofocus = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => HighlightWidget(
        onTap: onTap,
        autofocus: autofocus,
        focusNode: focusNode,
        borderRadius: AppStyle.radius12,
        color: Colors.white10,
        child: Container(
          padding: AppStyle.edgeInsetsA24.copyWith(left: 48.w, right: 48.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: AppStyle.edgeInsetsA12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  size: 64.w,
                  color:
                      focusNode.isFoucsed.value ? Colors.black : Colors.white,
                ),
              ),
              AppStyle.vGap24,
              Text(
                text,
                style: TextStyle(
                  fontSize: 36.w,
                  color:
                      focusNode.isFoucsed.value ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
