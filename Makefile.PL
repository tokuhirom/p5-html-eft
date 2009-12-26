use inc::Module::Install;
name 'HTML-EFT';
all_from 'lib/HTML/EFT.pm';

requires 'JSON' => 2.16;
requires 'LWP::UserAgent' => 5.833;
requires 'Data::OptList' => 0.104;
requires 'HTML::ExtractContent';
requires 'UNIVERSAL::require';

tests 't/*.t t/*/*.t t/*/*/*.t t/*/*/*/*.t';
test_requires 'Test::More';
test_requires 'YAML';
author_tests 'xt';
use_test_base;
auto_include;
WriteAll;
