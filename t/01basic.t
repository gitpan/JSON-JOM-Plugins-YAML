use Test::More tests => 3;
BEGIN { use_ok('JSON::JOM') };
BEGIN { use_ok('JSON::JOM::Plugins::YAML') };

my $jom = JSON::JOM::to_jom({});

ok($jom->can('to_yaml'), 'JOM can to_yaml');
