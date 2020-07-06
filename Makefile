# Makefile for CObey
#

#
# Program specific options:
#
COMPONENT  = CObey
CLEANTARGET = cleantarget
EXPORTS    = 
RESOURCES  = 
LIBS       = ${OSLIB}
INCLUDES   = OSLib:,<Lib$Dir>.
USEOSLIB   = yes
CDEFINES   = 
OBJS       = o.main \
             o.module \
             o.veneer

FORTIFY    = yes

include CModule

CMHGFLAGS_BASE += -zbase

cleantarget:
       ${RM} h.module

# additional dependencies
$(OZDIR).main: h.module

#---------------------------------------------------------------------------
# Dynamic dependencies:
