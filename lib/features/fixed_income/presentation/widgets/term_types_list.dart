import 'package:bund/features/fixed_income/data/model/term/term.dart';
import 'package:bund/features/fixed_income/presentation/blocs/fixed_income/fixed_income_bloc.dart';
import 'package:bund/features/fixed_income/presentation/widgets/term_types_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsTypesList extends StatelessWidget {
  const TermsTypesList({super.key});

  @override
  Widget build(BuildContext context) {
    FixedIncomeBloc fixedIncomeBloc = BlocProvider.of<FixedIncomeBloc>(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              TermModel term =
                  fixedIncomeBloc.state.fixedIncomeModel?.termTypes![index] ?? TermModel();
              return TermTypesListItem(termModel: term);
            },
            itemCount: fixedIncomeBloc.state.fixedIncomeModel?.termTypes?.length ?? 0),
      ),
    );
  }
}
