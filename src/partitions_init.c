/* This created by tools::package_native_routine_registration_skeleton() */

#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void c_allblockparts(void *, void *, void *, void *, void *);
extern void c_alldiffparts(void *, void *, void *, void *);
extern void c_allparts(void *, void *, void *);
extern void c_allperms(void *, void *, void *, void *);
extern void c_allrestrictedparts(void *, void *, void *, void *, void *);
extern void c_bintocomp(void *, void *, void *);
extern void c_comptobin(void *, void *, void *);
extern void c_conjugate(void *, void *, void *, void *, void *, void *);
extern void c_durfee(void *, void *, void *, void *);
extern void c_nextblockpart(void *, void *, void *);
extern void c_nextdiffpart(void *, void *);
extern void c_nextpart(void *);
extern void c_nextrestrictedpart(void *, void *);
extern void c_numbdiffparts(void *, void *);
extern void c_numbparts(void *, void *);
extern void c_plainperms(void *, void *, void *);
extern void c_tobin(void *, void *, void *);
extern void c_wrap(void *, void *, void *);
extern void numbrestrictedparts_R(void *, void *, void *);

static const R_CMethodDef CEntries[] = {
    {"c_allblockparts",       (DL_FUNC) &c_allblockparts,       5},
    {"c_alldiffparts",        (DL_FUNC) &c_alldiffparts,        4},
    {"c_allparts",            (DL_FUNC) &c_allparts,            3},
    {"c_allperms",            (DL_FUNC) &c_allperms,            4},
    {"c_allrestrictedparts",  (DL_FUNC) &c_allrestrictedparts,  5},
    {"c_bintocomp",           (DL_FUNC) &c_bintocomp,           3},
    {"c_comptobin",           (DL_FUNC) &c_comptobin,           3},
    {"c_conjugate",           (DL_FUNC) &c_conjugate,           6},
    {"c_durfee",              (DL_FUNC) &c_durfee,              4},
    {"c_nextblockpart",       (DL_FUNC) &c_nextblockpart,       3},
    {"c_nextdiffpart",        (DL_FUNC) &c_nextdiffpart,        2},
    {"c_nextpart",            (DL_FUNC) &c_nextpart,            1},
    {"c_nextrestrictedpart",  (DL_FUNC) &c_nextrestrictedpart,  2},
    {"c_numbdiffparts",       (DL_FUNC) &c_numbdiffparts,       2},
    {"c_numbparts",           (DL_FUNC) &c_numbparts,           2},
    {"c_plainperms",          (DL_FUNC) &c_plainperms,          3},
    {"c_tobin",               (DL_FUNC) &c_tobin,               3},
    {"c_wrap",                (DL_FUNC) &c_wrap,                3},
    {"numbrestrictedparts_R", (DL_FUNC) &numbrestrictedparts_R, 3},
    {NULL, NULL, 0}
};

void R_init_partitions(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
