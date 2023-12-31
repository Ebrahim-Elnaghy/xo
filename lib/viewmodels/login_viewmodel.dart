import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/player_model.dart';
import '../views/game_screen.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController playerOne = TextEditingController();
  bool switchValue = false;
  final TextEditingController playerTwo = TextEditingController();

  void onSwitchValueChanged(bool value) {
    switchValue = value;
    notifyListeners();
  }

  void navigateToGameScreen(BuildContext context) {
    PlayerModel playerModel = PlayerModel(playerOne.text, switchValue, playerTwo.text);
    Navigator.pushReplacementNamed(context, GameScreen.routeName, arguments: playerModel);
  }
}
