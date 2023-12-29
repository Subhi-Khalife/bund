import 'package:flutter/material.dart';

import 'no_item.dart';
import 'time_limite_exited.dart';
import 'unkown_error.dart';

enum BlocErrorState { serverError, timeLimit, userError, validationError, unkownError, noItems }

// ignore: must_be_immutable
class BlocError extends StatelessWidget {
  Function clickActionFunction;
  String? errorTitle;
  BlocErrorState _blocErrorState;
  String? svgImagePath;
  BlocError.noItems(
      {required this.clickActionFunction, Key? key, this.svgImagePath, this.errorTitle})
      : _blocErrorState = BlocErrorState.noItems,
        super(key: key);
  BlocError.userError({required this.clickActionFunction, Key? key})
      : _blocErrorState = BlocErrorState.userError,
        super(key: key);

  BlocError.validationError({required this.clickActionFunction, Key? key})
      : _blocErrorState = BlocErrorState.validationError,
        super(key: key);

  BlocError.unkownError({required this.clickActionFunction, Key? key})
      : _blocErrorState = BlocErrorState.unkownError,
        super(key: key);

  BlocError.serverError({required this.clickActionFunction, Key? key})
      : _blocErrorState = BlocErrorState.serverError,
        super(key: key);

  BlocError.timeLimit({required this.clickActionFunction, Key? key})
      : _blocErrorState = BlocErrorState.timeLimit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_blocErrorState == BlocErrorState.timeLimit) {
      return TimeLimitExited(clickActionFunction: () => clickActionFunction());
    } else if (_blocErrorState == BlocErrorState.unkownError) {
      return UnKownError(clickActionFunction: () => clickActionFunction());
    } else if (_blocErrorState == BlocErrorState.noItems) {
      return NoItem(
          clickActionFunction: () => clickActionFunction(),
          svgImage: svgImagePath,
          errorTitle: errorTitle);
    } else {
      return Container();
    }
  }
}
