import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzproject/blocs/pages/dashboard/home_page_cubit/home_page_cubit.dart';
import 'package:quizzproject/blocs/pages/dashboard/home_page_cubit/home_page_state.dart';
import 'package:quizzproject/shared/models/test/test_model.dart';
import 'package:quizzproject/views/pages/home_page.dart';
import 'package:quizzproject/views/pages/quiz_page.dart';
import 'package:quizzproject/views/pages/results_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final HomePageCubit homePageCubit = HomePageCubit();

  @override
  void initState() {
    super.initState();
    homePageCubit.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ResultsPage();
              }));
            },
            leading: const Icon(Icons.monetization_on),
            title: const Text('Results'),
          ),
          ListTile(
            textColor: Colors.blue,
            iconColor: Colors.blue,
            onTap: () async {
              homePageCubit.random().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizPage(
                    id: value.id,
                    title: value.name,
                  );
                }));
              });
            },
            leading: const Icon(Icons.refresh),
            title: const Text('Open random test'),
          ),
          ListTile(
            textColor: Colors.blue,
            iconColor: Colors.blue,
            onTap: () async {
              homePageCubit.reload();
            },
            leading: const Icon(Icons.refresh),
            title: const Text('Fetch new'),
          ),
          const Divider(),
          BlocBuilder<HomePageCubit, HomePageState>(
            bloc: homePageCubit,
            builder: (context, state) {
              if (state is HomePageLoadingState) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state is HomePageLoadedState) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.tests.length,
                  itemBuilder: (BuildContext context, int index) {
                    TestModel testModel = state.tests[index];
                    return ListTile(
                      leading: const Icon(Icons.work),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return QuizPage(
                            id: testModel.id,
                            title: testModel.name,
                          );
                        }));
                      },
                      title: Text(testModel.name),
                    );
                  },
                );
              } else if (state is HomePageErrorState) {
                return Text(state.message);
              } else {
                return const Center(child: Text("Error - unknown state"));
              }
            },
          ),
        ],
      ),
    );
  }
}
