# frozen_string_literal: true

require_relative "file"

module Txtar
  # An Archive is a collection of files.
  # It might have an optional comment, as well.
  class Archive
    # Each file entry begins with a file marker line of the form "-- FILENAME --"
    # and is followed by zero or more file content lines making up the file data.
    #
    # The comment or file content ends at the next file marker line.
    # The file marker line must begin with the three-byte sequence "-- "
    # and end with the three-byte sequence " --", but the enclosed
    # file name can be surrounding by additional white space,
    # all of which is stripped.
    #
    # See https://git.io/JLyG7
    FILE_MARKER = Regexp.new('^-{2}\s{1}(?<filename>.*)\s{1}-{2}$')
    LINE_SEPARATOR = "\n"

    attr_reader :comment,
                :files

    class << self
      # Parses given String and returns a Txtar::Archive instance.
      def parse(data:)
        data = add_missing_newline(data.dup)
        lines = data.lines(LINE_SEPARATOR)

        new(comment: extract_comment(lines),
            files: extract_files(lines))
      end

      private

      # A comment is any content before the first file marker.
      def extract_comment(lines)
        lines.take_while { |line| !line.match?(FILE_MARKER) }
             .join
      end

      # A comment (any content before the first file marker) is dropped and all
      # other lines are treated as file blocks.
      def extract_files(lines)
        lines.drop_while { |line| !line.match?(FILE_MARKER) }
             .slice_before(FILE_MARKER).map do |slice|
               # The first element of the slice is a file marker. Therefore it's
               # removed from the slice and parsed separately.
               file_marker = slice.shift.match(FILE_MARKER)
               File.new(name: file_marker[:filename],
                        data: slice.join)
             end
      end

      # According to the spec, if the txtar file is missing a trailing newline
      # on the final line, parsers should consider a final newline to be present
      # anyway.
      def add_missing_newline(data)
        return data if data.end_with?(LINE_SEPARATOR)

        data << LINE_SEPARATOR
      end
    end

    def initialize(comment: nil, files: [])
      @comment = comment
      @files = files
    end
  end
end
