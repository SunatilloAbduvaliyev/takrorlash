import 'package:flutter/material.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppbar({
    super.key,
    required this.title,
    this.color = Colors.white,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon:  Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: color,
        ),
      ),
      title: Text(
        title,
        style:  TextStyle(
          color: color,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
