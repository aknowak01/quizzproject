import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quizzproject/blocs/pages/dashboard/results_page_cubit/results_page_cubit.dart';
import 'package:quizzproject/blocs/pages/dashboard/results_page_cubit/results_page_state.dart';
import 'package:quizzproject/shared/models/quiz/quiz_result_model.dart';
import 'package:quizzproject/views/pages/drawer_page.dart';
import 'package:quizzproject/views/widgets/app_layout.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final ResultsPageCubit resultsPageCubit = ResultsPageCubit();

  @override
  void initState() {
    super.initState();
    resultsPageCubit.reload();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Results Page',
      drawer: const DrawerPage(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ResultsPageCubit, ResultsPageState>(
          bloc: resultsPageCubit,
          builder: (context, state) {
            if (state is ResultsPageLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is ResultsPageLoadedState) {
              return Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Expanded(child: Text('Nick')),
                        Expanded(child: Text('Point')),
                        Expanded(child: Text('Type')),
                        Expanded(child: Text('Date')),
                      ],
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.quizResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        QuizResultModel quizResultModel = state.quizResults[index];
                        return SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  quizResultModel.nick,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  quizResultModel.score.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  quizResultModel.type,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  DateFormat('dd-M-yyyy').format(quizResultModel.updatedOn ?? quizResultModel.createdOn),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ResultsPageErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(child: Text("Error - unknown state"));
            }
          },
        ),
      ),
    );
  }
}
