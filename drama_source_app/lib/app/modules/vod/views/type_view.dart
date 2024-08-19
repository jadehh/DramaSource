/*
 * @File     : type_view.dart
 * @Author   : jade
 * @Date     : 2024/08/09 01:44:08
 * @Email    : jadehh@1ive.com
 * @Software : Samples
 * @Desc     : 类型
 */


import 'package:flutter/material.dart';

class TypeView extends StatelessWidget {
  final int index;
  final String title;
  final TabController tabController;
  const TypeView({required this.title,required this.index,required this.tabController,super.key});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          tabController.index = index;
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
  }
}



