import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/root_page.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirmation'),
              content:
                  const Text('Are you sure you want to delete your account?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                BlocProvider<MyAccountCubit>(
                  create: (context) => getIt(),
                  child: BlocBuilder<MyAccountCubit, MyAccountState>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () async {
                          context.read<MyAccountCubit>().deleteAccount();

                          final state = context.read<MyAccountCubit>().state;
                          if (state.user != null) {
                            try {
                              state.user?.delete();
                              bool success = true;
                              if (success) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RootPage()),
                                );
                              }
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: Text(
                                        'An error occurred while deleting the account: $e'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: const Text('Delete'),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 194, 68, 59),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_sharp,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Delete account',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
