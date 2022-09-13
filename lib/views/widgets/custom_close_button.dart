import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final void Function() onTap;

  const CustomCloseButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: ViewConfigColors.primary700,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: ViewConfigShadows.dp01,
          ),
          height: 40,
          width: 40,
          child: const Center(
            child: Icon(
              Icons.close_rounded,
              color: Color(0xffffffff),
              size: 32,
            ),
          ),
        ),
      ),
      // elevation: 1,
    );
  }
}
