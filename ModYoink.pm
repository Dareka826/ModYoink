package ModYoink;

use strict;
use warnings;

sub yoink_symbols {
    my ($mod_target, $mod_source, $symbols_arrref) = @_;

    my $yoinkee_ref = eval('\%' . $mod_source . '::');
    my $yoinker_ref = eval('\%' . $mod_target . '::');

    my @symbols;
    if (!defined($symbols_arrref)) {
        @symbols = eval('@' . $mod_source . '::SYMBOLS');
    } else {
        @symbols = @{$symbols_arrref};
    }

    for my $sym_name (@symbols) {
        ${$yoinker_ref}{$sym_name} = ${$yoinkee_ref}{$sym_name};
    }
};

1;
