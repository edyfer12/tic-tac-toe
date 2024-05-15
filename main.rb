#Add a module that will be used to group all the classes related to tic-tac-toe
module Game
    #Create module Begin
    module Begin
        def b
            puts "The game has begun"
        end
    end

    #Create a board with three rows and three columns. To show a clear view of the board for both human players,
    #include the hash output on cell. 
    class Board
        #Show that the game has begun by displaying on the command line that "The game has begun"
        include Begin
    end

    #Create a class where the first player can select nought/cross and select squares on grid with that X or O
    class Player
        #First a player is given a random selection of X or O
        #If a player is provided X or O, then they must stick to it
        #The player will choose anywhere on the unfilled grid on where to mark the spot
        #If the player scores X or O three in a row horizontally or vertically, 
        #notify the player that they won the game and end the game 
    end

    #Create a class where the opponent chooses grid based on X or O until game is over
    class Opponent
        #After the game is started and the player has been selected the X or O, the opponent is 
        #given the option to pick a spot to mark that is unfilled
        #If the opponent scores X or O three in a row vertically or horizontally, notify the player that they won the 
        #the game and end the game
    end
end

board = Game::Board.new

board.b