import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const PrimaryButton({
    Key? key,
    required this.text,
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
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            height: 44,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                text,
                style: ViewConfigTextStyles.button(const Color(0xffffffff)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
