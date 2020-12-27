# frozen_string_literal: true

require_relative "txtar/archive"
require_relative "txtar/version"

# Txtar implements a trivial text-based file archive format.
#
# The goals for the format are:
#
#   - be trivial enough to create and edit by hand.
#   - be able to store trees of text files describing go command test cases.
#   - diff nicely in git history and code reviews.
#
# Non-goals include being a completely general archive format,
# storing binary data, storing file modes, storing special files like
# symbolic links, and so on.
#
# It's a Ruby implementation of txtar Go package.
#
# See https://git.io/JLyDn
module Txtar
end
