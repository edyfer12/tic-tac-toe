#Add a module that will be used to group all the classes related to tic-tac-toe

#Create a board with three rows and three columns. To show a clear view of the board for both human players,
#include the hash output on cell. 
class Board
end

#Create a class where the first player can select nought/cross and select squares on grid with that X or O
class Player
end

#Create a class where the opponent chooses grid based on X or O until game is over
class Opponent
end

#Create an object to be able to print out the board
board = Board.new
#Call the printBoard method based on the object created
board.printBoard