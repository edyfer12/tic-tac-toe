#Create a class called Game where a game of Tic Tac Toe is played
class Game
    #Add an constructor method that is used to create the board with 9 elements which is 2d array
    def initialize
        #Print 'The game has begun'
        puts "\nThe game has begun"
        #Add an empty line
        puts
        #Create an instance variable that will be used to store an array of 3 rows and columns
        #The default value of the board array will all have hash #
        @board = Array.new(3){Array.new(3, ' ')}
    end
    #Add a method that prints out the board
    def printBoard
        #Put in between nested array the | character along with the square displayed
        puts ' ' + @board[0][0] + ' | ' + @board[0][1] + ' | ' + @board[0][2]
        #Add equals sign beneath the row
        puts '=== === ==='
        #Display the grids of the board with | split character
        puts ' ' + @board[1][0] + ' | ' + @board[1][1] + ' | ' + @board[1][2]
        #Add equals sign beneath the row
        puts '=== === ==='
        #Display the grids of the board with | split character
        puts ' ' + @board[2][0] + ' | ' + @board[2][1] + ' | ' + @board[2][2]
    end
    
end
#Create a class called Opponent where an opponent is created
class Opponent
    #Create a constructor method where opponent has X or O
        #If a player has chosen X, allow the opponent to have O
        #If a player has chosen O, allow the opponent to have X
end
#Create a class called Player where a player is created  
class Player
    #Create a constructor that randomly assigns the player nought or cross
        #Create a variable, mark that chooses the random integer between 0 and 1
        #If integer is 0, set to O
        #If integer is 1, set to X
        #The player will be either a nought or a cross
        #Print player has been given: X / O
end

game = Game.new

