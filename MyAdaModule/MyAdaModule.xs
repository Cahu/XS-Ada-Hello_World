#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

extern void adainit();
extern void adafinal();

MODULE = MyAdaModule		PACKAGE = MyAdaModule		

void hello()
	CODE:
		adainit();
		dep();
		adafinal();
