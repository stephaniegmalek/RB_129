include Math

class GuessingGame
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

  def initialize(num1, num2)
    @range = (num1..num2)
    @max_guesses = Math.log2(@range.size).to_i + 1
  end

  def play
    generate_winning_number
    game_result = play_game
    display_results(game_result)
  end

  def play_game
    result = nil
    @max_guesses.downto(1) do |remaining_guesses |
      display_remaining_guesses(remaining_guesses)
      result = determine_results(make_a_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :win
    end
    WIN_OR_LOSE[result]
  end

  def generate_winning_number
    @winning_number = rand(@range)
  end

  def display_remaining_guesses(remaining)
    puts 
    if remaining == 1 
      puts 'You have 1 guess remaining.'
    else
      puts  "You have #{remaining} guesses remaining."
    end
  end

  def make_a_guess
    guess = nil
    loop do
      puts "Enter a number between #{@range.first} and #{@range.last}:"
      guess = gets.chomp
      break if @range.cover?(guess.to_i) && valid_integer?(guess)
      puts "Invalid guess."
    end
    guess.to_i
  end

  def valid_integer?(input)
    input.to_i.to_s == input
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

game = GuessingGame.new(501, 1500)
game.play
