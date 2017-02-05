require "pry"

class Sequence
  attr_accessor :seq, :count, :new_seq, :seq_char, :infinitely

  def initialize(seq, infinitely = true)
    @seq = seq
    @new_seq = ''
    @infinitely = infinitely
  end

  def generate
    nandle_sequence
    clear_data
    get_new_sequence
  end

  private

  def get_new_sequence
    seq.chars.each_with_index do |char, i|
      seq_char == char ? @count += 1 : set_new_seq(char)

      @new_seq << "#{@count}#{char}" if i == seq.length - 1
    end

    sleep(1)
    generate if infinitely
  end

  def set_new_seq(char)
    @new_seq << "#{count}#{seq_char}"
    @seq_char = char
    @count = 1
  end

  def clear_data
    @count = 0
    @new_seq = ''
    @seq_char = seq.chars.first
  end

  def nandle_sequence
    @seq = new_seq unless new_seq.empty?
    puts seq
  end
end
