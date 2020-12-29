# frozen_string_literal: true

require "csv"

class Emitter
  # Computes results for each line taken from the input and sends these results
  # to STDOUT.
  #
  # Input format:
  #
  #   <LEFT> <OPERATOR> <RIGHT>
  #
  # Output format:
  #
  #   <LEFT>,<OPERATOR>,<RIGHT>,<RESULT>
  #
  # Examples:
  #
  #   # input line
  #   2 + 3
  #
  #   # output line
  #   2,+,3,5
  #
  # If the line cannot be processed, sends the error message to STDERR.
  def process(io:)
    CSV($stdout) do |output|
      io.each_line do |line|
        left, operator, right = line.strip.split(" ", 3)
        result = left.to_i.send(operator, right.to_i)
        output << [left, operator, right, result]
      rescue
        $stderr.puts("level=error msg=\"cannot process\" left=#{left} operator=#{operator} right=#{right}")
      end
    end
  end
end
