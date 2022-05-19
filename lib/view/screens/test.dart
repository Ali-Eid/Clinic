import 'package:buildcondition/buildcondition.dart';
import 'package:clinic/logic/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: BuildCondition(
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
            condition: HomeCubit.get(context).myphoto != null,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      HomeCubit.get(context).getmyprofileImage();
                      print(HomeCubit.get(context).myphoto?.data);
                    },
                    icon: const Icon(
                      Icons.get_app,
                    ),
                  ),
                  Text(HomeCubit.get(context).sss),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
