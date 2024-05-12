gameDone = false
turn = 0

table = Array.new(9)

def checkPosition(table,userInput,str, gameDone)

    if userInput == "top left"
        legalMove(table, 0, str)
    elsif userInput == "top middle"
        legalMove(table, 1, str)
    elsif userInput == "top right"
        legalMove(table, 2, str)
    elsif userInput == "left middle"
        legalMove(table, 3, str)
    elsif userInput == "middle"
        legalMove(table, 4, str)
    elsif userInput == "right middle"
        legalMove(table, 5, str)
    elsif userInput == "bottom left"
        legalMove(table, 6, str)
    elsif userInput == "bottom middle"
        legalMove(table, 7, str)
    elsif userInput == "bottom right"
        legalMove(table, 8, str)
    else
        puts "that is not an option, enter again"
        userTry =gets.chomp
        checkPosition(table,userTry,str,gameDone)
    end

    
end

def print_board(table)
    puts " #{table[0] || ' '} | #{table[1] || ' '} | #{table[2] || ' '}"
    puts "---+---+---"
    puts " #{table[3] || ' '} | #{table[4] || ' '} | #{table[5] || ' '}"
    puts "---+---+---"
    puts " #{table[6] || ' '} | #{table[7] || ' '} | #{table[8] || ' '}"
  end

def legalMove(table, index, str)
    if table[index] == nil
        table[index] = str
    else  
        puts "that is not a legal move, that space is not empty"
    end
end

def gameWon(table, gameDone)
    winning_combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    winning_combinations.each do |combo|
        positions = combo.map { |index| table[index] }
        if positions.uniq.length == 1 && positions[0] != nil
            print positions[0]
            puts " have won game FINISHED"
            return true
        end
      end
    return false
end



while gameDone == false
    if turn % 2 == 0 
        print_board(table)
        puts "Enter where you want to place your X"
        userInput = gets.chomp
        checkPosition(table,userInput, "X", gameDone)
        turn += 1
        gameDone = gameWon(table, gameDone)
    else    
        print_board(table)
        puts "Enter where you want to place your O"
        userInput = gets.chomp
        checkPosition(table,userInput, "O", gameDone)
        turn += 1
        gameDone = gameWon(table, gameDone)
    end
end