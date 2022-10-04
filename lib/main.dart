import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktest/cubit/home_cubit/home_cubit.dart';
import 'package:worktest/pages/home_page.dart';
void main() {
  runApp(const WorkTest());
}

class WorkTest extends StatelessWidget {
  const WorkTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Changa",
          textTheme:  const TextTheme(
          )
        ),
        home:   Directionality(textDirection: TextDirection.rtl,
        child: HomePage()),
      ),
    );
  }
}
