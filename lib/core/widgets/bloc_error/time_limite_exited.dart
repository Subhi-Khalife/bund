import 'package:flutter/material.dart';

class TimeLimitExited extends StatelessWidget {
  final Function clickActionFunction;
  const TimeLimitExited({Key? key, required this.clickActionFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickActionFunction(),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "sorry there was an error please click to refresh",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
