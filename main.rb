require_relative "sequence"

class Main
  attr_accessor :answer, :started_sequnce, :cycles_number

  def perform
    print 'Do you want to continue a sequence of infinitely? (yes/no) '
    get_answer
    get_started_sequence
    call_sequence
  end

  private

  def get_answer
    @answer = gets.chomp
    show_warning unless answer =~ /(yes|no)/
  end

  def show_warning
    print 'Enter only yes or no: '
    get_answer
  end

  def get_started_sequence
    print 'Enter the starting sequence: '
    @started_sequnce = gets.chomp
    @started_sequnce = '1' if started_sequnce.empty?
  end

  def get_cycles_number
    print 'How much you want to display cycles: '
    @cycles_number = gets.chomp.to_i
    @cycles_number = 7 if cycles_number.zero?
  end

  def call_sequence
    if answer == 'yes'
      Sequence.new(started_sequnce).generate
    else
      get_cycles_number
      sequence = Sequence.new(started_sequnce, false)
      cycles_number.times { sequence.generate }
    end
  end
end

Main.new.perform
