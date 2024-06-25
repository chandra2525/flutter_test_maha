import 'package:flutter/material.dart';

import '../constants/color.dart';

class EmptyListStateWidget extends StatelessWidget {
  const EmptyListStateWidget({
    String? text,
    super.key,
  }) : _text = text ?? '';

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: gray600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
