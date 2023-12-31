import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/player_model.dart';
import '../utils/constants.dart';
import '../viewmodels/game_viewmodel.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = 'GameScreen';
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(isSinglePlayer: arg.isSinglePlayer),
      child: Consumer<GameViewModel>(
        builder: (context, gameViewModel, _) {
          return Scaffold(
            backgroundColor: AppConstants.bgColor,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              arg.playerOne,
                              style: AppConstants.customFontWhite,
                            ),
                            Text(
                              gameViewModel.xScore.toString(),
                              style: AppConstants.customFontWhite,
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              gameViewModel.isSinglePlayer
                                  ? 'AI'
                                  : arg.playerTwo,
                              style: AppConstants.customFontWhite,
                            ),
                            Text(
                              gameViewModel.oScore.toString(),
                              style: AppConstants.customFontWhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              gameViewModel.tapped(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 5,
                                  color: const Color(0xff271767),
                                ),
                                color: gameViewModel.winIndexes.contains(index)
                                    ? AppConstants.boxWinColor
                                    : AppConstants.boxColor,
                              ),
                              child: Center(
                                child: Text(
                                  gameViewModel.bordState[index],
                                  style: AppConstants.customFontWhite.copyWith(fontSize: 64),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gameViewModel.resultDeclaration,
                              style: AppConstants.customFontWhite),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: !gameViewModel.isOn,
                            child: IconButton(
                              onPressed: () {
                                gameViewModel.clearBoard();
                              },
                              icon: const Icon(
                                Icons.restart_alt,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
