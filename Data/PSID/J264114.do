#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 264114                            
   DATA_DOMAIN      : IND                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : All Individuals Data              
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 58                                
   N_OF_OBSERVATIONS: 41506                             
   MAX_REC_LENGTH   : 239                               
   DATE & TIME      : September 9, 2019 @ 16:49:10
*************************************************************************
;

infix
      ER30000              1 - 1           ER30001              2 - 5           ER30002              6 - 8     
      ER33401              9 - 13          ER33402             14 - 15          ER33403             16 - 17    
      ER33430             18 - 24     long ER33438             25 - 30          ER33501             31 - 35    
      ER33502             36 - 37          ER33503             38 - 39          ER33546             40 - 46    
 long ER33547             47 - 51          ER33601             52 - 55          ER33602             56 - 57    
      ER33603             58 - 59          ER33637             60 - 66     long ER33639             67 - 71    
      ER33701             72 - 76          ER33702             77 - 78          ER33703             79 - 80    
      ER33740             81 - 87     long ER33742             88 - 92          ER33801             93 - 97    
      ER33802             98 - 99          ER33803            100 - 101         ER33848            102 - 108   
 long ER33849            109 - 113         ER33901            114 - 118         ER33902            119 - 120   
      ER33903            121 - 122         ER33950            123 - 129    long ER33951            130 - 134   
      ER34001            135 - 139         ER34002            140 - 141         ER34003            142 - 143   
      ER34045            144 - 150    long ER34046            151 - 155         ER34101            156 - 160   
      ER34102            161 - 162         ER34103            163 - 164         ER34154            165 - 171   
 long ER34155            172 - 176         ER34201            177 - 181         ER34202            182 - 183   
      ER34203            184 - 185         ER34268            186 - 192    long ER34269            193 - 197   
      ER34301            198 - 202         ER34302            203 - 204         ER34303            205 - 206   
      ER34413            207 - 213    long ER34414            214 - 218         ER34501            219 - 223   
      ER34502            224 - 225         ER34503            226 - 227         ER34650            228 - 234   
 long ER34651            235 - 239   
using J264114.txt, clear 
;
label variable ER30000       "RELEASE NUMBER"                           ;
label variable ER30001       "1968 INTERVIEW NUMBER"                    ;
label variable ER30002       "PERSON NUMBER                         68" ;
label variable ER33401       "1997 INTERVIEW NUMBER"                    ;
label variable ER33402       "SEQUENCE NUMBER                       97" ;
label variable ER33403       "RELATION TO HEAD                      97" ;
label variable ER33430       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   97" ;
label variable ER33438       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  97" ;
label variable ER33501       "1999 INTERVIEW NUMBER"                    ;
label variable ER33502       "SEQUENCE NUMBER                       99" ;
label variable ER33503       "RELATION TO HEAD                      99" ;
label variable ER33546       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   99" ;
label variable ER33547       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  99" ;
label variable ER33601       "2001 INTERVIEW NUMBER"                    ;
label variable ER33602       "SEQUENCE NUMBER                       01" ;
label variable ER33603       "RELATION TO HEAD                      01" ;
label variable ER33637       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   01" ;
label variable ER33639       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  01" ;
label variable ER33701       "2003 INTERVIEW NUMBER"                    ;
label variable ER33702       "SEQUENCE NUMBER                       03" ;
label variable ER33703       "RELATION TO HEAD                      03" ;
label variable ER33740       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   03" ;
label variable ER33742       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  03" ;
label variable ER33801       "2005 INTERVIEW NUMBER"                    ;
label variable ER33802       "SEQUENCE NUMBER                       05" ;
label variable ER33803       "RELATION TO HEAD                      05" ;
label variable ER33848       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   05" ;
label variable ER33849       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  05" ;
label variable ER33901       "2007 INTERVIEW NUMBER"                    ;
label variable ER33902       "SEQUENCE NUMBER                       07" ;
label variable ER33903       "RELATION TO HEAD                      07" ;
label variable ER33950       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   07" ;
label variable ER33951       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  07" ;
label variable ER34001       "2009 INTERVIEW NUMBER"                    ;
label variable ER34002       "SEQUENCE NUMBER                       09" ;
label variable ER34003       "RELATION TO HEAD                      09" ;
label variable ER34045       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   09" ;
label variable ER34046       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  09" ;
label variable ER34101       "2011 INTERVIEW NUMBER"                    ;
label variable ER34102       "SEQUENCE NUMBER                       11" ;
label variable ER34103       "RELATION TO HEAD                      11" ;
label variable ER34154       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   11" ;
label variable ER34155       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  11" ;
label variable ER34201       "2013 INTERVIEW NUMBER"                    ;
label variable ER34202       "SEQUENCE NUMBER                       13" ;
label variable ER34203       "RELATION TO HEAD                      13" ;
label variable ER34268       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   13" ;
label variable ER34269       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  13" ;
label variable ER34301       "2015 INTERVIEW NUMBER"                    ;
label variable ER34302       "SEQUENCE NUMBER                       15" ;
label variable ER34303       "RELATION TO HEAD                      15" ;
label variable ER34413       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   15" ;
label variable ER34414       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  15" ;
label variable ER34501       "2017 INTERVIEW NUMBER"                    ;
label variable ER34502       "SEQUENCE NUMBER                       17" ;
label variable ER34503       "RELATION TO REFERENCE PERSON          17" ;
label variable ER34650       "CORE/IMM INDIVIDUAL LONGITUDINAL WT   17" ;
label variable ER34651       "CORE/IMM INDIVIDUAL CROSS-SECTION WT  17" ;
