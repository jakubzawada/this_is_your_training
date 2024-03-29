import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:this_is_your_training/app/features/home/home_page.dart';
import 'package:this_is_your_training/app/features/login/login_page.dart';
import 'package:this_is_your_training/app/injection_container.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootCubit>(
      create: (context) => getIt()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          } else {
            return HomePage(user: user);
          }
        },
      ),
    );
  }
}

class RootPage2 extends StatelessWidget {
  const RootPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootCubit>(
      create: (context) => getIt()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          } else {
            return HomePage(user: user);
          }
        },
      ),
    );
  }
}
