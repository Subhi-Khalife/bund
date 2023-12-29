import 'package:flutter/material.dart';

class LoadingBloc extends StatelessWidget {
  const LoadingBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: Colors.indigo,
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
    ));
  }
}
