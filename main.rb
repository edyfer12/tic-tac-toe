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
        #Create a variable where the array of grids where player places a mark is stored
        @won_grids = [
            #Horizontal rows of where the player/opponent wins
            [@board[0][0], @board[0][1], @board[0][2]],
            [@board[1][0], @board[1][1], @board[1][2]],
            [@board[2][0], @board[2][1], @board[2][2]],
            #Diagonal rows of where the player/opponent wins
            [@board[0][0], @board[1][1], @board[2][2]],
            [@board[0][2], @board[1][1], @board[2][0]],
            #Vertical rows of where the player/opponent wins
            [@board[0][0], @board[1][0], @board[2][0]],
            [@board[0][1], @board[1][1], @board[2][1]],
            [@board[0][2], @board[1][2], @board[2][2]]
        ]
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
        #Create a variable that counts number of marks from both opponent and player
        @mark_count = 0
        #Encourage the user to keep playing until the player has won, tied or lost
        while keep_playing == true do
            #Instruct the player to choose the grid(x,y) and then allow the user to input the grid 
            #Use fgets to input the grid between 0,0 and 2,2
            print "Please select the grid: "
            grid = gets.chomp
            #Print "Player selected: coordinates" if a grid is replaced with O or X
            puts "Player selected: #{grid}"
            #Use the instance method to convert the blank space character to the mark on the board array element
            #The same instance method will also check if the element has a blank space character or O/X
            #Create a variable called marked where it stores the method call of mark_grid
            marked = mark_grid(grid, @player.mark)
            #Add blank line
            puts
            #Print out the board that is updated
            self.printBoard
            #Add blank line
            puts
            #If marked is not a mark, then do not increment mark count by 1 and forbid the opponent from
            #taking a turn
            if marked != "Grid is already marked" && marked != "Grid invalid"
                #Add mark count by 1
                @mark_count += 1
                #In case the player wins or loses, terminate the infinite loop
                if keep_playing == false
                    return(false)
                end
                
                #Create variable called opponent grid that stores value which chose random grid
                opponent_grid = choose_random_grid
                #Add blank line
                puts
                #Print 'The Opponent has selected grid (x,y)'
                #Use the instance method to enable the opponent to randomly select the grid
                puts "The Opponent has selected grid #{opponent_grid}"
                #Use the instance method for the opponent to take turn marking the grid
                mark_grid(opponent_grid, @opponent.mark)
                #Add mark count by 1
                @mark_count += 1
                #Add blank line
                puts
                #Print out the board that is updated
                self.printBoard
                #Add blank line
                puts
                if keep_playing == false
                    return(false)
                end
            end 
        end
        #Add blank line
        puts
    end
    
    #Add a method where the opponent randomly chooses a grid
    def choose_random_grid
        #Create a variable stores a random coordinate between 0,0 and 2,2 as first integer and second integer is
        #randomly chosen between 0 and 2 is convert to string with comma placed between
        random_grid = (rand * 2).round(0).to_s + "," + (rand * 2).round(0).to_s
        #Create variable called row to select random rows in a board
        row = (rand * 2).round(0)
        #Create variable called column to select random columns in a board
        col = (rand * 2).round(0)
        #Keep selecting grids between 0,0 and 2,2 until the grid does not have O or X via loop
        until @board[row][col] == ' '
            #Reassign row and columns to random values
            row = (rand * 2).round(0)
            col = (rand * 2).round(0)
        end
        #Create a variable stores a random coordinate between 0,0 and 2,2 as first integer and second integer is
        #randomly chosen between 0 and 2 is convert to string with comma placed between
        random_grid = row.round(0).to_s + "," + col.round(0).to_s
    end
    #Add a method where the grid number selected either by the opponent or player is used to 
    #convert blank space to X or O
    def mark_grid(grid, mark)
        #If a grid is 0,0 and is not X or O (using instance method, check_grid_exist),
        #change board[0][0] to O or X
        if @board[0][0] == ' ' && grid == "0,0"
            @board[0][0] = mark
            #If the player or opponent marks on the @board[0][0], store the mark on the won_grids
            #array nested element where is @board[0][0]  
            @won_grids[0][0] = @board[0][0]
            @won_grids[3][0] = @board[0][0]
            @won_grids[5][0] = @board[0][0]
            #Return mark
            return (mark)
        #If a grid is 0,1 and is not X or O (using instance method, check_grid_exist), 
        #change board[0][1] to O or X
        elsif @board[0][1] == ' ' && grid == '0,1'
            @board[0][1] = mark
            #If the player or opponent marks on the @board[0][1], store the mark on the won_grids
            #array nested element where is @board[0][1] 
            @won_grids[0][1] = @board[0][1]
            @won_grids[6][0] = @board[0][1] 
            #Return mark
            return (mark)
        #If a grid is 0,2 and is not X or O (using instance method, check_grid_exist),
        #change board[0][2] to O or X
        elsif @board[0][2] == ' ' && grid == '0,2'
            @board[0][2] = mark
            #If the player or opponent marks on the @board[0][2], store the mark on the won_grids
            #array nested element where is @board[0][2] 
            @won_grids[0][2] = @board[0][2]
            @won_grids[4][0] = @board[0][2]
            @won_grids[7][0] = @board[0][2]
            #Return mark
            return (mark)
        #If a grid is 1,0 and is not X or O (using instance method, check_grid_exist),
        #change board[1][0] to O or X
        elsif @board[1][0] == ' ' && grid == '1,0'
            @board[1][0] = mark
            #If the player or opponent marks on the @board[1][0], store the mark on the won_grids
            #array nested element where is @board[1][0] 
            @won_grids[1][0] = @board[1][0]
            @won_grids[5][1] = @board[1][0]
            #Return mark
            return (mark) 
        #If a grid is 1,1 and is not X or O (using instance method, check_grid_exist),
        #change board[1][1] to O or X
        elsif @board[1][1] == ' ' && grid == '1,1'
            @board[1][1] = mark
            #If the player or opponent marks on the @board[1][1], store the mark on the won_grids
            #array nested element where is @board[1][1] 
            @won_grids[1][1] = @board[1][1]
            @won_grids[3][1] = @board[1][1]
            @won_grids[4][1] = @board[1][1]
            @won_grids[6][1] = @board[1][1]
            #Return mark
            return (mark)
        #If a grid is 1,2 and is not X or O (using instance method, check_grid_exist),
        #change board[1][2] to O or X
        elsif @board[1][2] == ' ' && grid == '1,2'
            @board[1][2] = mark
            #If the player or opponent marks on the @board[1][2], store the mark on the won_grids
            #array nested element where is @board[1][2] 
            @won_grids[1][2] = @board[1][2]
            @won_grids[7][1] = @board[1][2]
            #Return mark
            return (mark)
        #If a grid is 2,0 and is not X or O (using instance method, check_grid_exist),
        #change board[2][0] to O or X
        elsif @board[2][0] == ' ' && grid == '2,0'
            @board[2][0] = mark
            #If the player or opponent marks on the @board[2][0], store the mark on the won_grids
            #array nested element where is @board[2][0] 
            @won_grids[2][0] = @board[2][0] 
            @won_grids[4][2] = @board[2][0]
            @won_grids[5][2] = @board[2][0]
            #Return mark
            return (mark)
        #If a grid is 2,1 and is not X or O (using instance method, check_grid_exist),
        #change board[2][1] to O or X
        elsif @board[2][1] == ' ' && grid == '2,1'
            @board[2][1] = mark
            #If the player or opponent marks on the @board[2][1], store the mark on the won_grids
            #array nested element where is @board[2][1] 
            @won_grids[2][1] = @board[2][1]
            @won_grids[6][2] = @board[2][1]
            #Return mark
            return (mark)
        #If a grid is 2,2 and is not X or O (using instance method, check_grid_exist),
        #change board[2][2] to O or X
        elsif @board[2][2] == ' ' && grid == '2,2'
            @board[2][2] = mark
            #If the player or opponent marks on the @board[2][2], store the mark on the won_grids
            #array nested element where is @board[2][2] 
            @won_grids[2][2] = @board[2][2]
            @won_grids[3][2] = @board[2][2]
            @won_grids[7][2] = @board[2][2]
            #Return mark
            return (mark)
        #If a grid entered is invalid characters, then print "Grid invalid" and return "Grid invalid"
        elsif grid_invalid?(grid)
            puts
            puts "Grid invalid"
            return('Grid invalid')
        #If the player attempts to mark the grid that is already marked, notify the user
        #that the grid is already is marked
        else
            puts
            puts "Grid is already marked"
            return("Grid is already marked")
        end
    end
    #Create an instance variable to check if the player has won, lost or drawn
    def keep_playing
        #If the player has scored three marks in a row horizontally, vertically or diagonally,
        if player_won? && @mark_count <= 9
            #Notify the player by printing 'You won the game'
            puts "You won the game"
            return(false)
        #If the player has lost against the opponent where opponent has three marks in a row
        #horizontally, vertically or diagonally, 
        elsif opponent_won? && @mark_count <= 9
            #Notify the player by printing 'You lost the game'
            puts "You lost the game"
            return(false)
        #If the player has drawn where there are no three marks in a row horizonally, vertically,
        #not diagonally, and there are 9 marks on a board with X and O
        elsif !player_won? && !opponent_won? && @mark_count == 9
            puts "You tied the game"
            return (false)
        end
        #Return the instance method to true to indicate the game is currently playing
        return(true)
    end
    #Create an instance variable that checks if the player has won the game
    def player_won?
        #Set row to 0
        row = 0
        #Loop each row of the won_grids array
        while row < @won_grids.length
            #For each row, check if the row contains all the marks of the player,
            if @won_grids[row].all?(@player.mark)
                #If so, terminate the loop
                return(true)
            end
            #Increase each row by 1
            row += 1
        end
    end

    #Create an instance variable that checks if the player has won the game
    def opponent_won?
        #Set row to 0
        row = 0
        #Loop each row of the won_grids array
        while row < @won_grids.length
            #For each row, check if the row contains all the marks of the player,
            if @won_grids[row].all?(@opponent.mark)
                #If so, terminate the loop
                return(true)
            end
            #Increase each row by 1
            row += 1
        end
    end

    #Create an instance method that checks if the grid is valid or not
    def grid_invalid?(grid)
        #convert grid into array
        grid = grid.split(",")
        #convert first element of grid into integer and store into variable x_int
        x_int = grid[0].to_i
        #convert second element of grid into integer and store into variable y_int
        y_int = grid[1].to_i
        #Assign first element of grid into created variable x_str
        x_str = grid[0] 
        #Assign second element of grid into created variable y_str
        y_str = grid[1]
        #Revert into a string
        grid = grid.join(',')

        if (x_int > 2 || x_int < 0 || y_int > 2 || y_int < 0) || 
            x_str == nil || y_str == nil || !x_str.match?('[0-9]') || 
            !y_str.match?('[0-9]') || x_str.match?('/s') ||  y_str.match?('/s') ||
            grid.length > 3
            #If so, return true
            return(true)
        else
            return(false)
        end
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