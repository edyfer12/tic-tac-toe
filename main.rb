require "pry-byebug"
#Create a class called Game where a game of Tic Tac Toe is played
class Game
    #Add getter method to retrive the mark from both the player and the opponent
    attr_reader :mark
    #Add an constructor method that is used to create the board with 9 elements which is 2d array
    def initialize
        #Create a player and opponent object based on player and opponent class
        @player = Player.new
        @opponent = Opponent.new(@player)
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
    #Add a method that enables the game of tic-tac-toe to be played
    def play
        #Display the board
        self.printBoard
        #Add a newline character by placing puts
        puts
        #Keep looping until the game is won, lost or drawn. Until then the user enters the input, displays board,
        #opponent enters the input and prints board. Use an instance method in the loop condition to check if 
        #the player wins
        #If the player wins, print "You won the game!!!" Use the instance method to check if the player has won
        #If the player loses, print "You lost the game!!!" Use the instance method to check if the player has lost
        #If the game is drawn, print "The game is tied!!!" Use the instance method to check if the game is tied
        #Instruct the player to choose the grid(x,y) and then allow the user to input the grid 
        #Use fgets to input the grid between 0,0 and 2,2
        print "Please select the grid: "
        grid = gets.chomp
        #Print "Player selected: coordinates" if a grid is replaced with O or X
        puts "Player selected: #{grid}"

        #Use the instance method to convert the blank space character to the mark on the board array element
        #The same instance method will also check if the element has a blank space character or O/X
        mark_grid(grid, @player.mark)
        #Print out the board that is updated

        #Print 'The Opponent has selected grid (x,y)'
        #Use the instance method to enable the opponent to randomly select the grid
        #The instance method will also check if the grid has X/O or empty space character

        #Print out the board that is updated
    end

    #Add a method that checks if an individual grid is a nought or cross
        #If a selected grid has blank character, return true
        #If a selected grid has a nought or cross, return false
    
    #Add a method where the opponent randomly chooses a grid
        #Create a variable stores a random coordinate between 0,0 and 2,2 as first integer and second integer is
        #randomly chosen between 0 and 2 is convert to string with comma placed between
        #Keep selecting grids between 0,0 and 2,2 until the grid does not have O or X via loop
        #Inside a loop, check if the particular grid has O or X using the instance method below
    
    #Add a method where the grid number selected either by the opponent or player is used to 
    #convert blank space to X or O
    def mark_grid(grid, mark)
        #If a grid is 0,0 and is not X or O (using instance method, check_grid_exist),
        #change board[0][0] to O or X
        if @board[0][0] == ' ' && grid == "0,0"
            @board[0][0] = self.mark
        end
        #If a grid is 0,1 and is not X or O (using instance method, check_grid_exist), 
        #change board[0][1] to O or X
        #If a grid is 0,2 and is not X or O (using instance method, check_grid_exist),
        #change board[0][2] to O or X
        #If a grid is 1,0 and is not X or O (using instance method, check_grid_exist),
        #change board[1][0] to O or X
        #If a grid is 1,1 and is not X or O (using instance method, check_grid_exist),
        #change board[1][1] to O or X
        #If a grid is 1,2 and is not X or O (using instance method, check_grid_exist),
        #change board[1][2] to O or X
        #If a grid is 2,0 and is not X or O (using instance method, check_grid_exist),
        #change board[2][0] to O or X
        #If a grid is 2,1 and is not X or O (using instance method, check_grid_exist),
        #change board[2][1] to O or X
        #If a grid is 2,2 and is not X or O (using instance method, check_grid_exist),
        #change board[2][2] to O or X
    end
    
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
        #Print opponent has been given: X / O
        puts "Opponent has been given: #{self.mark}"
    end
    #Create a getter method to retrieve the instance variable called mark
    attr_reader :mark
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
        puts "Player has been given: " + self.mark
    end
    #Create a getter method where the player object regardless of the class can obtain
    #the mark value of the instance variable
    attr_reader :mark
end
#Create a game object
game = Game.new
game.play