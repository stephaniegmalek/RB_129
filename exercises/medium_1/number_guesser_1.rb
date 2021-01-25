class Player
  def make_a_guess
    guess = nil
    loop do
      puts "Enter a number between #{GuessingGame::RANGE.first} and #{GuessingGame::RANGE.last}:"
      guess = gets.chomp
      break if GuessingGame::RANGE.cover?(guess.to_i) && valid_integer?(guess)
      puts "Invalid guess."
    end
    guess.to_i
  end

  def valid_integer?(input)
    input.to_i.to_s == input
  end
end

class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  RESULT_OF_GUESS_MESSAGE = {
    high: "Your number is too high.",
    low:  "Your number is too low.",
    win:  "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high: :lose,
    low:  :lose,
    win:  :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize
    @player = Player.new
  end

  def play
    generate_winning_number
    game_result = play_game
    display_results(game_result)
  end

  def play_game
    result = nil
    MAX_GUESSES.downto(1) do |remaining_guesses |
      display_remaining_guesses(remaining_guesses)
      result = determine_results(@player.make_a_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :win
    end
    WIN_OR_LOSE[result]
  end

  def generate_winning_number
    @winning_number = rand(RANGE)
  end

  def display_remaining_guesses(remaining)
    puts 
    if remaining == 1 
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def determine_results(guess)
    return :win if guess == @winning_number
    return :low if guess < @winning_number
    :high
  end

  def display_results(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

game = GuessingGame.new
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!
=end
# game.play
=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end