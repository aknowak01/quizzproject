import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/widgets/quiz_viewer/quiz_viewer_cubit.dart';
import 'package:quizzproject/blocs/widgets/quiz_viewer/quiz_viewer_state.dart';
import 'package:quizzproject/shared/models/test/test_answer_model.dart';
import 'package:quizzproject/shared/models/test/test_details_model.dart';
import 'package:quizzproject/shared/models/test/test_task_model.dart';
import 'package:quizzproject/views/widgets/quiz_viewer/timer_widget.dart';

class QuizViewer extends StatefulWidget {
  final TestDetailsModel testDetailsModel;
  final QuizViewerCubit quizViewerCubit;

  const QuizViewer({
    required this.quizViewerCubit,
    required this.testDetailsModel,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizViewerState();
}

class _QuizViewerState extends State<QuizViewer> {
  final ValueNotifier<int> timerNotifier = ValueNotifier<int>(100);

  @override
  void initState() {
    super.initState();
    widget.quizViewerCubit.loadQuiz(widget.testDetailsModel);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<QuizViewerCubit, QuizViewerState>(
        bloc: widget.quizViewerCubit,
        builder: (BuildContext context, QuizViewerState state) {
          if (state is QuizViewerLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is QuizViewerSuccessState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your score: ${state.score}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            );
          } else if (state is QuizViewerLoadedState) {
            TestTaskModel currentQuestion = state.currentQuestion;
            return Column(
              children: [
                Row(
                  children: [
                    Text('Question ${state.currentQuestionIndex} of ${state.totalQuestions}'),
                    const Spacer(),
                    TimerWidget(
                      key: Key(state.currentQuestion.question),
                      timerNotifier: timerNotifier,
                      duration: state.currentQuestion.duration,
                      onTimeEnd: () {
                        widget.quizViewerCubit.nextQuestion();
                      },
                      builder: (int remainingTime) {
                        return Text('Time $remainingTime');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<int>(
                  valueListenable: timerNotifier,
                  builder: (BuildContext context, int value, Widget? child) {
                    double percentage = value / state.currentQuestion.duration;
                    return LinearProgressIndicator(
                      color: _selectTimerColor(percentage),
                      value: percentage,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.testDetailsModel.description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                      ),
                      itemCount: currentQuestion.answers.length,
                      itemBuilder: (BuildContext context, int index) {
                        TestAnswerModel answerModel = currentQuestion.answers[index];
                        return InkWell(
                          onTap: () => widget.quizViewerCubit.verifyQuestion(answerModel),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: CupertinoColors.systemGrey),
                            ),
                            child: Center(
                              child: Text(
                                answerModel.content,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text('Error - unknown state');
          }
        },
      ),
    );
  }

  Color _selectTimerColor(double percentage) {
    if (percentage > 0.5) {
      return CupertinoColors.systemGreen;
    } else if (percentage > 0.25) {
      return CupertinoColors.systemYellow;
    } else {
      return CupertinoColors.systemRed;
    }
  }
}
