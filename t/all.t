use Test::More qw(no_plan);

use WoW::Armory::API;

ok($api = WoW::Armory::API->new(), 'New API object');
ok(WOW_CHARACTER_FIELDS, 'Constants exists');
ok($regions = $api->GetRegions, 'Region list');
ok(grep {$_->{region} eq 'eu'}  @{$regions->{regions}}, "Region 'eu' is exists");
ok(!$api->HasLocale('ru_RU'), "Locale 'ru_RU' is not exists in current region");
$api->SetRegion('eu');
ok($api->HasLocale('ru_RU'), "Locale 'ru_RU' is exists in current region");
ok($api->GetApiHost eq 'eu.battle.net', 'Correct API host');
