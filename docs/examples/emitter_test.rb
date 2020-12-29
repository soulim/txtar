# frozen_string_literal: true

require "minitest/autorun"
require "txtar"
require "pathname"

require_relative "emitter"

class EmitterTest < Minitest::Test
  def setup
    @emitter = Emitter.new
    @samples = Pathname.new(__FILE__).dirname.glob("testdata/*.txt").map do |pathname|
      Txtar::Archive.parse(data: pathname.read)
    end
  end

  def test_process
    @samples.each do |sample|
      stdin = sample.files.find { |file| file.name == "stdin" }
      stdout = sample.files.find { |file| file.name == "stdout" }
      stderr = sample.files.find { |file| file.name == "stderr" }

      assert_output(stdout.data, stderr.data) { @emitter.process(io: stdin.data) }
    end
  end
end
