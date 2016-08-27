# NAME

Hash::Util::Pick - The non-destructive utilities for picking hash

# SYNOPSIS

    use feature qw/say/;
    use Hash::Util::Pick qw/pick/;

    my $src = {
        foo => 0,
        bar => 1,
        baz => 2,
    };

    my $dest = pick $hash => qw/foo bar/;
    # => { foo => 0, bar => 1 }

# DESCRIPTION

Hash::Util::Pick is the non-destructive utilities for picking hash

# METHODS

## `pick(\%hash, @keys)`
Create hash reference picked by special keys.

    pick { foo => 0, bar => 1 } => qw/foo/;
    # => { foo => 0 }

## `pick_by(\%hash, \&predicate)`
Create hash reference picked by bloc block.

    pick_by { foo => 0, bar => 1 } => sub { $_ > 0 };
    # => { bar => 1 }

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 Pine Mizune

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

# AUTHOR

Pine Mizune &lt;pinemz@gmail.com>