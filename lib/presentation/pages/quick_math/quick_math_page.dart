import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/utils/text_styles.dart';
import 'package:math/presentation/widgets/my_button.dart';
import 'bloc/quick_math_bloc.dart';

class QuickMathPage extends StatefulWidget {
  const QuickMathPage({Key? key}) : super(key: key);

  @override
  State<QuickMathPage> createState() => _QuickMathPageState();
}

class _QuickMathPageState extends State<QuickMathPage> {
  final bloc = QuickMathBloc();

  List<String> numberPad = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
  ];

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<QuickMathBloc, QuickMathState>(
        builder: (context, state) {
          return SafeArea(
            top: false,

            child: Scaffold(
              appBar: AppBar(title: const Text("QuickMath")),
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'numberA + numberB = ',
                            style: AppTextStyles.style600,
                          ),
                          Container(
                          padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                "userAnswer",
                                style: AppTextStyles.style600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 2.5,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade400,
                      ),
                      child: Center(
                        child: GridView.builder(
                          itemCount: numberPad.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          itemBuilder: (context, index) {
                            return MyButton(
                              child: numberPad[index],
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
