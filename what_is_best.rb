#what_is_best.rb

items = []

questions = ["What is your favorite movie? ","What is your favorite color? ","What is your favorite song? ","What is your favorite animal? ","What is your favorite thing to do? ","What is your favorite beverage? "]

questions.each do |question|
	puts question
	items<<gets.chomp
end

winner_counts = Hash.new(0)
# winner_counts = { "Mon" => 6, "Tues" => 4, "Wed" => 2, "Thurs" => 6, "Fri" => 3, "Sat" => 6 }
favourite_things_combinations = items.combination(2).to_a

favourite_things_combinations.each do |combination|
	puts "What is better, #{combination[0]} or #{combination[1]}?" 
	answer_array = [combination[0],combination[1]]
	choice = gets.chomp
	while true
		unless answer_array.include?(choice)
			puts "What is better, #{combination[0]} or #{combination[1]}?" 
			choice = gets.chomp
			if answer_array.include?(choice)
				winner_counts[choice] += 1
			end
		end
	end
end

puts winner_counts

puts "~~ My Favorite Things Ranked ~~"

sorted = winner_counts.sort_by {|key,value| value}.reverse

sorted.each do |ranked_item|
	puts "-> #{ranked_item[0]} with a score of #{ranked_item[1]}"
end

if sorted[0][1] == sorted[1][1] 
	puts "We have a tie! Which one of these things makes you happiest, #{sorted[0][0]} or #{sorted[1][0]}?"
	best = gets.chomp
	puts "#{best} is best!"
else  
    puts "#{sorted[0][0]} is best!"
end

# HW: 
# 0) **** RUBYCONF SCHOLAR APPLICATION **** - done
# 1) Prompt again if it isn't one of the two. - done but then it breaks after you answer correctly?
# 2) { "Mon" => 6, "Tues" => 4, "Wed" => 2, "Thurs" => 6, "Fri" => 3, "Sat" => 6 } what if more than two winners?
# 3) make the logic groups smaller but equally if not more readible - ?