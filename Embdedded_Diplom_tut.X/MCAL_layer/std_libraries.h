

/* 
 * File:   std_library.h 
 * Author: Muhammad Osama ELaraby
 * Comments:
 * Revision history:  
 */


#ifndef XC_HEADER_TEMPLATE_H
#define	XC_HEADER_TEMPLATE_H


/* Section : User Defined  Data Types*/



typedef unsigned char    uint8  ; 
typedef char             sint8  ;
typedef unsigned short   uint16 ;
typedef short            sint16 ;
typedef unsigned long    uint32 ;
typedef long             sint32 ;

typedef uint8    std_ReturnType ; 
/*****************************************/

/*Section : Macros */

#define STD_ON  0x01
#define STD_OFF 0x00 

#define E_OK    (std_ReturnType)0x01 
#define E_NOT_OK   (std_ReturnType)0x00 
#define NULL 0 
#endif	/* XC_HEADER_TEMPLATE_H */

