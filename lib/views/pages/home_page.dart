import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/home_page_cubit/home_page_cubit.dart';
import 'package:quizzproject/blocs/pages/dashboard/home_page_cubit/home_page_state.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';
import 'package:quizzproject/views/pages/drawer_page.dart';
import 'package:quizzproject/views/pages/quiz_page.dart';
import 'package:quizzproject/views/pages/results_page.dart';
import 'package:quizzproject/views/widgets/app_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageCubit homePageCubit = HomePageCubit();

  @override
  void initState() {
    super.initState();
    homePageCubit.reload();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Home Page',
      drawer: const DrawerPage(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: homePageCubit,
        builder: (context, state) {
          if (state is HomePageLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is HomePageLoadedState) {
            return ListView.builder(
              itemCount: state.tests.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == state.tests.length) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Get to know your ranking result',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const ResultsPage();
                            }));
                          },
                          child: const Text('Check'),
                        ),
                      ],
                    ),
                  );
                }
                TestModel testModel = state.tests[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return QuizPage(
                          id: testModel.id,
                          title: testModel.name,
                        );
                      }));
                    },
                    title: Text(testModel.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          testModel.getHashTags().join(', '),
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const SizedBox(height: 8),
                        Text(testModel.description),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is HomePageErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: Text("Error - unknown state"));
          }
        },
      ),
    );
  }
}
