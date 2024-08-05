import 'package:flutter/material.dart';
import 'package:placeholderapp/core/widget/neobrutalism_icon_button.dart';

class NeoBackButton extends StatelessWidget {
  const NeoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NeoBrutalismIconButton(
      icon: const Icon(Icons.chevron_left),
      onTap: () {
        Navigator.maybePop(context);
      },
    );
  }
}
