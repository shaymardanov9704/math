import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math/presentation/utils/text_styles.dart';
import 'package:math/presentation/widgets/custom_button.dart';
import 'package:math/presentation/widgets/number_button.dart';
import 'bloc/quick_math_bloc.dart';

class QuickMathPage extends StatefulWidget {
  const QuickMathPage({Key? key}) : super(key: key);

  @override
  State<QuickMathPage> createState() => _QuickMathPageState();
}

class _QuickMathPageState extends State<QuickMathPage> {
  final bloc = QuickMathBloc();
  List<String> numberPad = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(QuickMathEvent.init());
    super.initState();
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
                      child: Text("${state.timer}"),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${state.numberA} + ${state.numberB} = ",
                            style: AppTextStyles.style600,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                "${state.result}",
                                style: AppTextStyles.style600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            child: "Hint",
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            child: "Enter",
                            onTap: () {
                              bloc.add(QuickMathEvent.enter());
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 2.5,
                      child: Center(
                        child: GridView.builder(
                          itemCount: numberPad.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            return NumberButton(
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
