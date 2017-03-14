

#Access the following files and gems
require './progressbarsingle'
require 'paint'
require 'terminal-table'

#Questioner class
class Questioner
  def initialize
    @questions = [
    "What was the temperature on Monday?",
    "What was the temperature on Tuesday?",
    "What was the temperature on Wednesday?",
    "What was the temperature on Thursday?",
    "What was the temperature on Friday?",
    "What was the temperature on Saturday?",
    "What was the temperature on Sunday?",
    ]
  end
  attr_accessor :questions

#ask method within Questioner class. Carries the logic of progressing through questions/displaying
def ask(progress_bar)
  answers = []
  fahs = []
    @questions.each do |question| #.each specific to arrays. Looks over arrays. the "do portin creates a function, and "question" is just a placeholder"
      system("clear") #clears screen
      puts "#{progress_bar.title}:
      #{progress_bar.current_step}"
      puts question
      answer= gets.chomp.to_i
      fah = (answer * 9) / 5 + 32
      #colour logic
      if answer >= 30
        answer = Paint[answer, :red]
        else
        answer = Paint[answer, :blue]
      end

      #fah colour logic
      if fah >= 86
        fah = Paint[fah, :red]
        else
        fah = Paint[fah, :blue]
      end

      answers << answer #adds to the end of array/variable "answers"
      fahs << fah
      progress_bar.current_step = progress_bar.current_step + 1
      end

    if progress_bar.current_step == @questions.length + 1
      rows = []
      rows << ['Monday', answers[0], fahs[0]]
      rows << ['Tuesday', answers[1], fahs[1]]
      rows << ['Wednesday', answers[2], fahs[2]]
      rows << ['Thursday', answers[3], fahs[3]]
      rows << ['Friday', answers[4], fahs[4]]
      rows << ['Saturday', answers[5], fahs[5]]
      rows << ['Sunday', answers[6], fahs[6]]
      table = Terminal::Table.new :rows => rows
      table = Terminal::Table.new :title => "Tempertaure Chart", :headings => ['Day', 'Celsius', 'Fahrenheit'], :rows => rows
      puts table
    end
end
end

my_questioner = Questioner.new
progress_bar = ProgressBar.new("Question Progress")

my_questioner.ask(progress_bar)
