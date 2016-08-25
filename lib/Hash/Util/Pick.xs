#ifdef __cplusplus
extern "C" {
#endif

#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>

#ifdef __cplusplus
} /* extern "C" */
#endif

#define NEED_newSVpvn_flags
#include "ppport.h"

MODULE = Hash::Util::Pick    PACKAGE = Hash::Util::Pick

PROTOTYPES: DISABLED

void
pick(...)
PROTOTYPE: $@
PPCODE:
{
    SV **args = &PL_stack_base[ax];
    HV *src = (HV*)SvRV(args[0]);

    I32 i;
    HV *dest = (HV*)sv_2mortal((SV*)newHV());

    for (i = 1; i < items; ++i) {
        HE *he = hv_fetch_ent(src, args[i], 0, 0);
        if (he) {
            SV *v = HeVAL(he);
            hv_store_ent(dest, args[i], v, 0);
        }
    }

    XPUSHs(newRV_inc((SV*)dest));
    XSRETURN(1);
}

void
pick_by(...)
PROTOTYPE: $&
PPCODE:
{
    dMULTICALL;
    GV *gv;
    HV *stash;
    I32 gimme = G_SCALAR;

    HV *src = (HV*)SvRV(ST(0));
    CV *code =  sv_2cv(SvRV(ST(1)), &stash, &gv, 0);

    char *hkey;
    I32 hkeylen;
    SV *value;
    HV *dest = (HV*)sv_2mortal((SV*)newHV());

    PUSH_MULTICALL(code);
    SAVESPTR(GvSV(PL_defgv));

    hv_iterinit(src);

    while ((value = hv_iternextsv(src, &hkey, &hkeylen)) != NULL) {
        GvSV(PL_defgv) = value;
        MULTICALL;
        if (SvTRUE(*PL_stack_sp)) {
            hv_store(dest, hkey, hkeylen, value, 0);
        }
    }

    POP_MULTICALL;

    XPUSHs(newRV_inc((SV*)dest));
    XSRETURN(1);
}

