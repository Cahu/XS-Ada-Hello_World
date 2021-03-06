use 5.018001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'MyAdaModule',
    VERSION_FROM      => 'lib/MyAdaModule.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?           # Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/MyAdaModule.pm', # retrieve abstract from module
       AUTHOR         => 'A. U. Thor <benoit@nonet>') : ()),
    LIBS              => ['-L/usr/lib/gcc/i686-pc-linux-gnu/4.8.2/adalib/ -lgnat'],
    DEFINE            => '',    # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	MYEXTLIB          => 'src/dep.a',
);


sub MY::postamble {
	join("\n",
		"\$(MYEXTLIB)::",
		"\tmake -C src/",
		"",
		"clean::",
		"\tmake -C src/ clean",
	);
}
