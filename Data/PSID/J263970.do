#delimit ;
*  PSID DATA CENTER *****************************************************
   JOBID            : 263970                            
   DATA_DOMAIN      : FAM                               
   USER_WHERE       : NULL                              
   FILE_TYPE        : NULL                              
   OUTPUT_DATA_TYPE : ASCII                             
   STATEMENTS       : do                                
   CODEBOOK_TYPE    : PDF                               
   N_OF_VARIABLES   : 96                                
   N_OF_OBSERVATIONS: 21689                             
   MAX_REC_LENGTH   : 221                               
   DATE & TIME      : September 5, 2019 @ 17:09:09
*************************************************************************
;

infix
      ER5001               1 - 1           ER5002               2 - 6           ER5005G              7 - 10    
      ER5006              11 - 12          ER5007              13 - 13          ER5008              14 - 15    
      ER6723              16 - 16          ER6728              17 - 17          ER10001             18 - 18    
      ER10002             19 - 23          ER10005G            24 - 27          ER10009             28 - 30    
      ER10010             31 - 31          ER10011             32 - 34          ER11723             35 - 35    
      ER11727             36 - 36          ER13001             37 - 37          ER13002             38 - 42    
      ER13010             43 - 45          ER13011             46 - 46          ER13012             47 - 49    
      ER13019             50 - 53          ER15447             54 - 54          ER15555             55 - 55    
      ER17001             56 - 56          ER17002             57 - 60          ER17013             61 - 63    
      ER17014             64 - 64          ER17015             65 - 67          ER17022             68 - 71    
      ER19612             72 - 72          ER19720             73 - 73          ER21001             74 - 74    
      ER21002             75 - 79          ER21009             80 - 83          ER21017             84 - 86    
      ER21018             87 - 87          ER21019             88 - 90          ER23009             91 - 91    
      ER23136             92 - 92          ER25001             93 - 93          ER25002             94 - 98    
      ER25009             99 - 102         ER25017            103 - 105         ER25018            106 - 106   
      ER25019            107 - 109         ER26990            110 - 110         ER27113            111 - 111   
      ER36001            112 - 112         ER36002            113 - 117         ER36009            118 - 121   
      ER36017            122 - 124         ER36018            125 - 125         ER36019            126 - 128   
      ER38202            129 - 129         ER39299            130 - 130         ER42001            131 - 131   
      ER42002            132 - 136         ER42009            137 - 140         ER42018            141 - 141   
      ER44175            142 - 142         ER45272            143 - 143         ER47301            144 - 144   
      ER47302            145 - 149         ER47309            150 - 153         ER47317            154 - 156   
      ER47318            157 - 157         ER47319            158 - 160         ER49494            161 - 161   
      ER50612            162 - 162         ER53001            163 - 163         ER53002            164 - 168   
      ER53009            169 - 172         ER53017            173 - 175         ER53018            176 - 176   
      ER53019            177 - 179         ER55244            180 - 180         ER56360            181 - 181   
      ER60001            182 - 182         ER60002            183 - 187         ER60009            188 - 191   
      ER60017            192 - 194         ER60018            195 - 195         ER60019            196 - 198   
      ER60020            199 - 199         ER62366            200 - 200         ER63482            201 - 201   
      ER66001            202 - 202         ER66002            203 - 207         ER66009            208 - 211   
      ER66017            212 - 214         ER66018            215 - 215         ER66019            216 - 218   
      ER66020            219 - 219         ER68420            220 - 220         ER69547            221 - 221   
using J263970.txt, clear 
;
label variable ER5001        "RELEASE NUMBER"                           ;
label variable ER5002        "1995 INTERVIEW #"                         ;
label variable ER5005G       "1968 FAMILY IDENTIFIER"                   ;
label variable ER5006        "AGE OF HEAD"                              ;
label variable ER5007        "SEX OF HEAD"                              ;
label variable ER5008        "AGE OF WIFE"                              ;
label variable ER6723        "H1 STATUS OF HEALTH-HEAD"                 ;
label variable ER6728        "H28 STATUS OF HLTH-WIFE"                  ;
label variable ER10001       "RELEASE NUMBER"                           ;
label variable ER10002       "1997 INTERVIEW #"                         ;
label variable ER10005G      "1997 FAMILY IDENTIFIER"                   ;
label variable ER10009       "AGE OF HEAD"                              ;
label variable ER10010       "SEX OF HEAD"                              ;
label variable ER10011       "AGE OF WIFE"                              ;
label variable ER11723       "H1 STATUS OF HEALTH-HEAD"                 ;
label variable ER11727       "H8 STATUS OF HEALTH-WIFE"                 ;
label variable ER13001       "RELEASE NUMBER"                           ;
label variable ER13002       "1999 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER13010       "AGE OF HEAD"                              ;
label variable ER13011       "SEX OF HEAD"                              ;
label variable ER13012       "AGE OF WIFE"                              ;
label variable ER13019       "1968 FAMILY IDENTIFIER"                   ;
label variable ER15447       "H1 STATUS OF HEALTH-HEAD"                 ;
label variable ER15555       "H25 STATUS OF HEALTH"                     ;
label variable ER17001       "RELEASE NUMBER"                           ;
label variable ER17002       "2001 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER17013       "AGE OF HEAD"                              ;
label variable ER17014       "SEX OF HEAD"                              ;
label variable ER17015       "AGE OF WIFE"                              ;
label variable ER17022       "1968 FAMILY IDENTIFIER"                   ;
label variable ER19612       "H1 STATUS OF HEALTH-HEAD"                 ;
label variable ER19720       "H25 STATUS OF HEALTH"                     ;
label variable ER21001       "RELEASE NUMBER"                           ;
label variable ER21002       "2003 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER21009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER21017       "AGE OF HEAD"                              ;
label variable ER21018       "SEX OF HEAD"                              ;
label variable ER21019       "AGE OF WIFE"                              ;
label variable ER23009       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER23136       "H25 HEALTH STATUS-WIFE"                   ;
label variable ER25001       "RELEASE NUMBER"                           ;
label variable ER25002       "2005 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER25009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER25017       "AGE OF HEAD"                              ;
label variable ER25018       "SEX OF HEAD"                              ;
label variable ER25019       "AGE OF WIFE"                              ;
label variable ER26990       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER27113       "H25 HEALTH STATUS-WIFE"                   ;
label variable ER36001       "RELEASE NUMBER"                           ;
label variable ER36002       "2007 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER36009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER36017       "AGE OF HEAD"                              ;
label variable ER36018       "SEX OF HEAD"                              ;
label variable ER36019       "AGE OF WIFE"                              ;
label variable ER38202       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER39299       "H1 HEALTH STATUS-WIFE"                    ;
label variable ER42001       "RELEASE NUMBER"                           ;
label variable ER42002       "2009 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER42009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER42018       "SEX OF HEAD"                              ;
label variable ER44175       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER45272       "H1 HEALTH STATUS-WIFE"                    ;
label variable ER47301       "RELEASE NUMBER"                           ;
label variable ER47302       "2011 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER47309       "1968 FAMILY IDENTIFIER"                   ;
label variable ER47317       "AGE OF HEAD"                              ;
label variable ER47318       "SEX OF HEAD"                              ;
label variable ER47319       "AGE OF WIFE"                              ;
label variable ER49494       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER50612       "H1 HEALTH STATUS-WIFE"                    ;
label variable ER53001       "RELEASE NUMBER"                           ;
label variable ER53002       "2013 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER53009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER53017       "AGE OF HEAD"                              ;
label variable ER53018       "SEX OF HEAD"                              ;
label variable ER53019       "AGE OF WIFE"                              ;
label variable ER55244       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER56360       "H1 HEALTH STATUS-WIFE"                    ;
label variable ER60001       "RELEASE NUMBER"                           ;
label variable ER60002       "2015 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER60009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER60017       "AGE OF HEAD"                              ;
label variable ER60018       "SEX OF HEAD"                              ;
label variable ER60019       "AGE OF SPOUSE"                            ;
label variable ER60020       "SEX OF SPOUSE"                            ;
label variable ER62366       "H1 HEALTH STATUS-HEAD"                    ;
label variable ER63482       "H1 HEALTH STATUS-SPOUSE"                  ;
label variable ER66001       "RELEASE NUMBER"                           ;
label variable ER66002       "2017 FAMILY INTERVIEW (ID) NUMBER"        ;
label variable ER66009       "1968 FAMILY IDENTIFIER"                   ;
label variable ER66017       "AGE OF REFERENCE PERSON"                  ;
label variable ER66018       "SEX OF REFERENCE PERSON"                  ;
label variable ER66019       "AGE OF SPOUSE"                            ;
label variable ER66020       "SEX OF SPOUSE"                            ;
label variable ER68420       "H1 HEALTH STATUS-RP"                      ;
label variable ER69547       "H1 HEALTH STATUS-SPOUSE"                  ;
