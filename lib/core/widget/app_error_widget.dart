import 'package:flutter/material.dart';
import 'package:placeholderapp/core/widget/neobrutalism_icon_button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      {super.key, required this.errorText, required this.onRefresh});
  final String errorText;
  final VoidCallback onRefresh;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorText),
          const SizedBox(
            height: 10,
          ),
          NeoBrutalismIconButton(
              icon: const Icon(Icons.refresh), onTap: onRefresh)
        ],
      ),
    );
  }
}
