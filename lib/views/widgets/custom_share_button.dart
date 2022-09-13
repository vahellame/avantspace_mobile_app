import 'package:avantspace_mobile_app/views/view_config.dart';
import 'package:flutter/material.dart';

class CustomShareButton extends StatelessWidget {
  final void Function() onTap;

  const CustomShareButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      color: ViewConfigColors.primary700,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: ViewConfigShadows.dp01,
          ),
          height: 32,
          width: 32,
          child: const Center(
            child: Icon(
              Icons.share_rounded,
              color: Color(0xffffffff),
              size: 24,
            ),
          ),
        ),
      ),
      // elevation: 1,
    );
  }
}
