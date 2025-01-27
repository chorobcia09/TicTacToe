# Tic-Tac-Toe Game with Two Players

## Author
**Name:** Mateusz Chorab  
**Execution Date:** 04.01.2023  
**Submission Date:** 04.01.2023  
**File Name:** `Mateusz_Chorab_project_operating_systems_tic_tac_toe.sh`  
**Encoding:** UTF-8  

---

## Project Assumptions

This script allows two players to play the popular Tic-Tac-Toe game in the terminal.

---

## Description of Variables

- Symbols are prepared for two players.
- A variable is initialized to track game rounds.
- A 3x3 grid is used for the game board, allowing for 9 possible moves.
- An array from 1 to 9 is created to represent the board.

---

## Description of Functions

### **Function: `message`**
- Displays a welcome screen for players.
- Provides information on how to play the game, including navigation and rules.

### **Function: `init_board`**
- Resets the game board and the number of completed turns to their initial values.

### **Function: `board`**
- Draws the game board in the terminal.

### **Function: `player_choice`**
- Prompts the current player to select a grid cell.
- Updates the board with the chosen player's symbol.
- Checks if the player has won the game.
- If a player wins, it transitions to the `new_game` function.

### **Function: `check_winner`**
- Verifies if the game ended in a draw.
- If a draw occurs, it transitions to the `new_game` function.

### **Function: `new_game`**
- Asks the players if they want to play again.
- Resets the game if confirmed.

---

## Main Game Loop

The main loop executes the following functions in sequence:
1. `player_choice`
2. `board`
3. `check_winner`

This continues until the game ends.

---
