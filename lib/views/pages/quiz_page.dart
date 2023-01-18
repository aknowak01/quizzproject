import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/quiz_page_cubit/quiz_page_cubit.dart';
import 'package:quizzproject/blocs/pages/dashboard/quiz_page_cubit/quiz_page_state.dart';
import 'package:quizzproject/blocs/widgets/quiz_viewer/quiz_viewer_cubit.dart';
import 'package:quizzproject/views/pages/drawer_page.dart';
import 'package:quizzproject/views/widgets/app_layout.dart';
import 'package:quizzproject/views/widgets/quiz_viewer/quiz_viewer.dart';

class QuizPage extends StatefulWidget {
  final String id;
  final String title;

  const QuizPage({
    required this.id,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizPageCubit _quizPageCubit = QuizPageCubit();
  final QuizViewerCubit _quizViewerCubit = QuizViewerCubit();

  @override
  void initState() {
    super.initState();
    _quizPageCubit.reload(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: widget.title,
      drawer: const DrawerPage(),
      child: BlocBuilder<QuizPageCubit, QuizPageState>(
        bloc: _quizPageCubit,
        builder: (BuildContext context, QuizPageState state) {
          if (state is QuizPageLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is QuizPageLoadedState) {
            return QuizViewer(
              quizViewerCubit: _quizViewerCubit,
              testDetailsModel: state.testDetailsModel,
            );
          } else if (state is QuizPageErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Text('Error - unknown state');
          }
        },
      ),
    );
  }
}
