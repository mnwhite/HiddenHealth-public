#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 264007                            
   DATA_DOMAIN      : IND                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : All Individuals Data              
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 49                                
   N_OF_OBSERVATIONS: 41506                             
   MAX_REC_LENGTH   : 155                               
   DATE & TIME      : September 6, 2019 @ 14:51:54
*************************************************************************
;

infix
      ER30000              1 - 1           ER30001              2 - 5           ER30002              6 - 8     
      ER32000              9 - 9           ER32050             10 - 13          ER33401             14 - 18    
      ER33402             19 - 20          ER33403             21 - 22          ER33406             23 - 26    
      ER33501             27 - 31          ER33502             32 - 33          ER33503             34 - 35    
      ER33506             36 - 39          ER33601             40 - 43          ER33602             44 - 45    
      ER33603             46 - 47          ER33606             48 - 51          ER33701             52 - 56    
      ER33702             57 - 58          ER33703             59 - 60          ER33706             61 - 64    
      ER33801             65 - 69          ER33802             70 - 71          ER33803             72 - 73    
      ER33806             74 - 77          ER33901             78 - 82          ER33902             83 - 84    
      ER33903             85 - 86          ER33906             87 - 90          ER34001             91 - 95    
      ER34002             96 - 97          ER34003             98 - 99          ER34006            100 - 103   
      ER34101            104 - 108         ER34102            109 - 110         ER34103            111 - 112   
      ER34106            113 - 116         ER34201            117 - 121         ER34202            122 - 123   
      ER34203            124 - 125         ER34206            126 - 129         ER34301            130 - 134   
      ER34302            135 - 136         ER34303            137 - 138         ER34307            139 - 142   
      ER34501            143 - 147         ER34502            148 - 149         ER34503            150 - 151   
      ER34506            152 - 155   
using J264007.txt, clear 
;
label variable ER30000       "RELEASE NUMBER"                           ;
label variable ER30001       "1968 INTERVIEW NUMBER"                    ;
label variable ER30002       "PERSON NUMBER                         68" ;
label variable ER32000       "SEX OF INDIVIDUAL"                        ;
label variable ER32050       "YEAR OF DEATH"                            ;
label variable ER33401       "1997 INTERVIEW NUMBER"                    ;
label variable ER33402       "SEQUENCE NUMBER                       97" ;
label variable ER33403       "RELATION TO HEAD                      97" ;
label variable ER33406       "YEAR INDIVIDUAL BORN                  97" ;
label variable ER33501       "1999 INTERVIEW NUMBER"                    ;
label variable ER33502       "SEQUENCE NUMBER                       99" ;
label variable ER33503       "RELATION TO HEAD                      99" ;
label variable ER33506       "YEAR INDIVIDUAL BORN                  99" ;
label variable ER33601       "2001 INTERVIEW NUMBER"                    ;
label variable ER33602       "SEQUENCE NUMBER                       01" ;
label variable ER33603       "RELATION TO HEAD                      01" ;
label variable ER33606       "YEAR INDIVIDUAL BORN                  01" ;
label variable ER33701       "2003 INTERVIEW NUMBER"                    ;
label variable ER33702       "SEQUENCE NUMBER                       03" ;
label variable ER33703       "RELATION TO HEAD                      03" ;
label variable ER33706       "YEAR INDIVIDUAL BORN                  03" ;
label variable ER33801       "2005 INTERVIEW NUMBER"                    ;
label variable ER33802       "SEQUENCE NUMBER                       05" ;
label variable ER33803       "RELATION TO HEAD                      05" ;
label variable ER33806       "YEAR INDIVIDUAL BORN                  05" ;
label variable ER33901       "2007 INTERVIEW NUMBER"                    ;
label variable ER33902       "SEQUENCE NUMBER                       07" ;
label variable ER33903       "RELATION TO HEAD                      07" ;
label variable ER33906       "YEAR INDIVIDUAL BORN                  07" ;
label variable ER34001       "2009 INTERVIEW NUMBER"                    ;
label variable ER34002       "SEQUENCE NUMBER                       09" ;
label variable ER34003       "RELATION TO HEAD                      09" ;
label variable ER34006       "YEAR INDIVIDUAL BORN                  09" ;
label variable ER34101       "2011 INTERVIEW NUMBER"                    ;
label variable ER34102       "SEQUENCE NUMBER                       11" ;
label variable ER34103       "RELATION TO HEAD                      11" ;
label variable ER34106       "YEAR INDIVIDUAL BORN                  11" ;
label variable ER34201       "2013 INTERVIEW NUMBER"                    ;
label variable ER34202       "SEQUENCE NUMBER                       13" ;
label variable ER34203       "RELATION TO HEAD                      13" ;
label variable ER34206       "YEAR INDIVIDUAL BORN                  13" ;
label variable ER34301       "2015 INTERVIEW NUMBER"                    ;
label variable ER34302       "SEQUENCE NUMBER                       15" ;
label variable ER34303       "RELATION TO HEAD                      15" ;
label variable ER34307       "YEAR INDIVIDUAL BORN                  15" ;
label variable ER34501       "2017 INTERVIEW NUMBER"                    ;
label variable ER34502       "SEQUENCE NUMBER                       17" ;
label variable ER34503       "RELATION TO REFERENCE PERSON          17" ;
label variable ER34506       "YEAR INDIVIDUAL BORN                  17" ;
