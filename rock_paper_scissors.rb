# Course 1. Lesson 1. Rock, Paper, Scissors

options = {}
options["r"] = { "name" => "rock",  "target" => "scissors", "action" => "crushes"}
options["p"] = { "name" => "paper",  "target" => "rock", "action" => "wraps"}
options["s"] = { "name" => "scissors",  "target" => "paper", "action" => "cut"}

# not sure why this isn't working to clear the screen
system 'clear'

puts
puts "---------------------------"
puts "Play Rock Paper Scissors!"
puts "---------------------------"

wins = {player:0, computer:0}

playing = true
while playing
  puts 
  puts "Choose your weapon: [R]ock  [P]aper  [S]cissors"
  input = gets.chomp
  # make sure user selects R, P or S only
  while (input.size !=1) || !input.downcase.match(/[rps]/) 
    puts "Not a valid selection. Select R, P, or S" 
    input = gets.chomp    
  end
  
  player_choice = options[input]         
  puts "You chose #{player_choice['name'].capitalize}"

  # computer selects random 
  r = Random.new.rand(0..options.size - 1)
  computer_choice = options.values[r]
  puts "I chose #{computer_choice["name"].capitalize}"

  # test for the winner
  if player_choice == computer_choice
    puts "It's a tie!"
  elsif player_choice["target"] == computer_choice["name"]
    puts "#{player_choice["name"].capitalize} #{player_choice["action"]} #{player_choice["target"].capitalize}"
    puts "You Win!"
    wins[:player] += 1
  else
    puts "#{computer_choice["name"].capitalize} #{computer_choice["action"]} #{computer_choice["target"].capitalize}"
    puts "Ha! I Win!!!"
    wins[:computer] += 1
  end
  
  puts "Score: You: #{wins[:player]}  Me: #{wins[:computer]}"
  
  # prompt to play again
  puts "\nPlay again?  [Y]es  [N]o"
  input = gets.chomp
  if input.downcase != "y"
    puts "Ok, thanks for playing!" 
    playing = false 
  end
end 
 