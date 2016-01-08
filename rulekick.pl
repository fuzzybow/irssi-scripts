use strict;
use vars qw($VERSION %IRSSI);

use Irssi;

$VERSION = '1.00';
%IRSSI = (
    authors	=> 'fuzzybow',
    contact	=> 'fuzzybow@matte.one',
    name	=> 'RuleKick',
    description	=> 'Simple Modifiable wordgame rulekick',
    license	=> 'MIT',
);

$rule = " = bad";

Irssi::command_bind rkm => sub {
    $rule = $0;
};

Irssi::command_bind rk => sub {
    $server->command("kick $0 $1 $rule");
};


