import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  const BasicAppbar({super.key, this.title, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: title ?? const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: hideBack
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  decoration: BoxDecoration(
                      color: context.isDarkMode
                          ? Colors.white.withOpacity(0.03)
                          : Colors.black.withOpacity(0.04),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back,
                    size: 15,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
