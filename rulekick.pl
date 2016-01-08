use strict;
use vars qw($VERSION %IRSSI);

use Irssi;

#########################################################################################################################################
#If there are a lot of people breaking a rule, you can have a custom kick message preformated.						#
#Use "/rkm [Rule]" to create a rule.													#
#Then, use "/rk [user] [Spec]" to kick someone. The kick message will be the spec (specific) followed by the rule.			#
#																	#
#For example, if you had a rule against using adjectives, you would do "/rkm = adjective" which sets the rule to "= adjective"		#
#Then, if somebody says pretty, you do "/rk nick pretty" and it will kick nick with the reason "pretty = adjective"			#
#########################################################################################################################################

$VERSION = '1.00';
%IRSSI = (
    authors	=> 'fuzzybow',
    contact	=> 'fuzzybow@matte.one',
    name	=> 'RuleKick',
    description	=> 'Simple Modifiable Rule Kick',
    license	=> 'MIT',
);

my $rule = " ";
my $server = shift;

Irssi::command_bind rkm => sub {
    $rule = $_[0];
};

Irssi::command_bind rk => sub {
    my ($user, $freas, $server, $channel) = @_;
    my ($reas, $v) = split('Irssi::Irc', $freas, 2);
    $server->command("kick $user $reas $rule");
};
