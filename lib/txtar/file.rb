# frozen_string_literal: true

module Txtar
  # A File is a single file in an archive.
  class File
    attr_reader :name,
                :data

    def initialize(name:, data: nil)
      @name = name
      @data = data
    end
  end
end
