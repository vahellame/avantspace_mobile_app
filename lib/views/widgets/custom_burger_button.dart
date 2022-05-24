import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:flutter/material.dart';

class CustomBurgerButton extends StatelessWidget {
  final void Function() onTap;

  const CustomBurgerButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          child: const Center(
            child: Icon(
              Icons.menu_rounded,
              color: ViewConfigColors.primary700,
              size: 32,
            ),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          height: 56,
          width: 56,
        ),
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      color: Colors.white,
    );
  }
}
