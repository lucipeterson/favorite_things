#favorite_things/what_is_best3.rb

class BESTGAME

    def initialize
        @questions = ["What is your favorite movie? ","What is your favorite color? ","What is your favorite song? ","What is your favorite animal? ","What is your favorite thing to do? ","What is your favorite beverage? "]
        @favorite_things = []
    end

    def ask_questions
        @questions.each do |question|
            puts question
            @favorite_things << gets.downcase.chomp
        end
    end

    def compare
        @winner_counts = Hash.new(0)
        @fav_combos = @favorite_things.combination(2).to_a
        @fav_combos.each do |item|
            @answer_array = [item[0],item[1]]
            puts "What is better, #{item[0]} or #{item[1]}"
            @choice = gets.downcase.chomp
            @winner_counts[@choice] += 1 if @answer_array.include?(@choice)
            until @answer_array.include?(@choice)
                @answer_array = [item[0],item[1]]
                puts "What is better, #{item[0]} or #{item[1]}"
                @choice = gets.downcase.chomp
                @winner_counts[@choice] += 1 if @answer_array.include?(@choice)
            end
        end
    end

    def rank
        @sorted = @winner_counts.sort_by {|key,value| value}.reverse
        puts "~~ My Favorite Things Ranked ~~"
        @sorted.each do |ranked_item|
            puts "-> #{ranked_item[0]} with a score of #{ranked_item[1]}"
        end
    end

    def best
        @sorted.each do |item, count|
            if @sorted[0][1] == count
                puts "We have a tie! Which one of these things makes you happiest, #{@sorted[0][0]} or #{item}?"
                @sorted_answer_array = [@sorted[0][0],item]
                @best = gets.downcase.chomp
                puts "#{@best} is best!" if @sorted_answer_array.include?(@best)
                until @sorted_answer_array.include?(@best) 
                    @sorted_answer_array = [@sorted[0][0],item]
                    puts "We have a tie! Which one of these things makes you happiest, #{@sorted[0][0]} or #{item}?"
                    @best = gets.downcase.chomp
                    puts "#{@best} is best!" if @sorted_answer_array.include?(@best)
                end
            end
        end
        # if @sorted[0][1] == @sorted[1][1]
        #     puts "We have a tie! Which one of these things makes you happiest, #{@sorted[0][0]} or #{@sorted[1][0]}?"
        #     @sorted_answer_array = [@sorted[0][0],@sorted[1][0]]
        #     @best = gets.downcase.chomp
        #     puts "#{@best} is best!" if @sorted_answer_array.include?(@best)
        #     until @sorted_answer_array.include?(@best) 
        #         @sorted_answer_array = [@sorted[0][0],@sorted[1][0]]
        #         puts "We have a tie! Which one of these things makes you happiest, #{@sorted[0][0]} or #{@sorted[1][0]}?"
        #         @best = gets.downcase.chomp
        #         puts "#{@best} is best!" if @sorted_answer_array.include?(@best)
        #     end
        # else  
        #     puts "#{@sorted[0][0]} is best!"
        # end
    end

end

game = BESTGAME.new
game.ask_questions
game.compare
game.rank
game.best

puts "Play again? YES or NO?"
again = gets.downcase.chomp
if again == "yes"
    game = BESTGAME.new
    game.ask_questions
    game.compare
    game.rank
    game.best
    puts "Play again? YES or NO?"
    again = gets.downcase.chomp
    until again == "no"
        game = BESTGAME.new
        game.ask_questions
        game.compare
        game.rank
        game.best
        puts "Play again? YES or NO?"
        again = gets.downcase.chomp
    end
else
    puts "Thank you for playing, see you next time!"
end


