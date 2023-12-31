import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, _) {
          return Scaffold(
            backgroundColor: AppConstants.bgColor,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: loginViewModel.playerOne,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            labelText: 'Name For Player (X)',
                            labelStyle: AppConstants.customFontWhite
                                .copyWith(fontSize: 14)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Single Player',
                            style: AppConstants.customFontWhite
                                .copyWith(fontSize: 14),
                          ),
                          CupertinoSwitch(
                            value: loginViewModel.switchValue,
                            onChanged: (value) {
                              loginViewModel.onSwitchValueChanged(value);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: !loginViewModel.switchValue,
                        child: TextField(
                          controller: loginViewModel.playerTwo,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                )),
                            labelText: 'Name For Player (O)',
                            labelStyle: AppConstants.customFontWhite
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8)),
                        onPressed: () {
                          loginViewModel.navigateToGameScreen(context);
                        },
                        child: Text(
                          'Let\'s Go',
                          style: AppConstants.customFontWhite
                              .copyWith(color: AppConstants.bgColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
