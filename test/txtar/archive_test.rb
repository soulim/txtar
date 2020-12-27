# frozen_string_literal: true

require "test_helper"
require "txtar/archive"

module Txtar
  class ArchiveTest < Minitest::Test
    SAMPLE = <<~TXT.strip.freeze
      comment1
      comment2
      -- file1 --
      File 1 text.
      -- foo ---
      More file 1 text.
      -- file 2 --
      File 2 text.
      -- empty --
      -- noNL --
      hello world
    TXT

    TESTS = {
      text: SAMPLE,
      parsed: Txtar::Archive.new(comment: "comment1\ncomment2\n",
                                 files: [
                                   Txtar::File.new(name: "file1",
                                                   data: "File 1 text.\n-- foo ---\nMore file 1 text.\n"),
                                   Txtar::File.new(name: "file 2",
                                                   data: "File 2 text.\n"),
                                   Txtar::File.new(name: "empty",
                                                   data: ""),
                                   Txtar::File.new(name: "noNL",
                                                   data: "hello world\n")
                                 ])
    }.freeze

    def test_self_parse_comment_extraction
      exp = TESTS[:parsed]
      act = Txtar::Archive.parse(data: TESTS[:text])

      assert_equal(exp.comment, act.comment)
    end

    def test_self_parse_files_extraction
      exp = TESTS[:parsed]
      act = Txtar::Archive.parse(data: TESTS[:text])

      exp.files.each_with_index do |file, index|
        assert_equal(file.name, act.files[index].name)
        assert_equal(file.data, act.files[index].data)
      end
    end
  end
end
