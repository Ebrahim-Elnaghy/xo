import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GameViewModel extends ChangeNotifier {
  bool oTurn = true;

  List<String> bordState = ['', '', '', '', '', '', '', '', ''];

  List<int> winIndexes = [];

  int count = 0;

  int oScore = 0;

  int xScore = 0;

  String resultDeclaration = '';

  bool isOn = true;

  final bool isSinglePlayer;

  GameViewModel({required this.isSinglePlayer});
  void tapped(
    int index,
  ) {
    if (isOn && bordState[index].isEmpty) {
      if (count % 2 == 0) {
        bordState[index] = 'X';
        count++;
        checkWinner();
        // Call makeComputerMove if it's a single-player game and there are available moves
        if (isSinglePlayer && count < 9) {
          makeComputerMove();
        }
      } else {
        bordState[index] = 'O';
        count++;
        checkWinner();
      }
      notifyListeners();
    }
  }

  void makeComputerMove() {
    // Delay the computer move for a more natural
    Future.delayed(const Duration(milliseconds: 500), () {
      // Computer's turn (O's turn)
      List<int> availableMoves = [];
      for (int i = 0; i < 9; i++) {
        if (bordState[i].isEmpty) {
          availableMoves.add(i);
        }
      }

      // Check for a winning move
      for (int move in availableMoves) {
        List<String> tempBoard = List.from(bordState);
        tempBoard[move] = 'O';
        if (checkWin(tempBoard, 'O')) {
          tapped(move);
          return;
        }
      }

      // Check for a blocking move
      for (int move in availableMoves) {
        List<String> tempBoard = List.from(bordState);
        tempBoard[move] = 'X';
        if (checkWin(tempBoard, 'X')) {
          tapped(move);
          return;
        }
      }

      // Make a random move if no winning or blocking move is found
      if (availableMoves.isNotEmpty) {
        int randomIndex =
            availableMoves[Random().nextInt(availableMoves.length)];
        tapped(randomIndex);
      }
    });
  }

  bool checkWin(List<String> board, String player) {
    // Check for a win on the current board
    for (List<int> line in AppConstants.winLines) {
      if (board[line[0]] == player &&
          board[line[1]] == player &&
          board[line[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void checkWinner() {
    for (var line in AppConstants.winLines) {
      if (line.every((index) => bordState[index] == 'X')) {
        declareWinner('X', line);
        return;
      } else if (line.every((index) => bordState[index] == 'O')) {
        declareWinner('O', line);
        return;
      }
    }

    if (count == 9) {
      declareWinner('Nobody');
    }
  }

  void declareWinner(String winner, [List<int>? winningLine]) {
    if (winner == 'Nobody') {
      resultDeclaration = 'Nobody Wins';
    } else {
      resultDeclaration = 'Player $winner Wins';
      if (winningLine != null) {
        winIndexes.addAll(winningLine);
      }
      updateScore(winner);
    }
    isOn = false;
    notifyListeners();
  }

  void updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

//
  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      bordState[i] = '';
    }
    resultDeclaration = '';
    winIndexes = [];
    count = 0;
    isOn = true;
    notifyListeners();
  }
}
