#Create a board with three rows and three columns. To show a clear view of the board for both human players,
#include the hash output on cell. 

class Board
    def printBoard
        row = 0
        while row < 3
            col = 0
            while col < 3
                print "#"
                col += 1
            end
            puts "\n"
            row += 1
        end
    end
end