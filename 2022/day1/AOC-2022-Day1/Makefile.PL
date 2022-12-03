use 5.32.1;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
	NAME             => 'AOC::2022::Day1',
	AUTHOR           => q{Mjöllnir <github+perso@mjollnir.fr>},
	VERSION_FROM     => 'lib/AOC/2022/Day1.pm',
	ABSTRACT_FROM    => 'lib/AOC/2022/Day1.pm',
	LICENSE          => 'mit',
	MIN_PERL_VERSION => '5.32.1',
	CONFIGURE_REQUIRES => {
		'ExtUtils::MakeMaker' => '0',
	},
	TEST_REQUIRES => {
	    'Test::More' => '0',
	},
	PREREQ_PM => {
		#'ABC'              => '1.6',
		#'Foo::Bar::Module' => '5.0401',
	},
	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean => { FILES => 'AOC-2022-Day1-*' },
);

WriteMakefile(%WriteMakefileArgs);
