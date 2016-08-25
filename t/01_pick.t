use strict;
use warnings;
use utf8;

use Test::More;
use Test::Deep;

use Hash::Util::Pick qw/pick/;

subtest basic => sub {
    subtest 'empty hash' => sub {
        cmp_deeply pick({}, qw//), {};
        cmp_deeply pick({}, qw/foo/), {};
        cmp_deeply pick({}, qw/foo bar/), {};
    };

    subtest 'single value' => sub {
        my $hash = { foo => 0 };
        cmp_deeply pick($hash, qw//), {};
        cmp_deeply pick($hash, qw/foo/), { foo => 0 };
        cmp_deeply pick($hash, qw/foo bar/), { foo => 0 };
    };

    subtest 'multi values' => sub {
        my $hash = { foo => 0, bar => 1 };
        cmp_deeply pick($hash, qw//), {};
        cmp_deeply pick($hash, qw/foo/), { foo => 0 };
        cmp_deeply pick($hash, qw/foo bar/), { foo => 0, bar => 1 };
    }
};

done_testing;

