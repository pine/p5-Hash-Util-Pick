use strict;
use warnings;
use utf8;

use Test::More;
use Test::Deep;

use Hash::Util::Pick qw/pick_by/;

subtest basic => sub {
    subtest 'empty hash' => sub {
        cmp_deeply pick_by({}, sub { }), {};
        cmp_deeply pick_by({}, sub { 0 }), {};
        cmp_deeply pick_by({}, sub { 1 }), {};
    };

    subtest 'single value' => sub {
        my $hash = { foo => 0 };
        cmp_deeply pick_by($hash, sub { }), {};
        cmp_deeply pick_by($hash, sub { 0 }), {};
        cmp_deeply pick_by($hash, sub { 1 }), { foo => 0 };
        cmp_deeply pick_by($hash, sub { $_ == 0 }), { foo => 0 };
        cmp_deeply pick_by($hash, sub { $_ == 1 }), {};
    };

    subtest 'multi values' => sub {
        my $hash = { foo => 0, bar => 1 };
        cmp_deeply pick_by($hash, sub { }), {};
        cmp_deeply pick_by($hash, sub { 0 }), {};
        cmp_deeply pick_by($hash, sub { 1 }), { foo => 0, bar => 1 };
        cmp_deeply pick_by($hash, sub { $_ == 0 }), { foo => 0 };
        cmp_deeply pick_by($hash, sub { $_ == 1 }), { bar => 1 };
    };
};

done_testing;

