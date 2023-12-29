import 'package:bund/features/fixed_income/presentation/widgets/title_with_description.dart';
import 'package:flutter/material.dart';

class AvarageRatingWithBonds extends StatelessWidget {
  const AvarageRatingWithBonds({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(child: TitleWithDescription(description: "AA", title: "Average Rating")),
          Expanded(
            child: TitleWithDescription(
              description: "20 Companies",
              title: "Bonds",
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          )
        ],
      ),
    );
  }
}
