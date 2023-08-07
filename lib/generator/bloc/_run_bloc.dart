import 'bloc_helper.dart';

void main() async {
  await helper.generate();
}

const helper = BlocHelper(name: "game", page: true);
