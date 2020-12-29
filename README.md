# Txtar

A Ruby implementation of [`txtar`](https://github.com/golang/tools/tree/master/txtar) Go package.

## Background

I found `txtar` package while working on my Go projects and liked the
idea. Txtar archives helped me to package test fixtures in a clean and a human-friendly
way.

Recently tinkering on a Ruby project, I decided to use txtar files to organize
samples of input/output data in tests. As no Ruby gem implements
the format, I decided to make one :)

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

The installation procedure is standard as for any other Ruby gem.

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

As mentioned above, personally I use txtar files to organize test fixtures. See
[docs/examples](docs/examples).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soulim/txtar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/soulim/txtar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT). The original idea and the spec of txtar archives belongs to The Go Authors.

Copyright (c) 2020 Alexander Sulim
