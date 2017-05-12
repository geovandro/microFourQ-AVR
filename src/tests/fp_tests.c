/***********************************************************************************
* FourQlib: a high-performance crypto library based on the elliptic curve FourQ
*
*    Copyright (c) Microsoft Corporation. All rights reserved.
*
* Abstract: testing code for FourQ's field arithmetic 
*
* Modified by Geovandro C. C. F. Pereira
************************************************************************************/

#include "../FourQ_internal.h"
#include "test_extras.h"
#include <stdio.h>

#define TEST_LOOPS        100       // Number of iterations per test


bool fp2_test()
{ // Tests for the quadratic extension field arithmetic
    bool OK = true;
    int n, passed;
    f2elm_t a, b, c, d, e, f;

    // GF(p^2) multiplication using p = 2^127-1
    passed = 1;
    for (n=0; n<TEST_LOOPS; n++)
    {    
        fp2random1271_test(a); fp2random1271_test(b); fp2random1271_test(c); 
        fp2random1271_test(d); fp2random1271_test(e); fp2random1271_test(f);
       

        fp2mul1271(a, b, d);                                             // d = a*b 
        mod1271(d[0]); mod1271(d[1]);
        fp2mul1271(b, a, e);                                             // e = b*a 
        mod1271(e[0]); mod1271(e[1]);
        if (fp2compare64((uint64_t*)d,(uint64_t*)e)!=0) { passed=0; break; }
        
        fp2mul1271(a, b, d); fp2mul1271(d, c, e);                        // e = (a*b)*c
        mod1271(e[0]); mod1271(e[1]);
        fp2mul1271(b, c, d); fp2mul1271(d, a, f);                        // f = a*(b*c)
        mod1271(f[0]); mod1271(f[1]);
        if (fp2compare64((uint64_t*)e,(uint64_t*)f)!=0) { passed=0; break; }
      
        fp2add1271(b, c, d); fp2mul1271(a, d, e);                        // e = a*(b+c)
        mod1271(e[0]); mod1271(e[1]);
        fp2mul1271(a, b, d); fp2mul1271(a, c, f); fp2add1271(d, f, f);   // f = a*b+a*c
        mod1271(f[0]); mod1271(f[1]);
        if (fp2compare64((uint64_t*)e,(uint64_t*)f)!=0) { passed=0; break; }
        
        fp2zero1271(b); b[0][0] = 1;
        fp2mul1271(a, b, d);                                             // d = a*1 
        mod1271(d[0]); mod1271(d[1]);                                                                     
        if (fp2compare64((uint64_t*)a,(uint64_t*)d)!=0) { passed=0; break; }
        
        fp2zero1271(b);
        fp2mul1271(a, b, d);                                             // d = a*0  
        mod1271(d[0]); mod1271(d[1]); 
        if (fp2compare64((uint64_t*)b,(uint64_t*)d)!=0) { passed=0; break; }
    }
    if (passed==0) return false;
    
    // GF(p^2) squaring using p = 2^127-1
    passed = 1;
    for (n=0; n<TEST_LOOPS; n++)
    {
        fp2random1271_test(a); fp2random1271_test(b); fp2random1271_test(c);

        fp2sqr1271(a, b);                                            // b = a^2
        fp2mul1271(a, a, c);                                         // c = a*a 
        if (fp2compare64((uint64_t*)b,(uint64_t*)c)!=0) { passed=0; break; }
        
        fp2zero1271(a);
        fp2sqr1271(a, d);                                            // d = 0^2 
        if (fp2compare64((uint64_t*)a,(uint64_t*)d)!=0) { passed=0; break; }
    }
    if (passed==0) return false;

    // GF(p^2) inversion using p = 2^127-1
    passed = 1;
    for (n=0; n<TEST_LOOPS; n++)
    {
        fp2random1271_test(a);  
        
        fp2zero1271(d); d[0][0] = 1;           
        fp2copy1271(a, b);                        
        fp2inv1271(a);                                
        fp2mul1271(a, b, c);                                        // c = a*a^-1 = 1
        mod1271(c[0]); mod1271(c[1]);
        if (fp2compare64((uint64_t*)c,(uint64_t*)d)!=0) { passed=0; break; }
    }
    if (passed==0) return false;
    
    return OK;
}


int fp_tests()
{
    bool OK = true;

    OK = OK && fp2_test();     // Test quadratic extension field operations using p = 2^127-1
    
    return OK;
}
