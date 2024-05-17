#Create a class called Game where a game of Tic Tac Toe is played
class Game
    #Add an constructor method that is used to create the board with 9 elements which is 2d array
    def initialize
        #Create a player and opponent object based on player and opponent class
        player = Player.new
        opponent = Opponent.new(player)
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
    #Add a method where the tic-tac-toe is played
     

    #Add a method that checks if an individual grid nought or cross
        #If a selected grid has blank line, return false
        #If a selected grid has a nought or cross, return true
    
    #Add a method where the opponent randomly chooses a grid
        #Create a variable stores a random number between 0 and 8
        #Keep selecting number between 0 and 8 until the grid does not have O or X via loop
        #Inside a loop, check if the particular grid has O or X using the instance method below
    
    #Add a method where the grid number selected either by the opponent or player is used to 
    #convert blank space to X or O
        #If a number is 0 and is not X or O (using instance method, check_grid_exist),
        #change board[0][0] to O or X
        #If a number is 1 and is not X or O (using instance method, check_grid_exist), 
        #change board[0][1] to O or X
        #If a number is 2 and is not X or O (using instance method, check_grid_exist),
        #change board[0][2] to O or X
        #If a number is 3 and is not X or O (using instance method, check_grid_exist),
        #change board[1][0] to O or X
        #If a number is 4 and is not X or O (using instance method, check_grid_exist),
        #change board[1][1] to O or X
        #If a number is 5 and is not X or O (using instance method, check_grid_exist),
        #change board[1][2] to O or X
        #If a number is 6 and is not X or O (using instance method, check_grid_exist),
        #change board[2][0] to O or X
        #If a number is 7 and is not X or O (using instance method, check_grid_exist),
        #change board[2][1] to O or X
        #If a number is 8 and is not X or O (using instance method, check_grid_exist),
        #change board[2][2] to O or X

    #Add a method where a player is instructed to select the grid
        #Print 'Please select grid (0-8): '
        #Use fgets to input a number between 0 and 9 and convert to integer
        #Print "Player selected: grid_number" if a grid is replaced with O or X
    
end
#Create a class called Opponent where an opponent is created
class Opponent
    #Create a constructor method where opponent has X or O passing in player object
    def initialize(player)
        #If a player has chosen X, allow the opponent to have O
        if player.mark == 'X'
            @mark = "O"
        #If a player has chosen O, allow the opponent to have X
        else
            @mark = "X"
        end
    end
end
#Create a class called Player where a player is created  
class Player
    #Create a constructor that randomly assigns the player nought or cross
    def initialize
        #Create a variable, mark that chooses the random integer between 0 and 1
        @mark = rand.round(0)
        #If integer is 0, set to O
        if @mark == 0
            @mark = "O"
        else
        #If integer is 1, set to X
            @mark = "X"
        end
        #The player will be either a nought or a cross
        #Print player has been given: X / O
    end
    #Create a getter method where the player object regardless of the class can obtain
    #the mark value of the instance variable
end
#Create a game object
game = Game.new

