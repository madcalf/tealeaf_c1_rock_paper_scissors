# Course 1. Lesson 1. Rock, Paper, Scissors

OPTIONS = {}
OPTIONS["r"] = { "name" => "rock",  "target" => "scissors", "action" => "crushes"}
OPTIONS["p"] = { "name" => "paper",  "target" => "rock", "action" => "wraps"}
OPTIONS["s"] = { "name" => "scissors",  "target" => "paper", "action" => "cut"}

score = {player:0, computer:0}

loop do
  # not sure why this isn't working to clear the screen
  system 'clear'   
  puts "\n---------------------------"
  puts "Play Rock Paper Scissors!"
  puts "---------------------------" 
  # make sure user selects R, P or S only
  begin
    puts "Choose your weapon: [R]ock  [P]aper  [S]cissors"
    input = gets.chomp.downcase
    break if OPTIONS.keys.include?(input)
    puts "'#{input}' is not an option."
  end while true
  
  player_choice = OPTIONS[input]         
  puts "You chose #{player_choice['name'].capitalize}"

  # computer selects random one
  computer_choice = OPTIONS.values.sample
  puts "I chose #{computer_choice["name"].capitalize}"

  # test for the winner
  if player_choice["name"] == computer_choice["name"]
    puts "It's a tie!"
  elsif player_choice["target"] == computer_choice["name"]
    puts "#{player_choice["name"].capitalize} #{player_choice["action"]} #{player_choice["target"].capitalize}"
    puts "You Win!"
    score[:player] += 1
  else
    puts "#{computer_choice["name"].capitalize} #{computer_choice["action"]} #{computer_choice["target"].capitalize}"
    puts "Ha! I Win!!!"
    score[:computer] += 1
  end
  
  puts "Score: You: #{score[:player]}  Me: #{score[:computer]}"
  
  # prompt to play again
  puts "\nPlay again?  [Y]es  [N]o"
  break if gets.chomp.downcase != "y"  
end 
 
puts "Ok, thanks for playing!" 