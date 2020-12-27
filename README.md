# Txtar

A Ruby implementation of [`txtar`](https://github.com/golang/tools/tree/master/txtar) Go package.

## Background

I found `txtar` package while working on my Go projects and really liked the
idea. Txtar archives helped me to package test fixtures in clean and human-friendly
way.

Recently tinkering on a Ruby project, I decided to use txtar files to packages
samples of input/output data in tests. As there is no Ruby gem that implements
the spec, I decided to make one :)

## Txtar format spec

The format spec copied from `txtar` Go package source code:

> Txtar format
>
> A txtar archive is zero or more comment lines and then a sequence of file entries.
> Each file entry begins with a file marker line of the form "-- FILENAME --"
> and is followed by zero or more file content lines making up the file data.
> The comment or file content ends at the next file marker line.
> The file marker line must begin with the three-byte sequence "-- "
> and end with the three-byte sequence " --", but the enclosed
> file name can be surrounding by additional white space,
> all of which is stripped.
>
> If the txtar file is missing a trailing newline on the final line,
> parsers should consider a final newline to be present anyway.
>
> There are no possible syntax errors in a txtar archive.

## Install

Add this line to your application's Gemfile:

```ruby
gem 'txtar'
```

And then execute:

```ShellSession
$ bundle install
```

Or install it yourself as:

```ShellSession
$ gem install txtar
```

## Usage

Personally I use txtar files to package test fixtures. Below you see a simple
example of the gem could be used.

```ruby
# main.rb
require "txtar"

text = <<~TXT.strip
  It's a comment for the txtar archive. The comment might
  contain multiple lines.
  -- sample.txt --
  Hello, world.
  -- sample.rb --
  puts "Hello, world."
TXT

txtar = Txtar::Archive.parse(data: text)
pp txtar
```
```ShellSession
$ ruby main.rb
#<Txtar::Archive:0x00007f9d81ae50a8
 @comment=
  "It's a comment for the txtar archive. The comment might\n" +
  "contain multiple lines.\n",
 @files=
  [#<Txtar::File:0x00007f9d81ae5210
    @data="Hello, world.\n",
    @name="sample.txt">,
   #<Txtar::File:0x00007f9d81ae50f8
    @data="puts \"Hello, world.\"\n",
    @name="sample.rb">]>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soulim/txtar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/soulim/txtar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). The original idea and the spec of txtar archives belongs to The Go Authors.

Copyright (c) 2020 Alexander Sulim
