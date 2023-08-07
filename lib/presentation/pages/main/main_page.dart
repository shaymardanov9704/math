import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/utils/text_styles.dart';
import '../quick_math/quick_math_page.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bloc = MainBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "MATH",
                    style: AppTextStyles.style700.copyWith(fontSize: 25),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const QuickMathPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Quick Math",
                      style: AppTextStyles.style600,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
