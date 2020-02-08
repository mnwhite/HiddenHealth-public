/************************************************************************************************/
/* Stata User File for H138 Data                                                                */
/*                                                                                              */
/* This file contains information and a sample Stata program to create a permanent              */
/* Stata dataset for users who want to use Stata in processing the MEPS data provided           */
/* in this PUF release.  Stata (StataCorp) has the capability to produce                        */
/* appropriate standard errors for estimates from a survey with a complex sample                */
/* design such as the Medical Expenditure Panel Survey (MEPS).                                  */
/* The input file for creating a permanent Stata dataset is the ASCII data file                 */
/* (H138.DAT) supplied in this PUF release, which in turn can be extracted from the             */
/* .EXE file. After entering the Stata interactive environment access the Stata DO-File         */
/* editor by clicking on the appropriate icon in the command line at the top of the             */
/* screen.  Copy and paste the following Stata commands into the editor and save as a           */
/* DO file.  A DO file is a Stata program which may then be executed using the DO command.      */
/* For example, if the DO file is named H138.DO and is located in the directory                 */
/* C:\MEPS\PROG, then the file may be executed by typing the following command into             */
/* the Stata command line:                                                                      */
/*                         do C:\MEPS\PROG\H138.DO                                              */
/* The program below will output the Stata dataset H138.DTA                                     */
/************************************************************************************************/


#delimit ;
* log using H138.log, replace;
clear;

* INPUT ALL VARIABLES;
infix
         DUID         1-   5
         PID          6-   8
  str    DUPERSID     9-  16
         PANEL       17-  18
  str    FAMID31     19-  20
  str    FAMID42     21-  22
  str    FAMID53     23-  24
  str    FAMID10     25-  26
  str    FAMIDYR     27-  28
  str    CPSFAMID    29-  30
         FCSZ1231    31-  32
         FCRP1231    33-  34
  str    RULETR31    35-  36
  str    RULETR42    37-  38
  str    RULETR53    39-  40
  str    RULETR10    41-  42
         RUSIZE31    43-  44
         RUSIZE42    45-  46
         RUSIZE53    47-  48
         RUSIZE10    49-  50
         RUCLAS31    51-  52
         RUCLAS42    53-  54
         RUCLAS53    55-  56
         RUCLAS10    57-  57
         FAMSZE31    58-  59
         FAMSZE42    60-  61
         FAMSZE53    62-  63
         FAMSZE10    64-  65
         FMRS1231    66-  67
         FAMS1231    68-  69
         FAMSZEYR    70-  71
         FAMRFPYR    72-  72
         REGION31    73-  74
         REGION42    75-  76
         REGION53    77-  78
         REGION10    79-  80
         MSA31       81-  82
         MSA42       83-  84
         MSA53       85-  86
         MSA10       87-  88
         REFPRS31    89-  91
         REFPRS42    92-  94
         REFPRS53    95-  97
         REFPRS10    98- 100
         RESP31     101- 101
         RESP42     102- 102
         RESP53     103- 103
         RESP10     104- 104
         PROXY31    105- 106
         PROXY42    107- 108
         PROXY53    109- 110
         PROXY10    111- 111
         INTVLANG   112- 113
         BEGRFD31   114- 115
         BEGRFM31   116- 117
         BEGRFY31   118- 121
         ENDRFD31   122- 123
         ENDRFM31   124- 125
         ENDRFY31   126- 129
         BEGRFD42   130- 131
         BEGRFM42   132- 133
         BEGRFY42   134- 137
         ENDRFD42   138- 139
         ENDRFM42   140- 141
         ENDRFY42   142- 145
         BEGRFD53   146- 147
         BEGRFM53   148- 149
         BEGRFY53   150- 153
         ENDRFD53   154- 155
         ENDRFM53   156- 157
         ENDRFY53   158- 161
         ENDRFD10   162- 163
         ENDRFM10   164- 165
         ENDRFY10   166- 169
         KEYNESS    170- 170
         INSCOP31   171- 171
         INSCOP42   172- 172
         INSCOP53   173- 173
         INSCOP10   174- 174
         INSC1231   175- 175
         INSCOPE    176- 176
         ELGRND31   177- 177
         ELGRND42   178- 178
         ELGRND53   179- 179
         ELGRND10   180- 180
         PSTATS31   181- 182
         PSTATS42   183- 184
         PSTATS53   185- 186
  str    RURSLT31   187- 188
  str    RURSLT42   189- 190
  str    RURSLT53   191- 192
         AGE31X     193- 194
         AGE42X     195- 196
         AGE53X     197- 198
         AGE10X     199- 200
         AGELAST    201- 202
         DOBMM      203- 204
         DOBYY      205- 208
         SEX        209- 209
         RACEX      210- 210
         RACEAX     211- 211
         RACEBX     212- 212
         RACEWX     213- 213
         RACETHNX   214- 214
         HISPANX    215- 215
         HISPCAT    216- 217
         MARRY31X   218- 219
         MARRY42X   220- 221
         MARRY53X   222- 223
         MARRY10X   224- 225
         SPOUID31   226- 228
         SPOUID42   229- 231
         SPOUID53   232- 234
         SPOUID10   235- 237
         SPOUIN31   238- 239
         SPOUIN42   240- 241
         SPOUIN53   242- 243
         SPOUIN10   244- 245
         EDUCYR     246- 247
         HIDEG      248- 249
         FTSTU31X   250- 251
         FTSTU42X   252- 253
         FTSTU53X   254- 255
         FTSTU10X   256- 257
         ACTDTY31   258- 259
         ACTDTY42   260- 261
         ACTDTY53   262- 263
         HONRDC31   264- 265
         HONRDC42   266- 267
         HONRDC53   268- 269
         RFREL31X   270- 271
         RFREL42X   272- 273
         RFREL53X   274- 275
         RFREL10X   276- 277
         MOPID31X   278- 280
         MOPID42X   281- 283
         MOPID53X   284- 286
         DAPID31X   287- 289
         DAPID42X   290- 292
         DAPID53X   293- 295
         RTHLTH31   296- 297
         RTHLTH42   298- 299
         RTHLTH53   300- 301
         MNHLTH31   302- 303
         MNHLTH42   304- 305
         MNHLTH53   306- 307
         HIBPDX     308- 309
         HIBPAGED   310- 311
         BPMLDX     312- 313
         CHDDX      314- 315
         CHDAGED    316- 317
         ANGIDX     318- 319
         ANGIAGED   320- 321
         MIDX       322- 323
         MIAGED     324- 325
         OHRTDX     326- 327
         OHRTAGED   328- 329
         STRKDX     330- 331
         STRKAGED   332- 333
         EMPHDX     334- 335
         EMPHAGED   336- 337
         CHBRON31   338- 339
         CHBRON53   340- 341
         CHOLDX     342- 343
         CHOLAGED   344- 345
         CANCERDX   346- 347
         CABLADDR   348- 349
         BLDRAGED   350- 351
         BLDRREMS   352- 353
         CABONE     354- 355
         BONEAGED   356- 357
         BONEREMS   358- 359
         CABRAIN    360- 361
         BRAIAGED   362- 363
         BRAIREMS   364- 365
         CABREAST   366- 367
         BRSTAGED   368- 369
         BRSTREMS   370- 371
         CACERVIX   372- 373
         CERVAGED   374- 375
         CERVREMS   376- 377
         CACOLON    378- 379
         COLOAGED   380- 381
         COLOREMS   382- 383
         CAESOPH    384- 385
         ESPHAGED   386- 387
         ESPHREMS   388- 389
         CAKIDNEY   390- 391
         KIDNAGED   392- 393
         KIDNREMS   394- 395
         CALARYNX   396- 397
         LRNXAGED   398- 399
         LRNXREMS   400- 401
         CALEUKEM   402- 403
         LEUKAGED   404- 405
         LEUKREMS   406- 407
         CALIVER    408- 409
         LIVRAGED   410- 411
         LIVRREMS   412- 413
         CALUNG     414- 415
         LUNGAGED   416- 417
         LUNGREMS   418- 419
         CALYMPH    420- 421
         LYMPAGED   422- 423
         LYMPREMS   424- 425
         CAMELANO   426- 427
         MELAAGED   428- 429
         MELAREMS   430- 431
         CAMOUTH    432- 433
         MOUTAGED   434- 435
         MOUTREMS   436- 437
         CAMUSCLE   438- 439
         MUSCAGED   440- 441
         MUSCREMS   442- 443
         CAOTHER    444- 445
         OTHRAGED   446- 447
         OTHRREMS   448- 449
         CAOVARY    450- 451
         OVRYAGED   452- 453
         OVRYREMS   454- 455
         CAPANCRS   456- 457
         PANCAGED   458- 459
         PANCREMS   460- 461
         CAPROSTA   462- 463
         PRSTAGED   464- 465
         PRSTREMS   466- 467
         CARECTUM   468- 469
         RECTAGED   470- 471
         RECTREMS   472- 473
         CASKINNM   474- 475
         SKNMAGED   476- 477
         SKNMREMS   478- 479
         CASKINDK   480- 481
         SKDKAGED   482- 483
         SKDKREMS   484- 485
         CASTOMCH   486- 487
         STOMAGED   488- 489
         STOMREMS   490- 491
         CATESTIS   492- 493
         TSTSAGED   494- 495
         TSTSREMS   496- 497
         CATHROAT   498- 499
         THRTAGED   500- 501
         THRTREMS   502- 503
         CATHYROD   504- 505
         THYRAGED   506- 507
         THYRREMS   508- 509
         CAUTERUS   510- 511
         UTERAGED   512- 513
         UTERREMS   514- 515
         DIABDX     516- 517
         DIABAGED   518- 519
         JTPAIN31   520- 521
         JTPAIN53   522- 523
         ARTHDX     524- 525
         ARTHTYPE   526- 527
         ARTHAGED   528- 529
         ASTHDX     530- 531
         ASTHAGED   532- 533
         ASSTIL31   534- 535
         ASSTIL53   536- 537
         ASATAK31   538- 539
         ASATAK53   540- 541
         ASTHEP31   542- 543
         ASTHEP53   544- 545
         ASACUT53   546- 547
         ASMRCN53   548- 549
         ASPREV53   550- 551
         ASDALY53   552- 553
         ASPKFL53   554- 555
         ASEVFL53   556- 557
         ASWNFL53   558- 559
         ADHDADDX   560- 561
         ADHDAGED   562- 563
         PREGNT31   564- 565
         PREGNT42   566- 567
         PREGNT53   568- 569
         IADLHP31   570- 571
         IADLHP42   572- 573
         IADLHP53   574- 575
         IADL3M31   576- 577
         IADL3M42   578- 579
         IADL3M53   580- 581
         ADLHLP31   582- 583
         ADLHLP42   584- 585
         ADLHLP53   586- 587
         ADL3MO31   588- 589
         ADL3MO42   590- 591
         ADL3MO53   592- 593
         AIDHLP31   594- 595
         AIDHLP53   596- 597
         WLKLIM31   598- 599
         WLKLIM53   600- 601
         LFTDIF31   602- 603
         LFTDIF53   604- 605
         STPDIF31   606- 607
         STPDIF53   608- 609
         WLKDIF31   610- 611
         WLKDIF53   612- 613
         MILDIF31   614- 615
         MILDIF53   616- 617
         STNDIF31   618- 619
         STNDIF53   620- 621
         BENDIF31   622- 623
         BENDIF53   624- 625
         RCHDIF31   626- 627
         RCHDIF53   628- 629
         FNGRDF31   630- 631
         FNGRDF53   632- 633
         WLK3MO31   634- 635
         WLK3MO53   636- 637
         ACTLIM31   638- 639
         ACTLIM53   640- 641
         WRKLIM31   642- 643
         WRKLIM53   644- 645
         HSELIM31   646- 647
         HSELIM53   648- 649
         SCHLIM31   650- 651
         SCHLIM53   652- 653
         UNABLE31   654- 655
         UNABLE53   656- 657
         SOCLIM31   658- 659
         SOCLIM53   660- 661
         COGLIM31   662- 663
         COGLIM53   664- 665
         WRGLAS42   666- 667
         SEEDIF42   668- 669
         BLIND42    670- 671
         READNW42   672- 673
         RECPEP42   674- 675
         VISION42   676- 677
         HEARAD42   678- 679
         HEARDI42   680- 681
         DEAF42     682- 683
         HEARMO42   684- 685
         HEARSM42   686- 687
         HEARNG42   688- 689
         ANYLIM10   690- 691
         LSHLTH42   692- 693
         NEVILL42   694- 695
         SICEAS42   696- 697
         HLTHLF42   698- 699
         WRHLTH42   700- 701
         CHPMED42   702- 703
         CHPMHB42   704- 705
         CHPMCN42   706- 707
         CHSERV42   708- 709
         CHSRHB42   710- 711
         CHSRCN42   712- 713
         CHLIMI42   714- 715
         CHLIHB42   716- 717
         CHLICO42   718- 719
         CHTHER42   720- 721
         CHTHHB42   722- 723
         CHTHCO42   724- 725
         CHCOUN42   726- 727
         CHEMPB42   728- 729
         CSHCN42    730- 731
         MOMPRO42   732- 733
         DADPRO42   734- 735
         UNHAP42    736- 737
         SCHLBH42   738- 739
         HAVFUN42   740- 741
         ADUPRO42   742- 743
         NERVAF42   744- 745
         SIBPRO42   746- 747
         KIDPRO42   748- 749
         SPRPRO42   750- 751
         SCHPRO42   752- 753
         HOMEBH42   754- 755
         TRBLE42    756- 757
         CHILCR42   758- 759
         CHILWW42   760- 761
         CHRTCR42   762- 763
         CHRTWW42   764- 765
         CHAPPT42   766- 767
         CHNDCR42   768- 769
         CHENEC42   770- 771
         CHLIST42   772- 773
         CHEXPL42   774- 775
         CHRESP42   776- 777
         CHPRTM42   778- 779
         CHHECR42   780- 781
         CHSPEC42   782- 783
         CHEYRE42   784- 785
         MESHGT42   786- 787
         WHNHGT42   788- 789
         MESWGT42   790- 791
         WHNWGT42   792- 793
  double CHBMIX42   794- 798
         MESVIS42   799- 800
         MESBPR42   801- 802
         WHNBPR42   803- 804
         DENTAL42   805- 806
         WHNDEN42   807- 808
         EATHLT42   809- 810
         WHNEAT42   811- 812
         PHYSCL42   813- 814
         WHNPHY42   815- 816
         SAFEST42   817- 818
         WHNSAF42   819- 820
         BOOST42    821- 822
         WHNBST42   823- 824
         LAPBLT42   825- 826
         WHNLAP42   827- 828
         HELMET42   829- 830
         WHNHEL42   831- 832
         NOSMOK42   833- 834
         WHNSMK42   835- 836
         TIMALN42   837- 838
         DENTCK53   839- 840
         BPCHEK53   841- 842
         BPMONT53   843- 844
         CHOLCK53   845- 846
         CHECK53    847- 848
         NOFAT53    849- 850
         EXRCIS53   851- 852
         FLUSHT53   853- 854
         ASPRIN53   855- 856
         NOASPR53   857- 858
         STOMCH53   859- 860
         LSTETH53   861- 862
         PSA53      863- 864
         HYSTER53   865- 866
         PAPSMR53   867- 868
         BRSTEX53   869- 870
         MAMOGR53   871- 872
         BSTST53    873- 874
         BSTSRE53   875- 876
         CLNTST53   877- 878
         CLNTRE53   879- 880
         SGMTST53   881- 882
         SGMTRE53   883- 884
         PHYACT53   885- 886
  double BMINDX53   887- 890
         SEATBE53   891- 892
         SAQELIG    893- 893
         ADPRX42    894- 896
         ADILCR42   897- 898
         ADILWW42   899- 900
         ADRTCR42   901- 902
         ADRTWW42   903- 904
         ADAPPT42   905- 906
         ADNDCR42   907- 908
         ADEGMC42   909- 910
         ADLIST42   911- 912
         ADEXPL42   913- 914
         ADRESP42   915- 916
         ADPRTM42   917- 918
         ADHECR42   919- 920
         ADSMOK42   921- 922
         ADNSMK42   923- 924
         ADDRBP42   925- 926
         ADSPEC42   927- 928
         ADSPRF42   929- 930
         ADGENH42   931- 932
         ADDAYA42   933- 934
         ADCLIM42   935- 936
         ADPALS42   937- 938
         ADPWLM42   939- 940
         ADMALS42   941- 942
         ADMWLM42   943- 944
         ADPAIN42   945- 946
         ADCAPE42   947- 948
         ADNRGY42   949- 950
         ADDOWN42   951- 952
         ADSOCA42   953- 954
  double PCS42      955- 959
  double MCS42      960- 964
         SFFLAG42   965- 966
         ADNERV42   967- 968
         ADHOPE42   969- 970
         ADREST42   971- 972
         ADSAD42    973- 974
         ADEFRT42   975- 976
         ADWRTH42   977- 978
         K6SUM42    979- 980
         ADINTR42   981- 982
         ADDPRS42   983- 984
         PHQ242     985- 986
         ADINSA42   987- 988
         ADINSB42   989- 990
         ADRISK42   991- 992
         ADOVER42   993- 994
         ADCMPM42   995- 996
         ADCMPD42   997- 998
         ADCMPY42   999-1002
         ADLANG42  1003-1004
         DSDIA53   1005-1006
         DSA1C53   1007-1008
         DSFT1153  1009-1010
         DSFT1053  1011-1012
         DSFT0953  1013-1014
         DSFB0953  1015-1016
         DSFTNV53  1017-1018
         DSEY1153  1019-1020
         DSEY1053  1021-1022
         DSEY0953  1023-1024
         DSEB0953  1025-1026
         DSEYNV53  1027-1028
         DSCH1153  1029-1030
         DSCH1053  1031-1032
         DSCH0953  1033-1034
         DSCB0953  1035-1036
         DSCHNV53  1037-1038
         DSFL1153  1039-1040
         DSFL1053  1041-1042
         DSFL0953  1043-1044
         DSVB0953  1045-1046
         DSFLNV53  1047-1048
         DSKIDN53  1049-1050
         DSEYPR53  1051-1052
         DSDIET53  1053-1054
         DSMED53   1055-1056
         DSINSU53  1057-1058
         DSCPCP53  1059-1060
         DSCNPC53  1061-1062
         DSCPHN53  1063-1064
         DSCINT53  1065-1066
         DSCGRP53  1067-1068
         DSCONF53  1069-1070
         DSPRX53   1071-1072
         DDNWRK31  1073-1075
         DDNWRK42  1076-1078
         DDNWRK53  1079-1081
         WKINBD31  1082-1084
         WKINBD42  1085-1087
         WKINBD53  1088-1090
         DDNSCL31  1091-1092
         DDNSCL42  1093-1095
         DDNSCL53  1096-1098
         SCLNBD31  1099-1100
         SCLNBD42  1101-1102
         SCLNBD53  1103-1104
         DDBDYS31  1105-1107
         DDBDYS42  1108-1110
         DDBDYS53  1111-1113
         OTHDYS31  1114-1115
         OTHDYS42  1116-1117
         OTHDYS53  1118-1119
         OTHNDD31  1120-1121
         OTHNDD42  1122-1124
         OTHNDD53  1125-1126
         ACCELI42  1127-1128
         LANGHM42  1129-1130
         ENGCMF42  1131-1132
         ENGSPK42  1133-1134
         USBORN42  1135-1136
         USLIVE42  1137-1138
         HAVEUS42  1139-1140
         YNOUSC42  1141-1142
         NOREAS42  1143-1144
         SELDSI42  1145-1146
         NEWARE42  1147-1148
         DKWHRU42  1149-1150
         USCNOT42  1151-1152
         PERSLA42  1153-1154
         DIFFPL42  1155-1156
         INSRPL42  1157-1158
         MYSELF42  1159-1160
         CARECO42  1161-1162
         NOHINS42  1163-1164
         OTHINS42  1165-1166
         JOBRSN42  1167-1168
         NEWDOC42  1169-1170
         DOCELS42  1171-1172
         NOLIKE42  1173-1174
         KNOWDR42  1175-1176
         ONJOB42   1177-1178
         NOGODR42  1179-1180
         TRANS42   1181-1182
         CLINIC42  1183-1184
         OTHREA42  1185-1186
         PROVTY42  1187-1188
         PLCTYP42  1189-1190
         GOTOUS42  1191-1192
         TMTKUS42  1193-1194
         DFTOUS42  1195-1196
         TYPEPE42  1197-1198
         LOCATN42  1199-1200
         HSPLAP42  1201-1202
         WHITPR42  1203-1204
         BLCKPR42  1205-1206
         ASIANP42  1207-1208
         NATAMP42  1209-1210
         PACISP42  1211-1212
         OTHRCP42  1213-1214
         GENDRP42  1215-1216
         MINORP42  1217-1218
         PREVEN42  1219-1220
         REFFRL42  1221-1222
         ONGONG42  1223-1224
         PHNREG42  1225-1226
         OFFHOU42  1227-1228
         AFTHOU42  1229-1230
         TREATM42  1231-1232
         RESPCT42  1233-1234
         DECIDE42  1235-1236
         EXPLOP42  1237-1238
         LANGPR42  1239-1240
         MDUNAB42  1241-1242
         MDUNRS42  1243-1244
         MDUNPR42  1245-1246
         MDDLAY42  1247-1248
         MDDLRS42  1249-1250
         MDDLPR42  1251-1252
         DNUNAB42  1253-1254
         DNUNRS42  1255-1256
         DNUNPR42  1257-1258
         DNDLAY42  1259-1260
         DNDLRS42  1261-1262
         DNDLPR42  1263-1264
         PMUNAB42  1265-1266
         PMUNRS42  1267-1268
         PMUNPR42  1269-1270
         PMDLAY42  1271-1272
         PMDLRS42  1273-1274
         PMDLPR42  1275-1276
         EMPST31   1277-1278
         EMPST42   1279-1280
         EMPST53   1281-1282
         RNDFLG31  1283-1284
         MORJOB31  1285-1286
         MORJOB42  1287-1288
         MORJOB53  1289-1290
         EVRWRK    1291-1292
  double HRWG31X   1293-1298
  double HRWG42X   1299-1304
  double HRWG53X   1305-1310
         HRWGIM31  1311-1311
         HRWGIM42  1312-1312
         HRWGIM53  1313-1313
         HRHOW31   1314-1315
         HRHOW42   1316-1317
         HRHOW53   1318-1319
         DIFFWG31  1320-1321
         DIFFWG42  1322-1323
         DIFFWG53  1324-1325
  double NHRWG31   1326-1331
  double NHRWG42   1332-1337
  double NHRWG53   1338-1343
         HOUR31    1344-1346
         HOUR42    1347-1349
         HOUR53    1350-1352
         TEMPJB31  1353-1354
         TEMPJB42  1355-1356
         TEMPJB53  1357-1358
         SSNLJB31  1359-1360
         SSNLJB42  1361-1362
         SSNLJB53  1363-1364
         SELFCM31  1365-1366
         SELFCM42  1367-1368
         SELFCM53  1369-1370
         DISVW31X  1371-1372
         DISVW42X  1373-1374
         DISVW53X  1375-1376
         CHOIC31   1377-1378
         CHOIC42   1379-1380
         CHOIC53   1381-1382
         INDCAT31  1383-1384
         INDCAT42  1385-1386
         INDCAT53  1387-1388
         NUMEMP31  1389-1391
         NUMEMP42  1392-1394
         NUMEMP53  1395-1397
         MORE31    1398-1399
         MORE42    1400-1401
         MORE53    1402-1403
         UNION31   1404-1405
         UNION42   1406-1407
         UNION53   1408-1409
         NWK31     1410-1411
         NWK42     1412-1413
         NWK53     1414-1415
         CHGJ3142  1416-1417
         CHGJ4253  1418-1419
         YCHJ3142  1420-1421
         YCHJ4253  1422-1423
         STJBMM31  1424-1425
         STJBDD31  1426-1427
         STJBYY31  1428-1431
         STJBMM42  1432-1433
         STJBDD42  1434-1435
         STJBYY42  1436-1439
         STJBMM53  1440-1441
         STJBDD53  1442-1443
         STJBYY53  1444-1447
         EVRETIRE  1448-1449
         OCCCAT31  1450-1451
         OCCCAT42  1452-1453
         OCCCAT53  1454-1455
         PAYVAC31  1456-1457
         PAYVAC42  1458-1459
         PAYVAC53  1460-1461
         SICPAY31  1462-1463
         SICPAY42  1464-1465
         SICPAY53  1466-1467
         PAYDR31   1468-1469
         PAYDR42   1470-1471
         PAYDR53   1472-1473
         RETPLN31  1474-1475
         RETPLN42  1476-1477
         RETPLN53  1478-1479
         BSNTY31   1480-1481
         BSNTY42   1482-1483
         BSNTY53   1484-1485
         JOBORG31  1486-1487
         JOBORG42  1488-1489
         JOBORG53  1490-1491
         HELD31X   1492-1493
         HELD42X   1494-1495
         HELD53X   1496-1497
         OFFER31X  1498-1499
         OFFER42X  1500-1501
         OFFER53X  1502-1503
         OFREMP31  1504-1505
         OFREMP42  1506-1507
         OFREMP53  1508-1509
         YNOINS31  1510-1511
         YNOINS42  1512-1513
         YNOINS53  1514-1515
         SSIDIS10  1516-1517
         AFDC10    1518-1519
         FILEDR10  1520-1521
         WILFIL10  1522-1523
         FLSTAT10  1524-1525
         FILER10   1526-1527
         JTINRU10  1528-1529
         JNTPID10  1530-1532
         CLMDEP10  1533-1534
         DEPDNT10  1535-1536
         DPINRU10  1537-1538
         DPOTSD10  1539-1540
         TAXFRM10  1541-1542
         DEDUCT10  1543-1544
         TOTDED10  1545-1550
         CLMHIP10  1551-1552
         EICRDT10  1553-1554
         FOODST10  1555-1556
         FOODMN10  1557-1558
         FOODVL10  1559-1562
         TTLP10X   1563-1568
         FAMINC10  1569-1574
         POVCAT10  1575-1575
  double POVLEV10  1576-1586
         WAGEP10X  1587-1592
         WAGIMP10  1593-1593
         BUSNP10X  1594-1599
         BUSIMP10  1600-1600
         UNEMP10X  1601-1605
         UNEIMP10  1606-1606
         WCMPP10X  1607-1611
         WCPIMP10  1612-1612
         INTRP10X  1613-1618
         INTIMP10  1619-1619
         DIVDP10X  1620-1624
         DIVIMP10  1625-1625
         SALEP10X  1626-1632
         SALIMP10  1633-1633
         PENSP10X  1634-1638
         PENIMP10  1639-1639
         SSECP10X  1640-1644
         SSCIMP10  1645-1645
         TRSTP10X  1646-1651
         TRTIMP10  1652-1652
         VETSP10X  1653-1657
         VETIMP10  1658-1658
         IRASP10X  1659-1663
         IRAIMP10  1664-1664
         REFDP10X  1665-1669
         REFIMP10  1670-1670
         ALIMP10X  1671-1675
         ALIIMP10  1676-1676
         CHLDP10X  1677-1682
         CHLIMP10  1683-1683
         CASHP10X  1684-1688
         CSHIMP10  1689-1689
         SSIP10X   1690-1694
         SSIIMP10  1695-1695
         PUBP10X   1696-1700
         PUBIMP10  1701-1701
         OTHRP10X  1702-1707
         OTHIMP10  1708-1708
  str    HIEUIDX   1709-1715
         TRIJA10X  1716-1717
         TRIFE10X  1718-1719
         TRIMA10X  1720-1721
         TRIAP10X  1722-1723
         TRIMY10X  1724-1725
         TRIJU10X  1726-1727
         TRIJL10X  1728-1729
         TRIAU10X  1730-1731
         TRISE10X  1732-1733
         TRIOC10X  1734-1735
         TRINO10X  1736-1737
         TRIDE10X  1738-1739
         MCRJA10   1740-1741
         MCRFE10   1742-1743
         MCRMA10   1744-1745
         MCRAP10   1746-1747
         MCRMY10   1748-1749
         MCRJU10   1750-1751
         MCRJL10   1752-1753
         MCRAU10   1754-1755
         MCRSE10   1756-1757
         MCROC10   1758-1759
         MCRNO10   1760-1761
         MCRDE10   1762-1763
         MCRJA10X  1764-1765
         MCRFE10X  1766-1767
         MCRMA10X  1768-1769
         MCRAP10X  1770-1771
         MCRMY10X  1772-1773
         MCRJU10X  1774-1775
         MCRJL10X  1776-1777
         MCRAU10X  1778-1779
         MCRSE10X  1780-1781
         MCROC10X  1782-1783
         MCRNO10X  1784-1785
         MCRDE10X  1786-1787
         MCDJA10   1788-1789
         MCDFE10   1790-1791
         MCDMA10   1792-1793
         MCDAP10   1794-1795
         MCDMY10   1796-1797
         MCDJU10   1798-1799
         MCDJL10   1800-1801
         MCDAU10   1802-1803
         MCDSE10   1804-1805
         MCDOC10   1806-1807
         MCDNO10   1808-1809
         MCDDE10   1810-1811
         MCDJA10X  1812-1813
         MCDFE10X  1814-1815
         MCDMA10X  1816-1817
         MCDAP10X  1818-1819
         MCDMY10X  1820-1821
         MCDJU10X  1822-1823
         MCDJL10X  1824-1825
         MCDAU10X  1826-1827
         MCDSE10X  1828-1829
         MCDOC10X  1830-1831
         MCDNO10X  1832-1833
         MCDDE10X  1834-1835
         OPAJA10   1836-1837
         OPAFE10   1838-1839
         OPAMA10   1840-1841
         OPAAP10   1842-1843
         OPAMY10   1844-1845
         OPAJU10   1846-1847
         OPAJL10   1848-1849
         OPAAU10   1850-1851
         OPASE10   1852-1853
         OPAOC10   1854-1855
         OPANO10   1856-1857
         OPADE10   1858-1859
         OPBJA10   1860-1861
         OPBFE10   1862-1863
         OPBMA10   1864-1865
         OPBAP10   1866-1867
         OPBMY10   1868-1869
         OPBJU10   1870-1871
         OPBJL10   1872-1873
         OPBAU10   1874-1875
         OPBSE10   1876-1877
         OPBOC10   1878-1879
         OPBNO10   1880-1881
         OPBDE10   1882-1883
         STAJA10   1884-1885
         STAFE10   1886-1887
         STAMA10   1888-1889
         STAAP10   1890-1891
         STAMY10   1892-1893
         STAJU10   1894-1895
         STAJL10   1896-1897
         STAAU10   1898-1899
         STASE10   1900-1901
         STAOC10   1902-1903
         STANO10   1904-1905
         STADE10   1906-1907
         PUBJA10X  1908-1909
         PUBFE10X  1910-1911
         PUBMA10X  1912-1913
         PUBAP10X  1914-1915
         PUBMY10X  1916-1917
         PUBJU10X  1918-1919
         PUBJL10X  1920-1921
         PUBAU10X  1922-1923
         PUBSE10X  1924-1925
         PUBOC10X  1926-1927
         PUBNO10X  1928-1929
         PUBDE10X  1930-1931
         PEGJA10   1932-1933
         PEGFE10   1934-1935
         PEGMA10   1936-1937
         PEGAP10   1938-1939
         PEGMY10   1940-1941
         PEGJU10   1942-1943
         PEGJL10   1944-1945
         PEGAU10   1946-1947
         PEGSE10   1948-1949
         PEGOC10   1950-1951
         PEGNO10   1952-1953
         PEGDE10   1954-1955
         PDKJA10   1956-1957
         PDKFE10   1958-1959
         PDKMA10   1960-1961
         PDKAP10   1962-1963
         PDKMY10   1964-1965
         PDKJU10   1966-1967
         PDKJL10   1968-1969
         PDKAU10   1970-1971
         PDKSE10   1972-1973
         PDKOC10   1974-1975
         PDKNO10   1976-1977
         PDKDE10   1978-1979
         PNGJA10   1980-1981
         PNGFE10   1982-1983
         PNGMA10   1984-1985
         PNGAP10   1986-1987
         PNGMY10   1988-1989
         PNGJU10   1990-1991
         PNGJL10   1992-1993
         PNGAU10   1994-1995
         PNGSE10   1996-1997
         PNGOC10   1998-1999
         PNGNO10   2000-2001
         PNGDE10   2002-2003
         POGJA10   2004-2005
         POGFE10   2006-2007
         POGMA10   2008-2009
         POGAP10   2010-2011
         POGMY10   2012-2013
         POGJU10   2014-2015
         POGJL10   2016-2017
         POGAU10   2018-2019
         POGSE10   2020-2021
         POGOC10   2022-2023
         POGNO10   2024-2025
         POGDE10   2026-2027
         PRSJA10   2028-2029
         PRSFE10   2030-2031
         PRSMA10   2032-2033
         PRSAP10   2034-2035
         PRSMY10   2036-2037
         PRSJU10   2038-2039
         PRSJL10   2040-2041
         PRSAU10   2042-2043
         PRSSE10   2044-2045
         PRSOC10   2046-2047
         PRSNO10   2048-2049
         PRSDE10   2050-2051
         POUJA10   2052-2053
         POUFE10   2054-2055
         POUMA10   2056-2057
         POUAP10   2058-2059
         POUMY10   2060-2061
         POUJU10   2062-2063
         POUJL10   2064-2065
         POUAU10   2066-2067
         POUSE10   2068-2069
         POUOC10   2070-2071
         POUNO10   2072-2073
         POUDE10   2074-2075
         PRIJA10   2076-2077
         PRIFE10   2078-2079
         PRIMA10   2080-2081
         PRIAP10   2082-2083
         PRIMY10   2084-2085
         PRIJU10   2086-2087
         PRIJL10   2088-2089
         PRIAU10   2090-2091
         PRISE10   2092-2093
         PRIOC10   2094-2095
         PRINO10   2096-2097
         PRIDE10   2098-2099
         HPEJA10   2100-2101
         HPEFE10   2102-2103
         HPEMA10   2104-2105
         HPEAP10   2106-2107
         HPEMY10   2108-2109
         HPEJU10   2110-2111
         HPEJL10   2112-2113
         HPEAU10   2114-2115
         HPESE10   2116-2117
         HPEOC10   2118-2119
         HPENO10   2120-2121
         HPEDE10   2122-2123
         HPDJA10   2124-2125
         HPDFE10   2126-2127
         HPDMA10   2128-2129
         HPDAP10   2130-2131
         HPDMY10   2132-2133
         HPDJU10   2134-2135
         HPDJL10   2136-2137
         HPDAU10   2138-2139
         HPDSE10   2140-2141
         HPDOC10   2142-2143
         HPDNO10   2144-2145
         HPDDE10   2146-2147
         HPNJA10   2148-2149
         HPNFE10   2150-2151
         HPNMA10   2152-2153
         HPNAP10   2154-2155
         HPNMY10   2156-2157
         HPNJU10   2158-2159
         HPNJL10   2160-2161
         HPNAU10   2162-2163
         HPNSE10   2164-2165
         HPNOC10   2166-2167
         HPNNO10   2168-2169
         HPNDE10   2170-2171
         HPOJA10   2172-2173
         HPOFE10   2174-2175
         HPOMA10   2176-2177
         HPOAP10   2178-2179
         HPOMY10   2180-2181
         HPOJU10   2182-2183
         HPOJL10   2184-2185
         HPOAU10   2186-2187
         HPOSE10   2188-2189
         HPOOC10   2190-2191
         HPONO10   2192-2193
         HPODE10   2194-2195
         HPSJA10   2196-2197
         HPSFE10   2198-2199
         HPSMA10   2200-2201
         HPSAP10   2202-2203
         HPSMY10   2204-2205
         HPSJU10   2206-2207
         HPSJL10   2208-2209
         HPSAU10   2210-2211
         HPSSE10   2212-2213
         HPSOC10   2214-2215
         HPSNO10   2216-2217
         HPSDE10   2218-2219
         HPRJA10   2220-2221
         HPRFE10   2222-2223
         HPRMA10   2224-2225
         HPRAP10   2226-2227
         HPRMY10   2228-2229
         HPRJU10   2230-2231
         HPRJL10   2232-2233
         HPRAU10   2234-2235
         HPRSE10   2236-2237
         HPROC10   2238-2239
         HPRNO10   2240-2241
         HPRDE10   2242-2243
         INSJA10X  2244-2245
         INSFE10X  2246-2247
         INSMA10X  2248-2249
         INSAP10X  2250-2251
         INSMY10X  2252-2253
         INSJU10X  2254-2255
         INSJL10X  2256-2257
         INSAU10X  2258-2259
         INSSE10X  2260-2261
         INSOC10X  2262-2263
         INSNO10X  2264-2265
         INSDE10X  2266-2267
         PRVEV10   2268-2268
         TRIEV10   2269-2269
         MCREV10   2270-2270
         MCDEV10   2271-2271
         OPAEV10   2272-2272
         OPBEV10   2273-2273
         UNINS10   2274-2274
         INSCOV10  2275-2275
         TRIST31X  2276-2277
         TRIST42X  2278-2279
         TRIST10X  2280-2281
         TRIPR31X  2282-2283
         TRIPR42X  2284-2285
         TRIPR10X  2286-2287
         TRIEX31X  2288-2289
         TRIEX42X  2290-2291
         TRIEX10X  2292-2293
         TRILI31X  2294-2295
         TRILI42X  2296-2297
         TRILI10X  2298-2299
         TRICH31X  2300-2301
         TRICH42X  2302-2303
         TRICH10X  2304-2305
         MCRPD31   2306-2307
         MCRPD42   2308-2309
         MCRPD10   2310-2311
         MCRPD31X  2312-2313
         MCRPD42X  2314-2315
         MCRPD10X  2316-2317
         MCRPB31   2318-2319
         MCRPB42   2320-2321
         MCRPB10   2322-2323
         MCRPHO31  2324-2325
         MCRPHO42  2326-2327
         MCRPHO10  2328-2329
         MCDHMO31  2330-2331
         MCDHMO42  2332-2333
         MCDHMO10  2334-2335
         MCDMC31   2336-2337
         MCDMC42   2338-2339
         MCDMC10   2340-2341
         PRVHMO31  2342-2343
         PRVHMO42  2344-2345
         PRVHMO10  2346-2347
         PRVMNC31  2348-2349
         PRVMNC42  2350-2351
         PRVMNC10  2352-2353
         PRVDRL31  2354-2355
         PRVDRL42  2356-2357
         PRVDRL10  2358-2359
         PHMONP31  2360-2361
         PHMONP42  2362-2363
         PHMONP10  2364-2365
         PMNCNP31  2366-2367
         PMNCNP42  2368-2369
         PMNCNP10  2370-2371
         PRDRNP31  2372-2373
         PRDRNP42  2374-2375
         PRDRNP10  2376-2377
         PREVCOVR  2378-2379
         COVRMM    2380-2381
         COVRYY    2382-2385
         WASESTB   2386-2387
         WASMCARE  2388-2389
         WASMCAID  2390-2391
         WASCHAMP  2392-2393
         WASVA     2394-2395
         WASPRIV   2396-2397
         WASOTGOV  2398-2399
         WASAFDC   2400-2401
         WASSSI    2402-2403
         WASSTAT1  2404-2405
         WASSTAT2  2406-2407
         WASSTAT3  2408-2409
         WASSTAT4  2410-2411
         WASOTHER  2412-2413
         NOINSBEF  2414-2415
         NOINSTM   2416-2417
         NOINUNIT  2418-2419
         MORECOVR  2420-2421
         INSENDMM  2422-2423
         INSENDYY  2424-2427
         TRICR31X  2428-2429
         TRICR42X  2430-2431
         TRICR53X  2432-2433
         TRICR10X  2434-2435
         TRIAT31X  2436-2437
         TRIAT42X  2438-2439
         TRIAT53X  2440-2441
         TRIAT10X  2442-2443
         MCAID31   2444-2445
         MCAID42   2446-2447
         MCAID53   2448-2449
         MCAID10   2450-2451
         MCAID31X  2452-2453
         MCAID42X  2454-2455
         MCAID53X  2456-2457
         MCAID10X  2458-2459
         MCARE31   2460-2461
         MCARE42   2462-2463
         MCARE53   2464-2465
         MCARE10   2466-2467
         MCARE31X  2468-2469
         MCARE42X  2470-2471
         MCARE53X  2472-2473
         MCARE10X  2474-2475
         MCDAT31X  2476-2477
         MCDAT42X  2478-2479
         MCDAT53X  2480-2481
         MCDAT10X  2482-2483
         OTPAAT31  2484-2485
         OTPAAT42  2486-2487
         OTPAAT53  2488-2489
         OTPAAT10  2490-2491
         OTPBAT31  2492-2493
         OTPBAT42  2494-2495
         OTPBAT53  2496-2497
         OTPBAT10  2498-2499
         OTPUBA31  2500-2501
         OTPUBA42  2502-2503
         OTPUBA53  2504-2505
         OTPUBA10  2506-2507
         OTPUBB31  2508-2509
         OTPUBB42  2510-2511
         OTPUBB53  2512-2513
         OTPUBB10  2514-2515
         PRIDK31   2516-2517
         PRIDK42   2518-2519
         PRIDK53   2520-2521
         PRIDK10   2522-2523
         PRIEU31   2524-2525
         PRIEU42   2526-2527
         PRIEU53   2528-2529
         PRIEU10   2530-2531
         PRING31   2532-2533
         PRING42   2534-2535
         PRING53   2536-2537
         PRING10   2538-2539
         PRIOG31   2540-2541
         PRIOG42   2542-2543
         PRIOG53   2544-2545
         PRIOG10   2546-2547
         PRIS31    2548-2549
         PRIS42    2550-2551
         PRIS53    2552-2553
         PRIS10    2554-2555
         PRIV31    2556-2557
         PRIV42    2558-2559
         PRIV53    2560-2561
         PRIV10    2562-2563
         PRIVAT31  2564-2565
         PRIVAT42  2566-2567
         PRIVAT53  2568-2569
         PRIVAT10  2570-2571
         PROUT31   2572-2573
         PROUT42   2574-2575
         PROUT53   2576-2577
         PROUT10   2578-2579
         PUB31X    2580-2581
         PUB42X    2582-2583
         PUB53X    2584-2585
         PUB10X    2586-2587
         PUBAT31X  2588-2589
         PUBAT42X  2590-2591
         PUBAT53X  2592-2593
         PUBAT10X  2594-2595
         INS31X    2596-2597
         INS42X    2598-2599
         INS53X    2600-2601
         INS10X    2602-2603
         INSAT31X  2604-2605
         INSAT42X  2606-2607
         INSAT53X  2608-2609
         INSAT10X  2610-2611
         STAPR31   2612-2613
         STAPR42   2614-2615
         STAPR53   2616-2617
         STAPR10   2618-2619
         STPRAT31  2620-2621
         STPRAT42  2622-2623
         STPRAT53  2624-2625
         STPRAT10  2626-2627
         EVRUNINS  2628-2628
         EVRUNAT   2629-2629
         DENTIN31  2630-2631
         DENTIN42  2632-2633
         DENTIN53  2634-2635
         DNTINS31  2636-2637
         DNTINS10  2638-2639
         PMEDIN31  2640-2641
         PMEDIN42  2642-2643
         PMEDIN53  2644-2645
         PMDINS31  2646-2647
         PMDINS10  2648-2649
         PMEDUP31  2650-2651
         PMEDUP42  2652-2653
         PMEDUP53  2654-2655
         PMEDPY31  2656-2657
         PMEDPY42  2658-2659
         PMEDPY53  2660-2661
         PMEDPP31  2662-2668
         PMEDPP42  2669-2675
         PMEDPP53  2676-2682
         GDCPBM42  2683-2684
         APRTRM42  2685-2686
         APRDLM42  2687-2688
         LKINFM42  2689-2690
         PBINFM42  2691-2692
         CSTSVM42  2693-2694
         PBSVCM42  2695-2696
         PPRWKM42  2697-2698
         PBPWKM42  2699-2700
         RTPLNM42  2701-2702
         GDCPBT42  2703-2704
         APRTRT42  2705-2706
         APRDLT42  2707-2708
         LKINFT42  2709-2710
         PBINFT42  2711-2712
         CSTSVT42  2713-2714
         PBSVCT42  2715-2716
         PPRWKT42  2717-2718
         PBPWKT42  2719-2720
         RTPLNT42  2721-2722
         TOTTCH10  2723-2729
         TOTEXP10  2730-2735
         TOTSLF10  2736-2740
         TOTMCR10  2741-2746
         TOTMCD10  2747-2752
         TOTPRV10  2753-2758
         TOTVA10   2759-2763
         TOTTRI10  2764-2768
         TOTOFD10  2769-2773
         TOTSTL10  2774-2778
         TOTWCP10  2779-2784
         TOTOPR10  2785-2790
         TOTOPU10  2791-2795
         TOTOSR10  2796-2800
         TOTPTR10  2801-2806
         TOTOTH10  2807-2812
         OBTOTV10  2813-2815
         OBVTCH10  2816-2821
         OBVEXP10  2822-2827
         OBVSLF10  2828-2832
         OBVMCR10  2833-2838
         OBVMCD10  2839-2843
         OBVPRV10  2844-2849
         OBVVA10   2850-2854
         OBVTRI10  2855-2859
         OBVOFD10  2860-2863
         OBVSTL10  2864-2868
         OBVWCP10  2869-2873
         OBVOPR10  2874-2878
         OBVOPU10  2879-2882
         OBVOSR10  2883-2887
         OBVPTR10  2888-2893
         OBVOTH10  2894-2898
         OBDRV10   2899-2901
         OBDTCH10  2902-2907
         OBDEXP10  2908-2913
         OBDSLF10  2914-2918
         OBDMCR10  2919-2924
         OBDMCD10  2925-2929
         OBDPRV10  2930-2935
         OBDVA10   2936-2940
         OBDTRI10  2941-2945
         OBDOFD10  2946-2949
         OBDSTL10  2950-2953
         OBDWCP10  2954-2958
         OBDOPR10  2959-2963
         OBDOPU10  2964-2967
         OBDOSR10  2968-2972
         OBDPTR10  2973-2978
         OBDOTH10  2979-2983
         OBOTHV10  2984-2986
         OBOTCH10  2987-2992
         OBOEXP10  2993-2998
         OBOSLF10  2999-3003
         OBOMCR10  3004-3009
         OBOMCD10  3010-3014
         OBOPRV10  3015-3019
         OBOVA10   3020-3024
         OBOTRI10  3025-3028
         OBOOFD10  3029-3032
         OBOSTL10  3033-3036
         OBOWCP10  3037-3040
         OBOOPR10  3041-3045
         OBOOPU10  3046-3049
         OBOOSR10  3050-3054
         OBOPTR10  3055-3059
         OBOOTH10  3060-3064
         OBCHIR10  3065-3067
         OBCTCH10  3068-3072
         OBCEXP10  3073-3077
         OBCSLF10  3078-3081
         OBCMCR10  3082-3085
         OBCMCD10  3086-3089
         OBCPRV10  3090-3093
         OBCVA10   3094-3097
         OBCTRI10  3098-3100
         OBCOFD10  3101-3103
         OBCSTL10  3104-3107
         OBCWCP10  3108-3111
         OBCOPR10  3112-3115
         OBCOPU10  3116-3118
         OBCOSR10  3119-3122
         OBCPTR10  3123-3126
         OBCOTH10  3127-3130
         OBNURS10  3131-3133
         OBNTCH10  3134-3139
         OBNEXP10  3140-3145
         OBNSLF10  3146-3149
         OBNMCR10  3150-3155
         OBNMCD10  3156-3159
         OBNPRV10  3160-3164
         OBNVA10   3165-3169
         OBNTRI10  3170-3173
         OBNOFD10  3174-3176
         OBNSTL10  3177-3180
         OBNWCP10  3181-3183
         OBNOPR10  3184-3187
         OBNOPU10  3188-3191
         OBNOSR10  3192-3195
         OBNPTR10  3196-3200
         OBNOTH10  3201-3204
         OBOPTO10  3205-3206
         OBETCH10  3207-3210
         OBEEXP10  3211-3214
         OBESLF10  3215-3218
         OBEMCR10  3219-3222
         OBEMCD10  3223-3226
         OBEPRV10  3227-3230
         OBEVA10   3231-3233
         OBETRI10  3234-3236
         OBEOFD10  3237-3239
         OBESTL10  3240-3241
         OBEWCP10  3242-3242
         OBEOPR10  3243-3245
         OBEOPU10  3246-3246
         OBEOSR10  3247-3249
         OBEPTR10  3250-3253
         OBEOTH10  3254-3256
         OBASST10  3257-3258
         OBATCH10  3259-3263
         OBAEXP10  3264-3267
         OBASLF10  3268-3271
         OBAMCR10  3272-3275
         OBAMCD10  3276-3279
         OBAPRV10  3280-3283
         OBAVA10   3284-3287
         OBATRI10  3288-3290
         OBAOFD10  3291-3293
         OBASTL10  3294-3296
         OBAWCP10  3297-3300
         OBAOPR10  3301-3304
         OBAOPU10  3305-3307
         OBAOSR10  3308-3311
         OBAPTR10  3312-3315
         OBAOTH10  3316-3319
         OBTHER10  3320-3322
         OBTTCH10  3323-3327
         OBTEXP10  3328-3332
         OBTSLF10  3333-3337
         OBTMCR10  3338-3341
         OBTMCD10  3342-3346
         OBTPRV10  3347-3351
         OBTVA10   3352-3356
         OBTTRI10  3357-3360
         OBTOFD10  3361-3361
         OBTSTL10  3362-3365
         OBTWCP10  3366-3369
         OBTOPR10  3370-3373
         OBTOPU10  3374-3376
         OBTOSR10  3377-3380
         OBTPTR10  3381-3385
         OBTOTH10  3386-3389
         OPTOTV10  3390-3392
         OPTTCH10  3393-3398
         OPTEXP10  3399-3404
         OPTSLF10  3405-3409
         OPTMCR10  3410-3414
         OPTMCD10  3415-3419
         OPTPRV10  3420-3424
         OPTVA10   3425-3429
         OPTTRI10  3430-3434
         OPTOFD10  3435-3439
         OPTSTL10  3440-3444
         OPTWCP10  3445-3449
         OPTOPR10  3450-3454
         OPTOPU10  3455-3458
         OPTOSR10  3459-3463
         OPTPTR10  3464-3468
         OPTOTH10  3469-3473
         OPFTCH10  3474-3479
         OPFEXP10  3480-3485
         OPFSLF10  3486-3490
         OPFMCR10  3491-3495
         OPFMCD10  3496-3500
         OPFPRV10  3501-3505
         OPFVA10   3506-3510
         OPFTRI10  3511-3515
         OPFOFD10  3516-3520
         OPFSTL10  3521-3525
         OPFWCP10  3526-3530
         OPFOPR10  3531-3535
         OPFOPU10  3536-3539
         OPFOSR10  3540-3544
         OPFPTR10  3545-3549
         OPFOTH10  3550-3554
         OPDEXP10  3555-3559
         OPDTCH10  3560-3565
         OPDSLF10  3566-3569
         OPDMCR10  3570-3573
         OPDMCD10  3574-3577
         OPDPRV10  3578-3582
         OPDVA10   3583-3585
         OPDTRI10  3586-3589
         OPDOFD10  3590-3590
         OPDSTL10  3591-3593
         OPDWCP10  3594-3597
         OPDOPR10  3598-3601
         OPDOPU10  3602-3605
         OPDOSR10  3606-3610
         OPDPTR10  3611-3615
         OPDOTH10  3616-3620
         OPDRV10   3621-3622
         OPVTCH10  3623-3628
         OPVEXP10  3629-3633
         OPVSLF10  3634-3638
         OPVMCR10  3639-3643
         OPVMCD10  3644-3648
         OPVPRV10  3649-3653
         OPVVA10   3654-3658
         OPVTRI10  3659-3663
         OPVOFD10  3664-3668
         OPVSTL10  3669-3673
         OPVWCP10  3674-3678
         OPVOPR10  3679-3683
         OPVOPU10  3684-3687
         OPVOSR10  3688-3692
         OPVPTR10  3693-3697
         OPVOTH10  3698-3702
         OPSEXP10  3703-3707
         OPSTCH10  3708-3712
         OPSSLF10  3713-3716
         OPSMCR10  3717-3720
         OPSMCD10  3721-3724
         OPSPRV10  3725-3729
         OPSVA10   3730-3732
         OPSTRI10  3733-3736
         OPSOFD10  3737-3737
         OPSSTL10  3738-3740
         OPSWCP10  3741-3744
         OPSOPR10  3745-3748
         OPSOPU10  3749-3752
         OPSOSR10  3753-3757
         OPSPTR10  3758-3762
         OPSOTH10  3763-3767
         OPOTHV10  3768-3769
         OPOTCH10  3770-3775
         OPOEXP10  3776-3780
         OPOSLF10  3781-3784
         OPOMCR10  3785-3789
         OPOMCD10  3790-3794
         OPOPRV10  3795-3799
         OPOVA10   3800-3804
         OPOTRI10  3805-3808
         OPOOFD10  3809-3812
         OPOSTL10  3813-3817
         OPOWCP10  3818-3822
         OPOOPR10  3823-3827
         OPOOPU10  3828-3831
         OPOOSR10  3832-3835
         OPOPTR10  3836-3840
         OPOOTH10  3841-3845
         OPPEXP10  3846-3850
         OPPTCH10  3851-3855
         OPPSLF10  3856-3859
         OPPMCR10  3860-3863
         OPPMCD10  3864-3867
         OPPPRV10  3868-3872
         OPPVA10   3873-3875
         OPPTRI10  3876-3879
         OPPOFD10  3880-3880
         OPPSTL10  3881-3883
         OPPWCP10  3884-3887
         OPPOPR10  3888-3891
         OPPOPU10  3892-3894
         OPPOSR10  3895-3897
         OPPPTR10  3898-3902
         OPPOTH10  3903-3906
         AMCHIR10  3907-3909
         AMCTCH10  3910-3914
         AMCEXP10  3915-3919
         AMCSLF10  3920-3923
         AMCMCR10  3924-3927
         AMCMCD10  3928-3931
         AMCPRV10  3932-3935
         AMCVA10   3936-3939
         AMCTRI10  3940-3942
         AMCOFD10  3943-3945
         AMCSTL10  3946-3949
         AMCWCP10  3950-3953
         AMCOPR10  3954-3957
         AMCOPU10  3958-3960
         AMCOSR10  3961-3964
         AMCPTR10  3965-3968
         AMCOTH10  3969-3972
         AMNURS10  3973-3975
         AMNTCH10  3976-3982
         AMNEXP10  3983-3988
         AMNSLF10  3989-3992
         AMNMCR10  3993-3998
         AMNMCD10  3999-4002
         AMNPRV10  4003-4007
         AMNVA10   4008-4012
         AMNTRI10  4013-4016
         AMNOFD10  4017-4020
         AMNSTL10  4021-4024
         AMNWCP10  4025-4027
         AMNOPR10  4028-4032
         AMNOPU10  4033-4036
         AMNOSR10  4037-4040
         AMNPTR10  4041-4045
         AMNOTH10  4046-4050
         AMOPTO10  4051-4052
         AMETCH10  4053-4056
         AMEEXP10  4057-4060
         AMESLF10  4061-4064
         AMEMCR10  4065-4068
         AMEMCD10  4069-4072
         AMEPRV10  4073-4076
         AMEVA10   4077-4079
         AMETRI10  4080-4082
         AMEOFD10  4083-4085
         AMESTL10  4086-4087
         AMEWCP10  4088-4088
         AMEOPR10  4089-4091
         AMEOPU10  4092-4092
         AMEOSR10  4093-4095
         AMEPTR10  4096-4099
         AMEOTH10  4100-4102
         AMASST10  4103-4104
         AMATCH10  4105-4109
         AMAEXP10  4110-4113
         AMASLF10  4114-4117
         AMAMCR10  4118-4121
         AMAMCD10  4122-4125
         AMAPRV10  4126-4129
         AMAVA10   4130-4133
         AMATRI10  4134-4136
         AMAOFD10  4137-4139
         AMASTL10  4140-4142
         AMAWCP10  4143-4146
         AMAOPR10  4147-4150
         AMAOPU10  4151-4153
         AMAOSR10  4154-4157
         AMAPTR10  4158-4161
         AMAOTH10  4162-4165
         AMTHER10  4166-4168
         AMTTCH10  4169-4174
         AMTEXP10  4175-4179
         AMTSLF10  4180-4184
         AMTMCR10  4185-4189
         AMTMCD10  4190-4194
         AMTPRV10  4195-4199
         AMTVA10   4200-4204
         AMTTRI10  4205-4208
         AMTOFD10  4209-4209
         AMTSTL10  4210-4213
         AMTWCP10  4214-4217
         AMTOPR10  4218-4221
         AMTOPU10  4222-4225
         AMTOSR10  4226-4229
         AMTPTR10  4230-4234
         AMTOTH10  4235-4238
         AMTOTC10  4239-4239
         AMDRC10   4240-4240
         ERTOT10   4241-4242
         ERTTCH10  4243-4248
         ERTEXP10  4249-4253
         ERTSLF10  4254-4258
         ERTMCR10  4259-4263
         ERTMCD10  4264-4268
         ERTPRV10  4269-4273
         ERTVA10   4274-4277
         ERTTRI10  4278-4281
         ERTOFD10  4282-4285
         ERTSTL10  4286-4290
         ERTWCP10  4291-4295
         ERTOPR10  4296-4300
         ERTOPU10  4301-4304
         ERTOSR10  4305-4309
         ERTPTR10  4310-4314
         ERTOTH10  4315-4319
         ERFTCH10  4320-4325
         ERFEXP10  4326-4330
         ERFSLF10  4331-4335
         ERFMCR10  4336-4340
         ERFMCD10  4341-4345
         ERFPRV10  4346-4350
         ERFVA10   4351-4354
         ERFTRI10  4355-4358
         ERFOFD10  4359-4362
         ERFSTL10  4363-4367
         ERFWCP10  4368-4372
         ERFOPR10  4373-4377
         ERFOPU10  4378-4381
         ERFOSR10  4382-4386
         ERFPTR10  4387-4391
         ERFOTH10  4392-4396
         ERDEXP10  4397-4401
         ERDTCH10  4402-4406
         ERDSLF10  4407-4410
         ERDMCR10  4411-4414
         ERDMCD10  4415-4419
         ERDPRV10  4420-4423
         ERDVA10   4424-4427
         ERDTRI10  4428-4430
         ERDOFD10  4431-4431
         ERDSTL10  4432-4434
         ERDWCP10  4435-4438
         ERDOPR10  4439-4442
         ERDOPU10  4443-4445
         ERDOSR10  4446-4449
         ERDPTR10  4450-4453
         ERDOTH10  4454-4457
         IPZERO10  4458-4458
         ZIFTCH10  4459-4463
         ZIFEXP10  4464-4468
         ZIFSLF10  4469-4473
         ZIFMCR10  4474-4478
         ZIFMCD10  4479-4483
         ZIFPRV10  4484-4488
         ZIFVA10   4489-4491
         ZIFTRI10  4492-4496
         ZIFOFD10  4497-4497
         ZIFSTL10  4498-4501
         ZIFWCP10  4502-4502
         ZIFOPR10  4503-4506
         ZIFOPU10  4507-4511
         ZIFOSR10  4512-4516
         ZIFPTR10  4517-4521
         ZIFOTH10  4522-4526
         ZIDEXP10  4527-4530
         ZIDTCH10  4531-4535
         ZIDSLF10  4536-4539
         ZIDMCR10  4540-4543
         ZIDMCD10  4544-4546
         ZIDPRV10  4547-4550
         ZIDVA10   4551-4551
         ZIDTRI10  4552-4554
         ZIDOFD10  4555-4555
         ZIDSTL10  4556-4558
         ZIDWCP10  4559-4559
         ZIDOPR10  4560-4563
         ZIDOPU10  4564-4566
         ZIDOSR10  4567-4569
         ZIDPTR10  4570-4573
         ZIDOTH10  4574-4577
         IPDIS10   4578-4579
         IPTEXP10  4580-4585
         IPTTCH10  4586-4591
         IPTSLF10  4592-4596
         IPTMCR10  4597-4602
         IPTMCD10  4603-4608
         IPTPRV10  4609-4614
         IPTVA10   4615-4619
         IPTTRI10  4620-4624
         IPTOFD10  4625-4629
         IPTSTL10  4630-4634
         IPTWCP10  4635-4640
         IPTOPR10  4641-4646
         IPTOPU10  4647-4651
         IPTOSR10  4652-4656
         IPTPTR10  4657-4662
         IPTOTH10  4663-4668
         IPFEXP10  4669-4674
         IPFTCH10  4675-4680
         IPFSLF10  4681-4685
         IPFMCR10  4686-4691
         IPFMCD10  4692-4697
         IPFPRV10  4698-4703
         IPFVA10   4704-4708
         IPFTRI10  4709-4713
         IPFOFD10  4714-4718
         IPFSTL10  4719-4723
         IPFWCP10  4724-4728
         IPFOPR10  4729-4733
         IPFOPU10  4734-4738
         IPFOSR10  4739-4743
         IPFPTR10  4744-4749
         IPFOTH10  4750-4754
         IPDEXP10  4755-4759
         IPDTCH10  4760-4765
         IPDSLF10  4766-4770
         IPDMCR10  4771-4775
         IPDMCD10  4776-4780
         IPDPRV10  4781-4785
         IPDVA10   4786-4789
         IPDTRI10  4790-4793
         IPDOFD10  4794-4794
         IPDSTL10  4795-4798
         IPDWCP10  4799-4803
         IPDOPR10  4804-4808
         IPDOPU10  4809-4812
         IPDOSR10  4813-4816
         IPDPTR10  4817-4821
         IPDOTH10  4822-4826
         IPNGTD10  4827-4829
         DVTOT10   4830-4831
         DVTTCH10  4832-4839
         DVTEXP10  4840-4847
         DVTSLF10  4848-4855
         DVTMCR10  4856-4862
         DVTMCD10  4863-4870
         DVTPRV10  4871-4878
         DVTVA10   4879-4885
         DVTTRI10  4886-4892
         DVTOFD10  4893-4899
         DVTSTL10  4900-4906
         DVTWCP10  4907-4913
         DVTOPR10  4914-4920
         DVTOPU10  4921-4927
         DVTOSR10  4928-4934
         DVTPTR10  4935-4939
         DVTOTH10  4940-4943
         DVGEN10   4944-4948
         DVGTCH10  4949-4956
         DVGEXP10  4957-4964
         DVGSLF10  4965-4972
         DVGMCR10  4973-4979
         DVGMCD10  4980-4987
         DVGPRV10  4988-4994
         DVGVA10   4995-5001
         DVGTRI10  5002-5008
         DVGOFD10  5009-5015
         DVGSTL10  5016-5022
         DVGWCP10  5023-5029
         DVGOPR10  5030-5036
         DVGOPU10  5037-5042
         DVGOSR10  5043-5049
         DVGPTR10  5050-5053
         DVGOTH10  5054-5057
         DVORTH10  5058-5062
         DVOTCH10  5063-5070
         DVOEXP10  5071-5078
         DVOSLF10  5079-5086
         DVOMCR10  5087-5093
         DVOMCD10  5094-5101
         DVOPRV10  5102-5109
         DVOVA10   5110-5115
         DVOTRI10  5116-5121
         DVOOFD10  5122-5125
         DVOSTL10  5126-5132
         DVOWCP10  5133-5136
         DVOOPR10  5137-5143
         DVOOPU10  5144-5150
         DVOOSR10  5151-5157
         DVOPTR10  5158-5162
         DVOOTH10  5163-5166
         HHTOTD10  5167-5169
         HHAGD10   5170-5172
         HHATCH10  5173-5178
         HHAEXP10  5179-5184
         HHASLF10  5185-5188
         HHAMCR10  5189-5193
         HHAMCD10  5194-5199
         HHAPRV10  5200-5204
         HHAVA10   5205-5208
         HHATRI10  5209-5212
         HHAOFD10  5213-5213
         HHASTL10  5214-5218
         HHAWCP10  5219-5223
         HHAOPR10  5224-5227
         HHAOPU10  5228-5232
         HHAOSR10  5233-5237
         HHAPTR10  5238-5242
         HHAOTH10  5243-5247
         HHINDD10  5248-5250
         HHNTCH10  5251-5255
         HHNEXP10  5256-5260
         HHNSLF10  5261-5265
         HHNMCD10  5266-5269
         HHNMCR10  5270-5273
         HHNPRV10  5274-5277
         HHNVA10   5278-5281
         HHNTRI10  5282-5282
         HHNOFD10  5283-5283
         HHNSTL10  5284-5286
         HHNWCP10  5287-5287
         HHNOPR10  5288-5290
         HHNOPU10  5291-5292
         HHNOSR10  5293-5293
         HHNPTR10  5294-5297
         HHNOTH10  5298-5300
         HHINFD10  5301-5303
         VISEXP10  5304-5307
         VISTCH10  5308-5311
         VISSLF10  5312-5315
         VISMCR10  5316-5319
         VISMCD10  5320-5323
         VISPRV10  5324-5327
         VISVA10   5328-5331
         VISTRI10  5332-5334
         VISOFD10  5335-5337
         VISSTL10  5338-5340
         VISWCP10  5341-5343
         VISOPR10  5344-5346
         VISOPU10  5347-5349
         VISOSR10  5350-5352
         VISPTR10  5353-5356
         VISOTH10  5357-5359
         OTHTCH10  5360-5364
         OTHEXP10  5365-5369
         OTHSLF10  5370-5374
         OTHMCR10  5375-5379
         OTHMCD10  5380-5384
         OTHPRV10  5385-5388
         OTHVA10   5389-5392
         OTHTRI10  5393-5396
         OTHOFD10  5397-5400
         OTHSTL10  5401-5404
         OTHWCP10  5405-5407
         OTHOPR10  5408-5411
         OTHOPU10  5412-5414
         OTHOSR10  5415-5417
         OTHPTR10  5418-5421
         OTHOTH10  5422-5425
         RXTOT10   5426-5428
         RXEXP10   5429-5434
         RXSLF10   5435-5439
         RXMCR10   5440-5445
         RXMCD10   5446-5451
         RXPRV10   5452-5456
         RXVA10    5457-5461
         RXTRI10   5462-5466
         RXOFD10   5467-5471
         RXSTL10   5472-5476
         RXWCP10   5477-5480
         RXOPR10   5481-5485
         RXOPU10   5486-5490
         RXOSR10   5491-5494
         RXPTR10   5495-5499
         RXOTH10   5500-5504
  double PERWT10F  5505-5516
  double FAMWT10F  5517-5528
  double FAMWT10C  5529-5540
  double SAQWT10F  5541-5552
  double DIABW10F  5553-5564
         VARSTR    5565-5568
         VARPSU    5569-5569
using H138.DAT;

*DEFINE VARIABLE LABELS;
label variable DUID "DWELLING UNIT ID";
label variable PID "PERSON NUMBER";
label variable DUPERSID "PERSON ID (DUID + PID)";
label variable PANEL "PANEL NUMBER";
label variable FAMID31 "FAMILY ID (STUDENT MERGED IN) - R3/1";
label variable FAMID42 "FAMILY ID (STUDENT MERGED IN) - R4/2";
label variable FAMID53 "FAMILY ID (STUDENT MERGED IN) - R5/3";
label variable FAMID10 "FAMILY ID (STUDENT MERGED IN) - 12/31/10";
label variable FAMIDYR "ANNUAL FAMILY IDENTIFIER";
label variable CPSFAMID "CPSFAMID";
label variable FCSZ1231 "FAM SIZE RESPONDING 12/31 CPS FAMILY";
label variable FCRP1231 "REF PERSON OF 12/31 CPS FAMILY";
label variable RULETR31 "RU LETTER - R3/1";
label variable RULETR42 "RU LETTER - R4/2";
label variable RULETR53 "RU LETTER - R5/3";
label variable RULETR10 "RU LETTER AS OF 12/31/10";
label variable RUSIZE31 "RU SIZE - R3/1";
label variable RUSIZE42 "RU SIZE - R4/2";
label variable RUSIZE53 "RU SIZE - R5/3";
label variable RUSIZE10 "RU SIZE AS OF 12/31/10";
label variable RUCLAS31 "RU FIELDED AS:STANDARD/NEW/STUDENT-R3/1";
label variable RUCLAS42 "RU FIELDED AS:STANDARD/NEW/STUDENT-R4/2";
label variable RUCLAS53 "RU FIELDED AS:STANDARD/NEW/STUDENT-R5/3";
label variable RUCLAS10 "RU FIELDED AS:STANDARD/NEW/STUD-12/31/10";
label variable FAMSZE31 "RU SIZE INCLUDING STUDENTS - R3/1";
label variable FAMSZE42 "RU SIZE INCLUDING STUDENTS - R4/2";
label variable FAMSZE53 "RU SIZE INCLUDING STUDENTS - R5/3";
label variable FAMSZE10 "RU SIZE INCLUDING STUDENT AS OF 12/31/10";
label variable FMRS1231 "MEMBER OF RESPONDING 12/31 FAMILY";
label variable FAMS1231 "FAMILY SIZE OF RESPONDING 12/31 FAMILY";
label variable FAMSZEYR "SIZE OF RESPONDING ANNUALIZED FAMILY";
label variable FAMRFPYR "REFERENCE PERSON OF ANNUALIZED FAMILY";
label variable REGION31 "CENSUS REGION - R3/1";
label variable REGION42 "CENSUS REGION - R4/2";
label variable REGION53 "CENSUS REGION - R5/3";
label variable REGION10 "CENSUS REGION AS OF 12/31/10";
label variable MSA31 "MSA STATUS - R3/1";
label variable MSA42 "MSA STATUS - R4/2";
label variable MSA53 "MSA STATUS - R5/3";
label variable MSA10 "MSA AS OF 12/31/10";
label variable REFPRS31 "REFERENCE PERSON AT - R3/1";
label variable REFPRS42 "REFERENCE PERSON AT - R4/2";
label variable REFPRS53 "REFERENCE PERSON AT - R5/3";
label variable REFPRS10 "REFERENCE PERSON AS OF 12/31/10";
label variable RESP31 "1ST RESPONDENT INDICATOR FOR R3/1";
label variable RESP42 "1ST RESPONDENT INDICATOR FOR R4/2";
label variable RESP53 "1ST RESPONDENT INDICATOR FOR R5/3";
label variable RESP10 "1ST RESPONDENT INDICATOR AS OF 12/31/10";
label variable PROXY31 "WAS RESPONDENT A PROXY IN R3/1";
label variable PROXY42 "WAS RESPONDENT A PROXY IN R4/2";
label variable PROXY53 "WAS RESPONDENT A PROXY IN R5/3";
label variable PROXY10 "WAS RESPONDENT A PROXY AS OF 12/31/10";
label variable INTVLANG "LANGUAGE INTERVIEW WAS COMPLETED";
label variable BEGRFD31 "R3/1 REFERENCE PERIOD BEGIN DATE: DAY";
label variable BEGRFM31 "R3/1 REFERENCE PERIOD BEGIN DATE: MONTH";
label variable BEGRFY31 "R3/1 REFERENCE PERIOD BEGIN DATE: YEAR";
label variable ENDRFD31 "R3/1 REFERENCE PERIOD END DATE: DAY";
label variable ENDRFM31 "R3/1 REFERENCE PERIOD END DATE: MONTH";
label variable ENDRFY31 "R3/1 REFERENCE PERIOD END DATE: YEAR";
label variable BEGRFD42 "R4/2 REFERENCE PERIOD BEGIN DATE: DAY";
label variable BEGRFM42 "R4/2 REFERENCE PERIOD BEGIN DATE: MONTH";
label variable BEGRFY42 "R4/2 REFERENCE PERIOD BEGIN DATE: YEAR";
label variable ENDRFD42 "R4/2 REFERENCE PERIOD END DATE: DAY";
label variable ENDRFM42 "R4/2 REFERENCE PERIOD END DATE: MONTH";
label variable ENDRFY42 "R4/2 REFERENCE PERIOD END DATE: YEAR";
label variable BEGRFD53 "R5/3 REFERENCE PERIOD BEGIN DATE: DAY";
label variable BEGRFM53 "R5/3 REFERENCE PERIOD BEGIN DATE: MONTH";
label variable BEGRFY53 "R5/3 REFERENCE PERIOD BEGIN DATE: YEAR";
label variable ENDRFD53 "R5/3 REFERENCE PERIOD END DATE: DAY";
label variable ENDRFM53 "R5/3 REFERENCE PERIOD END DATE: MONTH";
label variable ENDRFY53 "R5/3 REFERENCE PERIOD END DATE: YEAR";
label variable ENDRFD10 "2010 REFERENCE PERIOD END DATE: DAY";
label variable ENDRFM10 "2010 REFERENCE PERIOD END DATE: MONTH";
label variable ENDRFY10 "2010 REFERENCE PERIOD END DATE: YEAR";
label variable KEYNESS "PERSON KEY STATUS";
label variable INSCOP31 "INSCOPE - R3/1";
label variable INSCOP42 "INSCOPE - R4/2";
label variable INSCOP53 "INSCOPE - R5/3";
label variable INSCOP10 "INSCOPE - R5/3 START THROUGH 12/31/10";
label variable INSC1231 "INSCOPE STATUS ON 12/31/10";
label variable INSCOPE "WAS PERSON EVER INSCOPE IN 2010";
label variable ELGRND31 "ELIGIBILITY - R3/1";
label variable ELGRND42 "ELIGIBILITY - R4/2";
label variable ELGRND53 "ELIGIBILITY - R5/3";
label variable ELGRND10 "ELIGIBILITY STATUS AS OF 12/31/10";
label variable PSTATS31 "PERSON DISPOSITION STATUS - R3/1";
label variable PSTATS42 "PERSON DISPOSITION STATUS - R4/2";
label variable PSTATS53 "PERSON DISPOSITION STATUS - R5/3";
label variable RURSLT31 "RU RESULT - R3/1";
label variable RURSLT42 "RU RESULT - R4/2";
label variable RURSLT53 "RU RESULT - R5/3";
label variable AGE31X "AGE - R3/1 (EDITED/IMPUTED)";
label variable AGE42X "AGE - R4/2 (EDITED/IMPUTED)";
label variable AGE53X "AGE - R5/3 (EDITED/IMPUTED)";
label variable AGE10X "AGE AS OF 12/31/10 (EDITED/IMPUTED)";
label variable AGELAST "PERSON S AGE LAST TIME ELIGIBLE";
label variable DOBMM "DATE OF BIRTH: MONTH";
label variable DOBYY "DATE OF BIRTH: YEAR";
label variable SEX "SEX";
label variable RACEX "RACE (EDITED/IMPUTED)";
label variable RACEAX "ASIAN AMONG RACES RPTD (EDITED/IMPUTED)";
label variable RACEBX "BLACK AMONG RACES RPTD (EDITED/IMPUTED)";
label variable RACEWX "WHITE AMONG RACES RPTD (EDITED/IMPUTED)";
label variable RACETHNX "RACE/ETHNICITY (EDITED/IMPUTED)";
label variable HISPANX "HISPANIC ETHNICITY (EDITED/IMPUTED)";
label variable HISPCAT "SPECIFIC HISPANIC ETHNICITY GROUP";
label variable MARRY31X "MARITAL STATUS - R3/1 (EDITED/IMPUTED)";
label variable MARRY42X "MARITAL STATUS - R4/2 (EDITED/IMPUTED)";
label variable MARRY53X "MARITAL STATUS - R5/3 (EDITED/IMPUTED)";
label variable MARRY10X "MARITAL STATUS-12/31/10 (EDITED/IMPUTED)";
label variable SPOUID31 "SPOUSE ID - R3/1";
label variable SPOUID42 "SPOUSE ID - R4/2";
label variable SPOUID53 "SPOUSE ID - R5/3";
label variable SPOUID10 "SPOUSE ID - 12/31/10";
label variable SPOUIN31 "MARITAL STATUS W/SPOUSE PRESENT-R3/1";
label variable SPOUIN42 "MARITAL STATUS W/SPOUSE PRESENT-R4/2";
label variable SPOUIN53 "MARITAL STATUS W/SPOUSE PRESENT-R5/3";
label variable SPOUIN10 "MARITAL STATUS W/SPOUSE PRESENT-12/31/10";
label variable EDUCYR "YEARS OF EDUC WHEN FIRST ENTERED MEPS";
label variable HIDEG "HIGHEST DEGREE WHEN FIRST ENTERED MEPS";
label variable FTSTU31X "STUDENT STATUS IF AGES 17-23 - R3/1";
label variable FTSTU42X "STUDENT STATUS IF AGES 17-23 - R4/2";
label variable FTSTU53X "STUDENT STATUS IF AGES 17-23 - R5/3";
label variable FTSTU10X "STUDENT STATUS IF AGES 17-23 - 12/31/10";
label variable ACTDTY31 "MILITARY FULL-TIME ACTIVE DUTY - R3/1";
label variable ACTDTY42 "MILITARY FULL-TIME ACTIVE DUTY - R4/2";
label variable ACTDTY53 "MILITARY FULL-TIME ACTIVE DUTY - R5/3";
label variable HONRDC31 "HONORABLY DISCHARGED FROM MILITARY";
label variable HONRDC42 "HONORABLY DISCHARGED FROM MILITARY";
label variable HONRDC53 "HONORABLY DISCHARGED FROM MILITARY";
label variable RFREL31X "RELATION TO REF PERS-R3/1 (EDIT/IMP)";
label variable RFREL42X "RELATION TO REF PERS-R4/2 (EDIT/IMP)";
label variable RFREL53X "RELATION TO REF PERS-R5/3 (EDIT/IMP)";
label variable RFREL10X "RELATION TO REF PERS-12/31/10 (EDIT/IMP)";
label variable MOPID31X "PID OF PERSON S MOM - RD 3/1";
label variable MOPID42X "PID OF PERSON S MOM - RD 4/2";
label variable MOPID53X "PID OF PERSON S MOM - RD 5/3";
label variable DAPID31X "PID OF PERSON S DAD - RD 3/1";
label variable DAPID42X "PID OF PERSON S DAD - RD 4/2";
label variable DAPID53X "PID OF PERSON S DAD - RD 5/3";
label variable RTHLTH31 "PERCEIVED HEALTH STATUS - RD 3/1";
label variable RTHLTH42 "PERCEIVED HEALTH STATUS - RD 4/2";
label variable RTHLTH53 "PERCEIVED HEALTH STATUS - RD 5/3";
label variable MNHLTH31 "PERCEIVED MENTAL HEALTH STATUS - RD 3/1";
label variable MNHLTH42 "PERCEIVED MENTAL HEALTH STATUS - RD 4/2";
label variable MNHLTH53 "PERCEIVED MENTAL HEALTH STATUS - RD 5/3";
label variable HIBPDX "HIGH BLOOD PRESSURE DIAG (>17)";
label variable HIBPAGED "AGE OF DIAGNOSIS-HIGH BLOOD PRESSURE";
label variable BPMLDX "MULT DIAG HIGH BLOOD PRESS (>17)";
label variable CHDDX "CORONARY HRT DISEASE DIAG (>17)";
label variable CHDAGED "AGE OF DIAGNOSIS-CORONARY HEART DISEASE";
label variable ANGIDX "ANGINA DIAGNOSIS (>17)";
label variable ANGIAGED "AGE OF DIAGNOSIS-ANGINA";
label variable MIDX "HEART ATTACK (MI) DIAG (>17)";
label variable MIAGED "AGE OF DIAGNOSIS-HEART ATTACK(MI)";
label variable OHRTDX "OTHER HEART DISEASE DIAG (>17)";
label variable OHRTAGED "AGE OF DIAGNOSIS-OTHER HEART DISEASE";
label variable STRKDX "STROKE DIAGNOSIS (>17)";
label variable STRKAGED "AGE OF DIAGNOSIS-STROKE";
label variable EMPHDX "EMPHYSEMA DIAGNOSIS (>17)";
label variable EMPHAGED "AGE OF DIAGNOSIS-EMPHYSEMA";
label variable CHBRON31 "CHRONC BRONCHITS LAST 12 MTHS (>17)-R3/1";
label variable CHBRON53 "CHRONC BRONCHITS LAST 12 MTHS (>17)-R5/3";
label variable CHOLDX "HIGH CHOLESTEROL DIAGNOSIS (>17)";
label variable CHOLAGED "AGE OF DIAGNOSIS-HIGH CHOLESTEROL";
label variable CANCERDX "CANCER DIAGNOSIS (>17)";
label variable CABLADDR "CANCER DIAGNOSED - BLADDER (>17)";
label variable BLDRAGED "AGE OF DIAGNOSIS-BLADDER CANCER";
label variable BLDRREMS "BLADDER CANCER IN REMISSION";
label variable CABONE "CANCER DIAGNOSED - BONE (>17)";
label variable BONEAGED "AGE OF DIAGNOSIS-BONE CANCER";
label variable BONEREMS "BONE CANCER IN REMISSION";
label variable CABRAIN "CANCER DIAGNOSED - BRAIN (>17)";
label variable BRAIAGED "AGE OF DIAGNOSIS-BRAIN CANCER";
label variable BRAIREMS "BRAIN CANCER IN REMISSION";
label variable CABREAST "CANCER DIAGNOSED - BREAST (>17)";
label variable BRSTAGED "AGE OF DIAGNOSIS-BREAST CANCER";
label variable BRSTREMS "BREAST CANCER IN REMISSION";
label variable CACERVIX "CANCER DIAGNOSED - CERVIX (>17)";
label variable CERVAGED "AGE OF DIAGNOSIS-CERVICAL CANCER";
label variable CERVREMS "CERVICAL CANCER IN REMISSION";
label variable CACOLON "CANCER DIAGNOSED - COLON (>17)";
label variable COLOAGED "AGE OF DIAGNOSIS-COLON CANCER";
label variable COLOREMS "COLON CANCER IN REMISSION";
label variable CAESOPH "CANCER DIAGNOSED - ESOPHAGUS (>17)";
label variable ESPHAGED "AGE OF DIAGNOSIS-ESOPHAGEAL CANCER";
label variable ESPHREMS "ESOPHAGEAL CANCER IN REMISSION";
label variable CAKIDNEY "CANCER DIAGNOSED - KIDNEY (>17)";
label variable KIDNAGED "AGE OF DIAGNOSIS-RENAL CANCER";
label variable KIDNREMS "RENAL CANCER IN REMISSION";
label variable CALARYNX "CANCER DIAGNOSED - LARYNX (>17)";
label variable LRNXAGED "AGE OF DIAGNOSIS-LARYNGEAL CANCER";
label variable LRNXREMS "LARYNGEAL CANCER IN REMISSION";
label variable CALEUKEM "CANCER DIAGNOSED - LEUKEMIA (>17)";
label variable LEUKAGED "AGE OF DIAGNOSIS-LEUKEMIA";
label variable LEUKREMS "LEUKEMIA IN REMISSION";
label variable CALIVER "CANCER DIAGNOSED - LIVER (>17)";
label variable LIVRAGED "AGE OF DIAGNOSIS-LIVER CANCER";
label variable LIVRREMS "LIVER CANCER IN REMISSION";
label variable CALUNG "CANCER DIAGNOSED - LUNG (>17)";
label variable LUNGAGED "AGE OF DIAGNOSIS-LUNG CANCER";
label variable LUNGREMS "LUNG CANCER IN REMISSION";
label variable CALYMPH "CANCER DIAGNOSED - LYMPHOMA (>17)";
label variable LYMPAGED "AGE OF DIAGNOSIS-LYMPHOMA";
label variable LYMPREMS "LYMPHOMA IN REMISSION";
label variable CAMELANO "CANCER DIAGNOSED - MELANOMA (>17)";
label variable MELAAGED "AGE OF DIAGNOSIS-MELANOMA";
label variable MELAREMS "MELANOMA IN REMISSION";
label variable CAMOUTH "CANCER DIAGNOSED - MOUTH/LIP/TONGE (>17)";
label variable MOUTAGED "AGE OF DIAGNOSIS-MOUTH/LIP/TONGUE CANCER";
label variable MOUTREMS "MOUTH/TONGUE/LIP CANCER IN REMISSION";
label variable CAMUSCLE "CANCER DIAGNSD - SOFTTISS/MUSC/FAT (>17)";
label variable MUSCAGED "AGE OF DIAGNOSIS-SFTTISS/MUSC/FAT CANCER";
label variable MUSCREMS "SFT TISS/MUSC/FAT CANCER IN REMISSION";
label variable CAOTHER "CANCER DIAGNOSED - OTHER (>17)";
label variable OTHRAGED "AGE OF DIAGNOSIS-OTHER CANCER";
label variable OTHRREMS "OTHER CANCER IN REMISSION";
label variable CAOVARY "CANCER DIAGNOSED - OVARY (>17)";
label variable OVRYAGED "AGE OF DIAGNOSIS-OVARIAN CANCER";
label variable OVRYREMS "OVARIAN CANCER IN REMISSION";
label variable CAPANCRS "CANCER DIAGNOSED - PANCREAS (>17)";
label variable PANCAGED "AGE OF DIAGNOSIS-PANCREATIC CANCER";
label variable PANCREMS "PANCREATIC CANCER IN REMISSION";
label variable CAPROSTA "CANCER DIAGNOSED - PROSTATE (>17)";
label variable PRSTAGED "AGE OF DIAGNOSIS-PROSTATE CANCER";
label variable PRSTREMS "PROSTATE CANCER IN REMISSION";
label variable CARECTUM "CANCER DIAGNOSED - RECTUM (>17)";
label variable RECTAGED "AGE OF DIAGNOSIS-RECTAL CANCER";
label variable RECTREMS "RECTAL CANCER IN REMISSION";
label variable CASKINNM "CANCER DIAGNOSED - SKIN-NONMELANO (>17)";
label variable SKNMAGED "AGE OF DIAGNOSIS-SKIN-NONMELANOMA CANCER";
label variable SKNMREMS "SKIN-NONMELANOMA CANCER IN REMISSION";
label variable CASKINDK "CANCER DIAGNOSED - SKIN-DKKIND (>17)";
label variable SKDKAGED "AGE OF DIAGNOSIS-SKIN-DK KIND CANCER";
label variable SKDKREMS "SKIN-DK KIND CANCER IN REMISSION";
label variable CASTOMCH "CANCER DIAGNOSED - STOMACH (>17)";
label variable STOMAGED "AGE OF DIAGNOSIS-STOMACH CANCER";
label variable STOMREMS "STOMACH CANCER IN REMISSION";
label variable CATESTIS "CANCER DIAGNOSED - TESTIS (>17)";
label variable TSTSAGED "AGE OF DIAGNOSIS-TESTICULAR CANCER";
label variable TSTSREMS "TESTICULAR CANCER IN REMISSION";
label variable CATHROAT "CANCER DIAGNOSED - THROAT (>17)";
label variable THRTAGED "AGE OF DIAGNOSIS-THROAT CANCER";
label variable THRTREMS "THROAT CANCER IN REMISSION";
label variable CATHYROD "CANCER DIAGNOSED - THYROID (>17)";
label variable THYRAGED "AGE OF DIAGNOSIS-THYROID CANCER";
label variable THYRREMS "THYROID CANCER IN REMISSION";
label variable CAUTERUS "CANCER DIAGNOSED - UTERUS (>17)";
label variable UTERAGED "AGE OF DIAGNOSIS-UTERINE CANCER";
label variable UTERREMS "UTERINE CANCER IN REMISSION";
label variable DIABDX "DIABETES DIAGNOSIS (>17)";
label variable DIABAGED "AGE OF DIAGNOSIS-DIABETES";
label variable JTPAIN31 "JOINT PAIN LAST 12 MONTHS (>17) - RD 3/1";
label variable JTPAIN53 "JOINT PAIN LAST 12 MONTHS (>17) - RD 5/3";
label variable ARTHDX "ARTHRITIS DIAGNOSIS (>17)";
label variable ARTHTYPE "TYPE OF ARTHRITIS DIAGNOSED (>17)";
label variable ARTHAGED "AGE OF DIAGNOSIS-ARTHRITIS";
label variable ASTHDX "ASTHMA DIAGNOSIS";
label variable ASTHAGED "AGE OF DIAGNOSIS-ASTHMA";
label variable ASSTIL31 "DOES PERSON STILL HAVE ASTHMA-RD3/1";
label variable ASSTIL53 "DOES PERSON STILL HAVE ASTHMA - RD 5/3";
label variable ASATAK31 "ASTHMA ATTACK LAST 12 MOS - RD3/1";
label variable ASATAK53 "ASTHMA ATTACK LAST 12 MOS - RD 5/3";
label variable ASTHEP31 "WHEN WAS LAST EPISODE OF ASTHMA - RD 3/1";
label variable ASTHEP53 "WHEN WAS LAST EPISODE OF ASTHMA - RD 5/3";
label variable ASACUT53 "USED ACUTE PRES INHALER LAST 3 MOS-RD5/3";
label variable ASMRCN53 "USED>3ACUTE CN PRES INH LAST 3 MOS-RD5/3";
label variable ASPREV53 "EVER USED PREV DAILY ASTHMA MEDS -RD 5/3";
label variable ASDALY53 "NOW TAKE PREV DAILY ASTHMA MEDS - RD 5/3";
label variable ASPKFL53 "HAVE PEAK FLOW METER AT HOME - RD 5/3";
label variable ASEVFL53 "EVER USED PEAK FLOW METER - RD 5/3";
label variable ASWNFL53 "WHEN LAST USED PEAK FLOW METER - RD 5/3";
label variable ADHDADDX "ADHDADD DIAGNOSIS (5-17)";
label variable ADHDAGED "AGE OF DIAGNOSIS-ADHD/ADD";
label variable PREGNT31 "PREGNANT DURING REF PERIOD - RD 3/1";
label variable PREGNT42 "PREGNANT DURING REF PERIOD - RD 4/2";
label variable PREGNT53 "PREGNANT DURING REF PERIOD - RD 5/3";
label variable IADLHP31 "IADL SCREENER - RD 3/1";
label variable IADLHP42 "IADL SCREENER - RD 4/2";
label variable IADLHP53 "IADL SCREENER - RD 5/3";
label variable IADL3M31 "IADL HELP 3+ MONTHS - RD 3/1";
label variable IADL3M42 "IADL HELP 3+ MONTHS - RD 4/2";
label variable IADL3M53 "IADL HELP 3+ MONTHS - RD 5/3";
label variable ADLHLP31 "ADL SCREENER - RD 3/1";
label variable ADLHLP42 "ADL SCREENER - RD 4/2";
label variable ADLHLP53 "ADL SCREENER - RD 5/3";
label variable ADL3MO31 "ADL HELP 3+ MONTHS - RD 3/1";
label variable ADL3MO42 "ADL HELP 3+ MONTHS - RD 4/2";
label variable ADL3MO53 "ADL HELP 3+ MONTHS - RD 5/3";
label variable AIDHLP31 "USED ASSISTIVE DEVICES - RD 3/1";
label variable AIDHLP53 "USED ASSISTIVE DEVICES - RD 5/3";
label variable WLKLIM31 "LIMITATION IN PHYSICAL FUNCTIONING-RD3/1";
label variable WLKLIM53 "LIMITATION IN PHYSICAL FUNCTIONING-RD5/3";
label variable LFTDIF31 "DIFFICULTY LIFTING 10 POUNDS - RD 3/1";
label variable LFTDIF53 "DIFFICULTY LIFTING 10 POUNDS - RD 5/3";
label variable STPDIF31 "DIFFICULTY WALKING UP 10 STEPS - RD 3/1";
label variable STPDIF53 "DIFFICULTY WALKING UP 10 STEPS - RD 5/3";
label variable WLKDIF31 "DIFFICULTY WALKING 3 BLOCKS - RD 3/1";
label variable WLKDIF53 "DIFFICULTY WALKING 3 BLOCKS - RD 5/3";
label variable MILDIF31 "DIFFICULTY WALKING A MILE - RD 3/1";
label variable MILDIF53 "DIFFICULTY WALKING A MILE - RD 5/3";
label variable STNDIF31 "DIFFICULTY STANDING 20 MINUTES - RD 3/1";
label variable STNDIF53 "DIFFICULTY STANDING 20 MINUTES - RD 5/3";
label variable BENDIF31 "DIFFICULTY BENDING/STOOPING - RD 3/1";
label variable BENDIF53 "DIFFICULTY BENDING/STOOPING - RD 5/3";
label variable RCHDIF31 "DIFFICULTY REACHING OVERHEAD - RD 3/1";
label variable RCHDIF53 "DIFFICULTY REACHING OVERHEAD - RD 5/3";
label variable FNGRDF31 "DIFFICULTY USING FINGERS TO GRASP-RD 3/1";
label variable FNGRDF53 "DIFFICULTY USING FINGERS TO GRASP-RD 5/3";
label variable WLK3MO31 "PHYS FUNCTIONING HELP 3+ MONTHS - RD 3/1";
label variable WLK3MO53 "PHYS FUNCTIONING HELP 3+ MONTHS - RD 5/3";
label variable ACTLIM31 "ANY LIMITATION WORK/HOUSEWRK/SCHL-RD 3/1";
label variable ACTLIM53 "ANY LIMITATION WORK/HOUSEWRK/SCHL-RD 5/3";
label variable WRKLIM31 "WORK LIMITATION - RD 3/1";
label variable WRKLIM53 "WORK LIMITATION - RD 5/3";
label variable HSELIM31 "HOUSEWORK LIMITATION - RD 3/1";
label variable HSELIM53 "HOUSEWORK LIMITATION - RD 5/3";
label variable SCHLIM31 "SCHOOL LIMITATION - RD 3/1";
label variable SCHLIM53 "SCHOOL LIMITATION - RD 5/3";
label variable UNABLE31 "COMPLETELY UNABLE TO DO ACTIVITY-RD 3/1";
label variable UNABLE53 "COMPLETELY UNABLE TO DO ACTIVITY-RD 5/3";
label variable SOCLIM31 "SOCIAL LIMITATIONS - RD 3/1";
label variable SOCLIM53 "SOCIAL LIMITATIONS - RD 5/3";
label variable COGLIM31 "COGNITIVE LIMITATIONS - RD 3/1";
label variable COGLIM53 "COGNITIVE LIMITATIONS - RD 5/3";
label variable WRGLAS42 "WEARS EYEGLASSES OR CONTACTS - RD 4/2";
label variable SEEDIF42 "DIFFCLTY SEEING W/GLASSES/CNTCTS-RD 4/2";
label variable BLIND42 "PERSON IS BLIND - RD 4/2";
label variable READNW42 "CAN READ NEWSPRNT W/GLASSES/CNTCTS-RD4/2";
label variable RECPEP42 "CAN RECGNZE PEOPLE W/GLASSES/CNTCTS-R4/2";
label variable VISION42 "VISION IMPAIRMENT (SUMMARY) - RD 4/2";
label variable HEARAD42 "PERSON WEARS HEARING AID - RD 4/2";
label variable HEARDI42 "ANY DIFFCLTY HEARING W/HEARING AID-RD4/2";
label variable DEAF42 "PERSON IS DEAF - RD 4/2";
label variable HEARMO42 "CAN HEAR MOST CONVERSATION - RD 4/2";
label variable HEARSM42 "CAN HEAR SOME CONVERSATION - RD 4/2";
label variable HEARNG42 "HEARING IMPAIRMENT (SUMMARY) - RD 4/2";
label variable ANYLIM10 "ANY LIMITATION IN P14R3,4,5/P15R1,2,3";
label variable LSHLTH42 "LESS HEALTHY THAN OTHR CHILD (0-17)-R4/2";
label variable NEVILL42 "NEVER BEEN SERIOUSLY ILL (0-17)-R4/2";
label variable SICEAS42 "CHILD GETS SICK EASILY (0-17)-R4/2";
label variable HLTHLF42 "CHILD WILL HAVE HEALTHY LIFE (0-17)-R4/2";
label variable WRHLTH42 "WORRY MORE ABOUT HEALTH (0-17)-R4/2";
label variable CHPMED42 "CSHCN:CHILD NEEDS PRESCRB MED(0-17)-R4/2";
label variable CHPMHB42 "CSHCN:PMED FOR HLTH/BEHV COND(0-17)-R4/2";
label variable CHPMCN42 "CSHCN:PMED COND LAST 12+ MOS (0-17)-R4/2";
label variable CHSERV42 "CSHCN:CHLD NEEDS MED&OTH SERV(0-17)-R4/2";
label variable CHSRHB42 "CSHCN:SERV FOR HLTH/BEHV COND(0-17)-R4/2";
label variable CHSRCN42 "CSHCN:SERV COND LAST 12+ MOS (0-17)-R4/2";
label variable CHLIMI42 "CSHCN:LIMITED IN ANY WAY (0-17)-R4/2";
label variable CHLIHB42 "CSHCN:LIMT FOR HLTH/BEHV COND(0-17)-R4/2";
label variable CHLICO42 "CSHCN:LIMIT COND LAST 12+MOS (0-17)-R4/2";
label variable CHTHER42 "CSHCN:CHLD NEEDS SPEC THERAPY(0-17)-R4/2";
label variable CHTHHB42 "CSHCN:SPEC THER FOR HLTH+COND(0-17)-R4/2";
label variable CHTHCO42 "CSHCN:THER COND LAST 12+ MOS (0-17)-R4/2";
label variable CHCOUN42 "CSHCN:CHILD NEEDS COUNSELING (0-17)-R4/2";
label variable CHEMPB42 "CSHCN:COUNS PROB LAST 12+MOS (0-17)-R4/2";
label variable CSHCN42 "CSHCN:CHILD W/SPEC HC NEEDS (0-17)-R4/2";
label variable MOMPRO42 "PROBLEM GETTING ALONG W/MOM (5-17)-R4/2";
label variable DADPRO42 "PROBLEM GETTING ALONG W/DAD (5-17)-R4/2";
label variable UNHAP42 "PROBLEM FEELING UNHAPPY/SAD (5-17)-R4/2";
label variable SCHLBH42 "PROBLEM BEHAVIOR AT SCHOOL (5-17)-R4/2";
label variable HAVFUN42 "PROBLEM HAVING FUN (5-17) - R4/2";
label variable ADUPRO42 "PRBLM GETTING ALONG W/ADULTS (5-17)-R4/2";
label variable NERVAF42 "PRBLM FEELING NERVOUS/AFRAID (5-17)-R4/2";
label variable SIBPRO42 "PRBLM GETTING ALONG W/SIBS (5-17)-R4/2";
label variable KIDPRO42 "PRBLM GETTING ALONG W/KIDS (5-17)-R4/2";
label variable SPRPRO42 "PROBLEM W/SPORTS/HOBBIES (5-17)-R4/2";
label variable SCHPRO42 "PROBLEM WITH SCHOOLWORK (5-17)-R4/2";
label variable HOMEBH42 "PROBLEM W/BEHAVIOR AT HOME (5-17)-R4/2";
label variable TRBLE42 "PRBLM STAY OUT OF TROUBLE (5-17)-R4/2";
label variable CHILCR42 "CAHPS:12MOS:ILL/INJ NEED CARE(0-17)-R4/2";
label variable CHILWW42 "CAHPS:12MOS:ILL CARE WHN WNTD(0-17)-R4/2";
label variable CHRTCR42 "CAHPS:12MOS:MAKE ROUT CARE APT(0-17)R4/2";
label variable CHRTWW42 "CAHPS:12MOS:ROUT APT WHN WNTD(0-17)-R4/2";
label variable CHAPPT42 "CAHPS:12MOS:# OF OFF/CLIN APTS(0-17)R4/2";
label variable CHNDCR42 "CAHPS:12MOS:NEED ANY CARE/TRT(0-17)-R4/2";
label variable CHENEC42 "CAHPS:12MOS:EASY GET NEC CARE (0-17)R4/2";
label variable CHLIST42 "CAHPS:12MOS:CHLD DR LSN TO YOU(0-17)R4/2";
label variable CHEXPL42 "CAHPS:12MOS:CHLD DR EXPL THNG(0-17)R4/2";
label variable CHRESP42 "CAHPS:12MOS:CHLD S DR SHW RESP(0-17)R4/2";
label variable CHPRTM42 "CAHPS:12MOS:CHILD DR ENGH TIME(0-17)R4/2";
label variable CHHECR42 "CAHPS:12MOS:RATE CHLD HLT CARE(0-17)R4/2";
label variable CHSPEC42 "CAHPS:12MOS:CHLD NEEDED SPEC(0-17)R4/2";
label variable CHEYRE42 "CAHPS:12MOS:ESY W/RFR TO SPEC(0-17)-R4/2";
label variable MESHGT42 "DOCTOR EVER MEASURED HEIGHT (0-17)-R4/2";
label variable WHNHGT42 "WHEN DOCTOR MEASURED HEIGHT (0-17)-R4/2";
label variable MESWGT42 "DOCTOR EVER MEASURED WEIGHT (0-17)-R4/2";
label variable WHNWGT42 "WHEN DOCTOR MEASURED WEIGHT (0-17)-R4/2";
label variable CHBMIX42 "CHILD S BODY MASS INDEX (6-17)-R4/2";
label variable MESVIS42 "DOCTOR CHECKED CHILD S VISION (3-6)-R4/2";
label variable MESBPR42 "DR CHECKED BLOOD PRESSURE (2-17)-R4/2";
label variable WHNBPR42 "WHEN DR CHECKED BLOOD PRESS (2-17)-R4/2";
label variable DENTAL42 "DR ADVISE REG DENTAL CHECKUP (2-17)-R4/2";
label variable WHNDEN42 "WHEN DR ADVISE DENT CHECKUP (2-17)-R4/2";
label variable EATHLT42 "DR ADVISE EAT HEALTHY (2-17)-R4/2";
label variable WHNEAT42 "WHEN DR ADVISE EAT HEALTHY (2-17)-R4/2";
label variable PHYSCL42 "DR ADVISE EXERCISE (2-17)-R4/2";
label variable WHNPHY42 "WHEN DR ADVISE EXERCISE (2-17)-R4/2";
label variable SAFEST42 "DR ADVISE CHLD SAFETY SEAT (WT<=40)-R4/2";
label variable WHNSAF42 "WHEN DR ADVISE SAFETY SEAT (WT<=40)-R4/2";
label variable BOOST42 "DR ADVISE BOOSTER SEAT (40<WT<=80)-R4/2";
label variable WHNBST42 "WHN DR ADVISE BOOST SEAT(40<WT<=80)-R4/2";
label variable LAPBLT42 "DR ADVISE LAP/SHOULDER BELT (80<WT)-R4/2";
label variable WHNLAP42 "WHN DR ADVISE LAP/SHLDR BLT (80<WT)-R4/2";
label variable HELMET42 "DR ADVISE BIKE HELMET (2-17)-R4/2";
label variable WHNHEL42 "WHEN DR ADVISE BIKE HELMET (2-17)-R4/2";
label variable NOSMOK42 "DR ADVISE SMKG IN HOME IS BAD(0-17)-R4/2";
label variable WHNSMK42 "WHN DR ADVIS SMKG IN HOME BAD(0-17)-R4/2";
label variable TIMALN42 "DOCTOR SPEND ANY TIME ALONE (12-17)-R4/2";
label variable DENTCK53 "HOW OFTEN DENTAL CHECK-UP - RD 5/3";
label variable BPCHEK53 "TIME SNCE LST BLOOD PRES CHK (>17)-RD5/3";
label variable BPMONT53 "# MOS SNCE LST BLOOD PRES CHK (>17)-R5/3";
label variable CHOLCK53 "HOW LNG CHOLEST LST CHCK (>17) - RD 5/3";
label variable CHECK53 "HOW LNG LST ROUTNE CHECKUP (>17)-RD 5/3";
label variable NOFAT53 "RESTRICT HGH FAT/CHOLES FOOD (>17)-RD5/3";
label variable EXRCIS53 "ADVISED TO EXERCISE MORE (>17) - RD 5/3";
label variable FLUSHT53 "HOW LNG LAST FLU VACINATION (>17)-RD 5/3";
label variable ASPRIN53 "TKE ASPIRN EVERY (OTHR) DAY (>17)-RD 5/3";
label variable NOASPR53 "TAKING ASPIRIN UNSAFE (>17) - RD 5/3";
label variable STOMCH53 "TKE ASPRN UNSAFE B/C STOMCH (>17)-RD 5/3";
label variable LSTETH53 "LOST ALL UPPR AND LOWR TEETH (>17)-RD5/3";
label variable PSA53 "HOW LONG SINCE LAST PSA (>39) - RD 5/3";
label variable HYSTER53 "HAD A HYSTERECTOMY (>17) - RD 5/3";
label variable PAPSMR53 "HOW LNG LST PAP SMEAR TST (>17) - RD 5/3";
label variable BRSTEX53 "HOW LNG SNCE LST BREAST EXAM (>17)-RD5/3";
label variable MAMOGR53 "HOW LNG SNCE LST MAMMOGRAM (>29) - RD5/3";
label variable BSTST53 "MST RCNT BLD STOOL TST HME KIT(>39)-R5/3";
label variable BSTSRE53 "RSN HAVE BLD STOOL TST (>39)-R5/3";
label variable CLNTST53 "MOST RECENT COLONOSCOPY (>39) - R5/3";
label variable CLNTRE53 "RSN HAVE COLONOSCOPY (>39)-R5/3";
label variable SGMTST53 "MOST RECENT SIGMOIDOSCOPY (>39) - R5/3";
label variable SGMTRE53 "RSN HAVE SIGMOIDOSCOPY (>39)-R5/3";
label variable PHYACT53 "MOD/VIG PHYS ACTIV 3X WK (>17) - RD 5/3";
label variable BMINDX53 "ADULT BODY MASS INDEX (>17) - RD 5/3";
label variable SEATBE53 "WEARS SEAT BELT (>15) - RD 5/3";
label variable SAQELIG "ELIGIBILITY STATUS FOR SAQ";
label variable ADPRX42 "SAQ: RELATIONSHIP OF PROXY TO ADULT";
label variable ADILCR42 "SAQ 12MOS: ILL/INJURY NEEDING IMMED CARE";
label variable ADILWW42 "SAQ 12 MOS: GOT CARE WHEN NEEDED ILL/INJ";
label variable ADRTCR42 "SAQ 12 MOS: MADE APPT ROUTINE MED CARE";
label variable ADRTWW42 "SAQ 12 MOS: GOT MED APPT WHEN WANTED";
label variable ADAPPT42 "SAQ 12 MOS: # VISITS TO MED OFF FOR CARE";
label variable ADNDCR42 "SAQ 12MOS: NEED ANY CARE, TEST, TREATMNT";
label variable ADEGMC42 "SAQ 12MOS: EASY GETTING NEEDED MED CARE";
label variable ADLIST42 "SAQ 12 MOS: DOCTOR LISTENED TO YOU";
label variable ADEXPL42 "SAQ 12 MOS: DOC EXPLAINED SO UNDERSTOOD";
label variable ADRESP42 "SAQ 12 MOS: DR SHOWED RESPECT";
label variable ADPRTM42 "SAQ 12 MOS: DR SPENT ENUF TIME WITH YOU";
label variable ADHECR42 "SAQ 12 MOS: RATING OF HEALTH CARE";
label variable ADSMOK42 "SAQ: CURRENTLY SMOKE";
label variable ADNSMK42 "SAQ 12MOS: DR ADVISED TO QUIT SMOKING";
label variable ADDRBP42 "SAQ 2 YRS: DR CHECKED BLOOD PRESSURE";
label variable ADSPEC42 "SAQ 12 MOS: NEEDED TO SEE SPECIALIST";
label variable ADSPRF42 "SAQ 12MOS: HOW ESY GETTING SPEC REFERRAL";
label variable ADGENH42 "SAQ: HEALTH IN GENERAL SF-12V2";
label variable ADDAYA42 "SAQ: HLTH LIMITS MOD ACTIVITIES SF-12V2";
label variable ADCLIM42 "SAQ: HLTH LIMITS CLIMBING STAIRS SF-12V2";
label variable ADPALS42 "SAQ 4WKS:ACCMP LESS B/C PHY PRBS SF-12V2";
label variable ADPWLM42 "SAQ 4WKS:WORK LIMT B/C PHY PROBS SF-12V2";
label variable ADMALS42 "SAQ 4WKS:ACCMP LESS B/C MNT PRBS SF-12V2";
label variable ADMWLM42 "SAQ 4WKS:WORK LIMT B/C MNT PROBS SF-12V2";
label variable ADPAIN42 "SAQ 4WKS:PAIN LIMITS NORMAL WORK SF-12V2";
label variable ADCAPE42 "SAQ 4WKS: FELT CALM/PEACEFUL SF-12V2";
label variable ADNRGY42 "SAQ 4WKS: HAD A LOT OF ENERGY SF-12V2";
label variable ADDOWN42 "SAQ 4WKS: FELT DOWNHEARTED/DEPR SF-12V2";
label variable ADSOCA42 "SAQ 4WKS: HLTH STOPPED SOC ACTIV SF-12V2";
label variable PCS42 "SAQ:PHY COMPONENT SUMMRY SF-12V2 IMPUTED";
label variable MCS42 "SAQ:MNT COMPONENT SUMMRY SF-12V2 IMPUTED";
label variable SFFLAG42 "SAQ: PCS/MCS IMPUTATION FLAG SF-12V2";
label variable ADNERV42 "SAQ 30 DAYS: HOW OFTEN FELT NERVOUS";
label variable ADHOPE42 "SAQ 30 DAYS: HOW OFTEN FELT HOPELESS";
label variable ADREST42 "SAQ 30 DAYS: HOW OFTEN FELT RESTLESS";
label variable ADSAD42 "SAQ 30 DAYS: HOW OFTEN FELT SAD";
label variable ADEFRT42 "SAQ 30 DAYS: HOW OFTN EVRYTHNG AN EFFORT";
label variable ADWRTH42 "SAQ 30 DAYS: HOW OFTEN FELT WORTHLESS";
label variable K6SUM42 "SAQ 30 DAYS: OVERALL RATING OF FEELINGS";
label variable ADINTR42 "SAQ 2 WKS: LITTLE INTEREST IN THINGS";
label variable ADDPRS42 "SAQ 2 WKS: FELT DOWN/DEPRESSED/HOPELESS";
label variable PHQ242 "SAQ 2 WKS: OVERALL RATING OF FEELINGS";
label variable ADINSA42 "SAQ: DO NOT NEED HEALTH INSURANCE";
label variable ADINSB42 "SAQ: HEALTH INSURANCE NOT WORTH COST";
label variable ADRISK42 "SAQ: MORE LIKELY TO TAKE RISKS";
label variable ADOVER42 "SAQ: CAN OVERCOME ILLS WITHOUT MED HELP";
label variable ADCMPM42 "SAQ: DATE COMPLETED - MONTH";
label variable ADCMPD42 "SAQ: DATE COMPLETED - DAY";
label variable ADCMPY42 "SAQ: DATE COMPLETED - YEAR";
label variable ADLANG42 "SAQ: LANGUAGE OF SAQ INTERVIEW";
label variable DSDIA53 "DCS: DIABETES DIAGNOSIS BY HEALTH PROF";
label variable DSA1C53 "DCS: TIMES TESTED FOR A-ONE-C IN 2010";
label variable DSFT1153 "DCS: HAD FEET CHECKED DURING 2011";
label variable DSFT1053 "DCS: HAD FEET CHECKED DURING 2010";
label variable DSFT0953 "DCS: HAD FEET CHECKED DURING 2009";
label variable DSFB0953 "DCS: HAD FEET CHECKED BEFORE 2009";
label variable DSFTNV53 "DCS: NEVER HAD FEET CHECKED";
label variable DSEY1153 "DCS: DILATED EYE EXAM IN 2011";
label variable DSEY1053 "DCS: DILATED EYE EXAM IN 2010";
label variable DSEY0953 "DCS: DILATED EYE EXAM IN 2009";
label variable DSEB0953 "DCS: DILATED EYE EXAM BEFORE 2009";
label variable DSEYNV53 "DCS: NEVER HAD DILATED EYE EXAM";
label variable DSCH1153 "DCS: BLOOD CHOLESTEROL CHECKED IN 2011";
label variable DSCH1053 "DCS: BLOOD CHOLESTEROL CHECKED IN 2010";
label variable DSCH0953 "DCS: BLOOD CHOLESTEROL CHECKED IN 2009";
label variable DSCB0953 "DCS: BLOOD CHOLESTEROL CHECKED BEF 2009";
label variable DSCHNV53 "DCS: NEVER HAD BLOOD CHOLESTEROL CHECKED";
label variable DSFL1153 "DCS: GOT FLU VACCINATION IN 2011";
label variable DSFL1053 "DCS: GOT FLU VACCINATION IN 2010";
label variable DSFL0953 "DCS: GOT FLU VACCINATION IN 2009";
label variable DSVB0953 "DCS: GOT FLU VACCINATION BEFORE 2009";
label variable DSFLNV53 "DCS: NEVER GOT FLU VACCINATION";
label variable DSKIDN53 "DCS: HAS DIABETES CAUSED KIDNEY PROBLEMS";
label variable DSEYPR53 "DCS: HAS DIABETES CAUSED EYE PROBS";
label variable DSDIET53 "DCS: TREAT DIABETES W/DIET MODIFICATION";
label variable DSMED53 "DCS: TREAT DIABETES W/MEDS BY MOUTH";
label variable DSINSU53 "DCS: TREAT DIABETES W/INSULIN INJECTIONS";
label variable DSCPCP53 "DCS: LEARNED CARE FROM PRIMARY CARE PROV";
label variable DSCNPC53 "DCS: LEARNED CARE FROM OTHER PROVIDER";
label variable DSCPHN53 "DCS: LEARN CARE FROM PHONE CALL W/PROV";
label variable DSCINT53 "DCS: LEARNED CARE FROM READING INTERNET";
label variable DSCGRP53 "DCS: LEARNED CARE BY TAKING GROUP CLASS";
label variable DSCONF53 "DCS: CONFIDENT TAKING CARE OF DIABETES";
label variable DSPRX53 "DCS: WAS RESPONDENT A PROXY";
label variable DDNWRK31 "# DAYS MISSED WORK DUE TO ILL/INJ (RD31)";
label variable DDNWRK42 "# DAYS MISSED WORK DUE TO ILL/INJ (RD42)";
label variable DDNWRK53 "# DAYS MISSED WORK DUE TO ILL/INJ (RD53)";
label variable WKINBD31 "# DAYS MISSED WORK STAYED IN BED (RD31)";
label variable WKINBD42 "# DAYS MISSED WORK STAYED IN BED (RD42)";
label variable WKINBD53 "# DAYS MISSED WORK STAYED IN BED (RD53)";
label variable DDNSCL31 "# DAYS MISSD SCHOOL DUE TO ILL/INJ(RD31)";
label variable DDNSCL42 "# DAYS MISSD SCHOOL DUE TO ILL/INJ(RD42)";
label variable DDNSCL53 "# DAYS MISSD SCHOOL DUE TO ILL/INJ(RD53)";
label variable SCLNBD31 "# DAYS MISSED SCHOOL STAYD IN BED (RD31)";
label variable SCLNBD42 "# DAYS MISSED SCHOOL STAYD IN BED (RD42)";
label variable SCLNBD53 "# DAYS MISSED SCHOOL STAYD IN BED (RD53)";
label variable DDBDYS31 "# OTH DAY SPENT IN BED SINCE START(RD31)";
label variable DDBDYS42 "# OTH DAY SPENT IN BED SINCE START(RD42)";
label variable DDBDYS53 "# OTH DAY SPENT IN BED SINCE START(RD53)";
label variable OTHDYS31 "MISS ANY WORK DAY TO CARE FOR OTH (RD31)";
label variable OTHDYS42 "MISS ANY WORK DAY TO CARE FOR OTH (RD42)";
label variable OTHDYS53 "MISS ANY WORK DAY TO CARE FOR OTH (RD53)";
label variable OTHNDD31 "# DAY MISSED WORK TO CARE FOR OTH (RD31)";
label variable OTHNDD42 "# DAY MISSED WORK TO CARE FOR OTH (RD42)";
label variable OTHNDD53 "# DAY MISSED WORK TO CARE FOR OTH (RD53)";
label variable ACCELI42 "PERS ELIGIBLE FOR ACCESS SUPPLEMENT-R4/2";
label variable LANGHM42 "AC01 LANGUAGE SPOKEN MOST IN HOME-R4/2";
label variable ENGCMF42 "AC02 WHOLE HH COMFRTBLE SPEAKNG ENG-R4/2";
label variable ENGSPK42 "AC02A NOT COMFRTBLE SPEAKNG ENGLISH-R4/2";
label variable USBORN42 "AC03 WAS PERSON BORN IN US-R4/2";
label variable USLIVE42 "AC04 # YRS PERSON LIVED IN US-R4/2";
label variable HAVEUS42 "AC05 DOES PERSON HAVE USC PROVIDER-R4/2";
label variable YNOUSC42 "AC07 MAIN REAS PERS DOESNT HAVE USC-R4/2";
label variable NOREAS42 "AC08 OTH REAS NO USC:NO OTH REASONS-R4/2";
label variable SELDSI42 "AC08 OTH REAS NO USC:SELDM/NEV SICK-R4/2";
label variable NEWARE42 "AC08 OTH REAS NO USC:RECENTLY MOVED-R4/2";
label variable DKWHRU42 "AC08 OTH REAS NO USC:DK WHERE TO GO-R4/2";
label variable USCNOT42 "AC08 OTH REAS NO USC: USC NOT AVAIL-R4/2";
label variable PERSLA42 "AC08 OTH REAS NO USC: LANGUAGE-R4/2";
label variable DIFFPL42 "AC08 OTH REAS NO USC:DIFFRNT PLACES-R4/2";
label variable INSRPL42 "AC08 OTH REAS NO USC:JUST CHNGD INS-R4/2";
label variable MYSELF42 "AC08 OTH REAS NO USC:NO DOC/TRT SLF-R4/2";
label variable CARECO42 "AC08 OTH REAS NO USC:COST OF MED CR-R4/2";
label variable NOHINS42 "AC08 OTH REAS NO USC:NO HLTH INSRNC-R4/2";
label variable OTHINS42 "AC08 OTH REAS NO USC: INS RELATED-R4/2";
label variable JOBRSN42 "AC08 OTH REAS NO USC: JOB RELATED-R4/2";
label variable NEWDOC42 "AC08 OTH REAS NO USC: LOOKNG FOR DR-R4/2";
label variable DOCELS42 "AC08 OTH REAS NO USC: DR ELSEWHERE-R4/2";
label variable NOLIKE42 "AC08 OTH REAS NO USC: DONT LIKE DRS-R4/2";
label variable KNOWDR42 "AC08 OTH REAS NO USC: KNOWS/IS A DR-R4/2";
label variable ONJOB42 "AC08 OTH REAS NO USC: DR AT WORK-R4/2";
label variable NOGODR42 "AC08 OTH REAS NO USC: WONT GO TO DR-R4/2";
label variable TRANS42 "AC08 OTH REAS NO USC: TRANSPRT/TIME-R4/2";
label variable CLINIC42 "AC08 OTH REAS NO USC: HOSP/ER/CLNIC-R4/2";
label variable OTHREA42 "AC08 OTH REAS NO USC: OTHER REASON-R4/2";
label variable PROVTY42 "PROVIDER TYPE-R4/2";
label variable PLCTYP42 "USC TYPE OF PLACE-R4/2";
label variable GOTOUS42 "AC12 HOW DOES PERS GET TO USC PROV-R4/2";
label variable TMTKUS42 "AC13 HOW LONG IT TAKES GET TO USC-R4/2";
label variable DFTOUS42 "AC14 HOW DIFFICULT IS IT GET TO USC-R4/2";
label variable TYPEPE42 "USC TYPE OF PROVIDER-R4/2";
label variable LOCATN42 "USC LOCATION-R4/2";
label variable HSPLAP42 "AC18 IS PROVIDER HISPANIC OR LATINO-R4/2";
label variable WHITPR42 "AC19 IS PROVIDER WHITE-R4/2";
label variable BLCKPR42 "AC19 IS PROVIDER BLACK/AFRICAN AMER-R4/2";
label variable ASIANP42 "AC19 IS PROVIDER ASIAN-R4/2";
label variable NATAMP42 "AC19 IS PROVIDER NATIVE AMERICAN-R4/2";
label variable PACISP42 "AC19 IS PROVIDER OTH PACIFIC ISLNDR-R4/2";
label variable OTHRCP42 "AC19 IS PROVIDER SOME OTHER RACE-R4/2";
label variable GENDRP42 "AC20 IS PROVIDER MALE OR FEMALE-R4/2";
label variable MINORP42 "AC22 GO TO USC FOR NEW HEALTH PROB-R4/2";
label variable PREVEN42 "AC22 GO TO USC FOR PRVNTVE HLT CARE-R4/2";
label variable REFFRL42 "AC22 GO TO USC FOR REFERRALS-R4/2";
label variable ONGONG42 "AC22 GO TO USC FOR ONGOING HLTH PRB-R4/2";
label variable PHNREG42 "AC23 HOW DIFF CONTACT USC BY PHONE-R4/2";
label variable OFFHOU42 "AC24 USC HAS OFFCE HRS NGHTS/WKENDS-R4/2";
label variable AFTHOU42 "AC25 HOW DIFF CONTACT USC AFT HOURS-R4/2";
label variable TREATM42 "AC26 PROV ASK ABOUT OTH TREATMENTS-R4/2";
label variable RESPCT42 "AC27 PROV SHOWS RESPECT FOR TRTMNTS-R4/2";
label variable DECIDE42 "AC28 PROV ASKS PERS TO HELP DECIDE-R4/2";
label variable EXPLOP42 "AC30 PROV EXPLNS OPTIONS TO PERS-R4/2";
label variable LANGPR42 "AC31 PROV SPEAKS PERSON S LANGUAGE-R4/2";
label variable MDUNAB42 "UNABLE TO GET NECESSRY MEDICAL CARE-R4/2";
label variable MDUNRS42 "AC34 RSN UNABLE GET NECSRY MED CARE-R4/2";
label variable MDUNPR42 "AC35 PRB NOT GETTING NCSRY MED CARE-R4/2";
label variable MDDLAY42 "DELAYED IN GETTING NECSRY MED CARE-R4/2";
label variable MDDLRS42 "AC38 RSN DLAYD GETTING NEC MED CARE-R4/2";
label variable MDDLPR42 "AC39 PRB DLAYD GETTING NEC MED CARE-R4/2";
label variable DNUNAB42 "UNABLE TO GET NECESSARY DENTAL CARE-R4/2";
label variable DNUNRS42 "AC42 RSN UNABLE GET NCSRY DENT CARE-R4/2";
label variable DNUNPR42 "AC43 PRB UNABLE GET NCSRY DENT CARE-R4/2";
label variable DNDLAY42 "DELAYED IN GETTING NEC DENTAL CARE-R4/2";
label variable DNDLRS42 "AC46 RSN DLAYD GETTNG NEC DENT CARE-R4/2";
label variable DNDLPR42 "AC47 PRB DLAYD GETTNG NEC DENT CARE-R4/2";
label variable PMUNAB42 "UNABLE TO GET NECESSARY PRES MED-R4/2";
label variable PMUNRS42 "AC50 RSN UNABLE TO GET NEC PRES MED-R4/2";
label variable PMUNPR42 "AC51 PRB UNABLE TO GET NEC PRES MED-R4/2";
label variable PMDLAY42 "DELAYED IN GETTING NECSRY PRES MED-R4/2";
label variable PMDLRS42 "AC54 RSN DLAYD GETTING NEC PRES MED-R4/2";
label variable PMDLPR42 "AC55 PRB DLAYD GETTING NEC PRES MED-R4/2";
label variable EMPST31 "EMPLOYMENT STATUS RD 3/1";
label variable EMPST42 "EMPLOYMENT STATUS RD 4/2";
label variable EMPST53 "EMPLOYMENT STATUS RD 5/3";
label variable RNDFLG31 "DATA COLLECTION ROUND FOR RD 3/1 CMJ";
label variable MORJOB31 "HAS MORE THAN ONE JOB RD 3/1 INT DATE";
label variable MORJOB42 "HAS MORE THAN ONE JOB RD 4/2 INT DATE";
label variable MORJOB53 "HAS MORE THAN ONE JOB RD 5/3 INT DATE";
label variable EVRWRK "EVER WRKD FOR PAY IN LIFE AS OF 12/31/10";
label variable HRWG31X "HOURLY WAGE RD 3/1 CMJ (IMP)";
label variable HRWG42X "HOURLY WAGE RD 4/2 CMJ (IMP)";
label variable HRWG53X "HOURLY WAGE RD 5/3 CMJ (IMP)";
label variable HRWGIM31 "HRWG31X IMPUTATION FLAG";
label variable HRWGIM42 "HRWG42X IMPUTATION FLAG";
label variable HRWGIM53 "HRWG53X IMPUTATION FLAG";
label variable HRHOW31 "HOW HOURLY WAGE WAS CALCULATED RD 3/1";
label variable HRHOW42 "HOW HOURLY WAGE WAS CALCULATED RD 4/2";
label variable HRHOW53 "HOW HOURLY WAGE WAS CALCULATED RD 5/3";
label variable DIFFWG31 "PERSONS WAGES DIFFERENT THIS RD31 AT CMJ";
label variable DIFFWG42 "PERSONS WAGES DIFFERENT THIS RD42 AT CMJ";
label variable DIFFWG53 "PERSONS WAGES DIFFERENT THIS RD53 AT CMJ";
label variable NHRWG31 "UPDATED HRLY WAGE RD 3/1 CMJ (EDITED)";
label variable NHRWG42 "UPDATED HRLY WAGE RD 4/2 CMJ (EDITED)";
label variable NHRWG53 "UPDATED HRLY WAGE RD 5/3 CMJ (EDITED)";
label variable HOUR31 "HOURS PER WEEK AT RD 3/1 CMJ";
label variable HOUR42 "HOURS PER WEEK AT RD 4/2 CMJ";
label variable HOUR53 "HOURS PER WEEK AT RD 5/3 CMJ";
label variable TEMPJB31 "IS CMJ A TEMPORARY JOB RD 3/1";
label variable TEMPJB42 "IS CMJ A TEMPORARY JOB RD 4/2";
label variable TEMPJB53 "IS CMJ A TEMPORARY JOB RD 5/3";
label variable SSNLJB31 "IS CMJ A SEASONAL JOB RD 3/1";
label variable SSNLJB42 "IS CMJ A SEASONAL JOB RD 4/2";
label variable SSNLJB53 "IS CMJ A SEASONAL JOB RD 5/3";
label variable SELFCM31 "SELF-EMPLOYED AT RD 3/1 CMJ";
label variable SELFCM42 "SELF-EMPLOYED AT RD 4/2 CMJ";
label variable SELFCM53 "SELF-EMPLOYED AT RD 5/3 CMJ";
label variable DISVW31X "DISAVOWED HEALTH INS AT RD 3/1 CMJ (ED)";
label variable DISVW42X "DISAVOWED HEALTH INS AT RD 4/2 CMJ (ED)";
label variable DISVW53X "DISAVOWED HEALTH INS AT RD 5/3 CMJ (ED)";
label variable CHOIC31 "CHOICE OF HEALTH PLANS AT RD 3/1 CMJ";
label variable CHOIC42 "CHOICE OF HEALTH PLANS AT RD 4/2 CMJ";
label variable CHOIC53 "CHOICE OF HEALTH PLANS AT RD 5/3 CMJ";
label variable INDCAT31 "INDUSTRY GROUP RD 3/1 CMJ";
label variable INDCAT42 "INDUSTRY GROUP RD 4/2 CMJ";
label variable INDCAT53 "INDUSTRY GROUP RD 5/3 CMJ";
label variable NUMEMP31 "NUMBER OF EMPLOYEES AT RD 3/1 CMJ";
label variable NUMEMP42 "NUMBER OF EMPLOYEES AT RD 4/2 CMJ";
label variable NUMEMP53 "NUMBER OF EMPLOYEES AT RD 5/3 CMJ";
label variable MORE31 "RD 3/1 CMJ FIRM HAS MORE THAN 1 LOCAT";
label variable MORE42 "RD 4/2 CMJ FIRM HAS MORE THAN 1 LOCAT";
label variable MORE53 "RD 5/3 CMJ FIRM HAS MORE THAN 1 LOCAT";
label variable UNION31 "UNION STATUS AT RD 3/1 CMJ";
label variable UNION42 "UNION STATUS AT RD 4/2 CMJ";
label variable UNION53 "UNION STATUS AT RD 5/3 CMJ";
label variable NWK31 "REASON NOT WORKING DURING RD 3/1";
label variable NWK42 "REASON NOT WORKING DURING RD 4/2";
label variable NWK53 "REASON NOT WORKING DURING RD 5/3";
label variable CHGJ3142 "CHANGED JOB BETWEEN RD 3/1 AND RD 4/2";
label variable CHGJ4253 "CHANGED JOB BETWEEN RD 4/2 AND RD 5/3";
label variable YCHJ3142 "WHY CHNGD JOB BETWEEN RD 3/1 AND RD 4/2";
label variable YCHJ4253 "WHY CHNGD JOB BETWEEN RD 4/2 AND RD 5/3";
label variable STJBMM31 "MONTH STARTED RD 3/1 CMJ";
label variable STJBDD31 "DAY STARTED RD 3/1 CMJ";
label variable STJBYY31 "YEAR STARTED RD 3/1 CMJ";
label variable STJBMM42 "MONTH STARTED RD 4/2 CMJ";
label variable STJBDD42 "DAY STARTED RD 4/2 CMJ";
label variable STJBYY42 "YEAR STARTED RD 4/2 CMJ";
label variable STJBMM53 "MONTH STARTED RD 5/3 CMJ";
label variable STJBDD53 "DAY STARTED RD 5/3 CMJ";
label variable STJBYY53 "YEAR STARTED RD 5/3 CMJ";
label variable EVRETIRE "PERSON HAS EVER RETIRED";
label variable OCCCAT31 "OCCUPATION GROUP RD 3/1 CMJ";
label variable OCCCAT42 "OCCUPATION GROUP RD 4/2 CMJ";
label variable OCCCAT53 "OCCUPATION GROUP RD 5/3 CMJ";
label variable PAYVAC31 "PAID VACATION AT RD 3/1 CMJ";
label variable PAYVAC42 "PAID VACATION AT RD 4/2 CMJ";
label variable PAYVAC53 "PAID VACATION AT RD 5/3 CMJ";
label variable SICPAY31 "PAID SICK LEAVE AT RD 3/1 CMJ";
label variable SICPAY42 "PAID SICK LEAVE AT RD 4/2 CMJ";
label variable SICPAY53 "PAID SICK LEAVE AT RD 5/3 CMJ";
label variable PAYDR31 "PAID LEAVE TO VISIT DR RD 3/1 CMJ";
label variable PAYDR42 "PAID LEAVE TO VISIT DR RD 4/2 CMJ";
label variable PAYDR53 "PAID LEAVE TO VISIT DR RD 5/3 CMJ";
label variable RETPLN31 "PENSION PLAN AT RD 3/1 CMJ";
label variable RETPLN42 "PENSION PLAN AT RD 4/2 CMJ";
label variable RETPLN53 "PENSION PLAN AT RD 5/3 CMJ";
label variable BSNTY31 "SOLE PROP, PARTNER, CORP, RD 3/1 CMJ";
label variable BSNTY42 "SOLE PROP, PARTNER, CORP, RD 4/2 CMJ";
label variable BSNTY53 "SOLE PROP, PARTNER, CORP, RD 5/3 CMJ";
label variable JOBORG31 "PRIV (PROFIT,NONPROFIT) GOV RD 3/1 CMJ";
label variable JOBORG42 "PRIV (PROFIT,NONPROFIT) GOV RD 4/2 CMJ";
label variable JOBORG53 "PRIV (PROFIT,NONPROFIT) GOV RD 5/3 CMJ";
label variable HELD31X "HEALTH INSUR HELD FROM RD 3/1 CMJ (ED)";
label variable HELD42X "HEALTH INSUR HELD FROM RD 4/2 CMJ (ED)";
label variable HELD53X "HEALTH INSUR HELD FROM RD 5/3 CMJ (ED)";
label variable OFFER31X "HEALTH INSUR OFFERED BY RD 3/1 CMJ (ED)";
label variable OFFER42X "HEALTH INSUR OFFERED BY RD 4/2 CMJ (ED)";
label variable OFFER53X "HEALTH INSUR OFFERED BY RD 5/3 CMJ (ED)";
label variable OFREMP31 "EMPLOYER OFFERS HEALTH INS RD 3/1 CMJ";
label variable OFREMP42 "EMPLOYER OFFERS HEALTH INS RD 4/2 CMJ";
label variable OFREMP53 "EMPLOYER OFFERS HEALTH INS RD 5/3 CMJ";
label variable YNOINS31 "WHY NOT ELIGIBLE HEALTH INS RD 3/1 CMJ";
label variable YNOINS42 "WHY NOT ELIGIBLE HEALTH INS RD 4/2 CMJ";
label variable YNOINS53 "WHY NOT ELIGIBLE HEALTH INS RD 5/3 CMJ";
label variable SSIDIS10 "SSI RECEIPT DUE TO DISABILITY";
label variable AFDC10 "DID PERSON S CHECK INCLUDE TANF";
label variable FILEDR10 "HAS PERSON FILED A FED INCOME TAX RETURN";
label variable WILFIL10 "WILL PERSON FILE FED INCOME TAX RETURN";
label variable FLSTAT10 "PERSON S FILING STATUS";
label variable FILER10 "PRIMARY OR SECONDARY FILER";
label variable JTINRU10 "JOINT FILER S MEMBERSHIP IN RU";
label variable JNTPID10 "PID OF SECONDARY FILER";
label variable CLMDEP10 "DID/WILL PERS CLAIM DEPENDENTS ON RETURN";
label variable DEPDNT10 "PERSON IS FLAGGED A DEPENDENT";
label variable DPINRU10 "DEPENDENTS IN/OUT OF RU";
label variable DPOTSD10 "HOW MANY DEPENDENTS LIVE OUTSIDE RU";
label variable TAXFRM10 "TAX FORM PERSON WILL FILE";
label variable DEDUCT10 "ITEMIZE OR STANDARD DEDUCTION";
label variable TOTDED10 "TOTAL OF ALL ITEMIZED DEDUCTIONS";
label variable CLMHIP10 "DID/WILL PERS DEDUCT HEALTH INSUR. PREM.";
label variable EICRDT10 "DID/WILL PERS RECEIVE EARNED INC CREDIT";
label variable FOODST10 "DID ANYONE PURCHASE FOOD STAMPS";
label variable FOODMN10 "NUMBER OF MONTHS FOOD STAMPS PURCHASED";
label variable FOODVL10 "MONTHLY VALUE OF FOOD STAMPS";
label variable TTLP10X "PERSON S TOTAL INCOME";
label variable FAMINC10 "FAMILY S TOTAL INCOME";
label variable POVCAT10 "FAMILY INC AS % OF POVERTY LINE - CATEGO";
label variable POVLEV10 "FAMILY INC AS % OF POVERTY LINE - CONTIN";
label variable WAGEP10X "PERSON S WAGE INCOME";
label variable WAGIMP10 "WAGE IMPUTATION FLAG";
label variable BUSNP10X "PERSON S BUSINESS INCOME";
label variable BUSIMP10 "BUSINESS INCOME IMPUTATION FLAG";
label variable UNEMP10X "PERSON S UNEMPLOYMENT COMP INCOME";
label variable UNEIMP10 "UNEMPLOYMENT IMPUTATION FLAG";
label variable WCMPP10X "PERSON S WORKERS  COMPENSATION";
label variable WCPIMP10 "WORKERS  COMP IMPUTATION FLAG";
label variable INTRP10X "PERSON S INTEREST INCOME";
label variable INTIMP10 "INTEREST INCOME IMPUTATION FLAG";
label variable DIVDP10X "PERSON S DIVIDEND INCOME";
label variable DIVIMP10 "DIVIDEND INCOME IMPUTATION FLAG";
label variable SALEP10X "PERSON S SALES INCOME";
label variable SALIMP10 "SALES INCOME IMPUTATION FLAG";
label variable PENSP10X "PERSON S PENSION INCOME";
label variable PENIMP10 "PENSION INCOME IMPUTATION FLAG";
label variable SSECP10X "PERSON S SOCIAL SECURITY INCOME";
label variable SSCIMP10 "SOCIAL SECURITY INCOME IMPUTATION FLAG";
label variable TRSTP10X "PERSON S TRUST/RENT INCOME";
label variable TRTIMP10 "TRUST INCOME IMPUTATION FLAG";
label variable VETSP10X "PERSON S VETERAN S INCOME";
label variable VETIMP10 "VETERAN S INCOME IMPUTATION FLAG";
label variable IRASP10X "PERSON S IRA INCOME";
label variable IRAIMP10 "IRA INCOME IMPUTATION FLAG";
label variable REFDP10X "PERSON S REFUND INCOME";
label variable REFIMP10 "REFUND INCOME IMPUTATION FLAG";
label variable ALIMP10X "PERSON S ALIMONY INCOME";
label variable ALIIMP10 "ALIMONY INCOME IMPUTATION FLAG";
label variable CHLDP10X "PERSON S CHILD SUPPORT";
label variable CHLIMP10 "CHILD SUPPORT IMPUTATION FLAG";
label variable CASHP10X "PERSON S OTHER REGULAR CASH CONTRIBUTION";
label variable CSHIMP10 "CASH CONTRIBUTION IMPUTATION FLAG";
label variable SSIP10X "PERSON S SSI";
label variable SSIIMP10 "SSI IMPUTATION FLAG";
label variable PUBP10X "PERSON S PUBLIC ASSISTANCE";
label variable PUBIMP10 "PUBLIC ASSISTANCE IMPUTATION FLAG";
label variable OTHRP10X "PERSON S OTHER INCOME";
label variable OTHIMP10 "OTHER INCOME IMPUTATION FLAG";
label variable HIEUIDX "HIEU IDENTIFIER";
label variable TRIJA10X "COVERED BY TRICARE/CHAMPVA IN JAN10 (ED)";
label variable TRIFE10X "COVERED BY TRICARE/CHAMPVA IN FEB10 (ED)";
label variable TRIMA10X "COVERED BY TRICARE/CHAMPVA IN MAR10 (ED)";
label variable TRIAP10X "COVERED BY TRICARE/CHAMPVA IN APR10(ED)";
label variable TRIMY10X "COVERED BY TRICARE/CHAMPVA IN MAY10 (ED)";
label variable TRIJU10X "COVERED BY TRICARE/CHAMPVA IN JUN10 (ED)";
label variable TRIJL10X "COVERED BY TRICARE/CHAMPVA IN JUL10 (ED)";
label variable TRIAU10X "COVERED BY TRICARE/CHAMPVA IN AUG10 (ED)";
label variable TRISE10X "COVERED BY TRICARE/CHAMPVA IN SEP10 (ED)";
label variable TRIOC10X "COVERED BY TRICARE/CHAMPVA IN OCT10 (ED)";
label variable TRINO10X "COVERED BY TRICARE/CHAMPVA IN NOV10 (ED)";
label variable TRIDE10X "COVERED BY TRICARE/CHAMPVA IN DEC10 (ED)";
label variable MCRJA10 "COVERED BY MEDICARE IN JAN10";
label variable MCRFE10 "COVERED BY MEDICARE IN FEB10";
label variable MCRMA10 "COVERED BY MEDICARE IN MAR10";
label variable MCRAP10 "COVERED BY MEDICARE IN APR10";
label variable MCRMY10 "COVERED BY MEDICARE IN MAY10";
label variable MCRJU10 "COVERED BY MEDICARE IN JUN10";
label variable MCRJL10 "COVERED BY MEDICARE IN JUL10";
label variable MCRAU10 "COVERED BY MEDICARE IN AUG10";
label variable MCRSE10 "COVERED BY MEDICARE IN SEP10";
label variable MCROC10 "COVERED BY MEDICARE IN OCT10";
label variable MCRNO10 "COVERED BY MEDICARE IN NOV10";
label variable MCRDE10 "COVERED BY MEDICARE IN DEC10";
label variable MCRJA10X "COVERED BY MEDICARE IN JAN10 (ED)";
label variable MCRFE10X "COVERED BY MEDICARE IN FEB10 (ED)";
label variable MCRMA10X "COVERED BY MEDICARE IN MAR10 (ED)";
label variable MCRAP10X "COVERED BY MEDICARE IN APR10 (ED)";
label variable MCRMY10X "COVERED BY MEDICARE IN MAY10 (ED)";
label variable MCRJU10X "COVERED BY MEDICARE IN JUN10 (ED)";
label variable MCRJL10X "COVERED BY MEDICARE IN JUL10 (ED)";
label variable MCRAU10X "COVERED BY MEDICARE IN AUG10 (ED)";
label variable MCRSE10X "COVERED BY MEDICARE IN SEP10 (ED)";
label variable MCROC10X "COVERED BY MEDICARE IN OCT10 (ED)";
label variable MCRNO10X "COVERED BY MEDICARE IN NOV10 (ED)";
label variable MCRDE10X "COVERED BY MEDICARE IN DEC10 (ED)";
label variable MCDJA10 "COV BY MEDICAID OR SCHIP IN JAN10";
label variable MCDFE10 "COV BY MEDICAID OR SCHIP IN FEB10";
label variable MCDMA10 "COV BY MEDICAID OR SCHIP IN MAR10";
label variable MCDAP10 "COV BY MEDICAID OR SCHIP IN APR10";
label variable MCDMY10 "COV BY MEDICAID OR SCHIP IN MAY10";
label variable MCDJU10 "COV BY MEDICAID OR SCHIP IN JUN10";
label variable MCDJL10 "COV BY MEDICAID OR SCHIP IN JUL10";
label variable MCDAU10 "COV BY MEDICAID OR SCHIP IN AUG10";
label variable MCDSE10 "COV BY MEDICAID OR SCHIP IN SEP10";
label variable MCDOC10 "COV BY MEDICAID OR SCHIP IN OCT10";
label variable MCDNO10 "COV BY MEDICAID OR SCHIP IN NOV10";
label variable MCDDE10 "COV BY MEDICAID OR SCHIP IN DEC10";
label variable MCDJA10X "COV BY MEDICAID OR SCHIP IN JAN10 (ED)";
label variable MCDFE10X "COV BY MEDICAID OR SCHIP IN FEB10 (ED)";
label variable MCDMA10X "COV BY MEDICAID OR SCHIP IN MAR10 (ED)";
label variable MCDAP10X "COV BY MEDICAID OR SCHIP IN APR10 (ED)";
label variable MCDMY10X "COV BY MEDICAID OR SCHIP IN MAY10 (ED)";
label variable MCDJU10X "COV BY MEDICAID OR SCHIP IN JUN10 (ED)";
label variable MCDJL10X "COV BY MEDICAID OR SCHIP IN JUL10 (ED)";
label variable MCDAU10X "COV BY MEDICAID OR SCHIP IN AUG10 (ED)";
label variable MCDSE10X "COV BY MEDICAID OR SCHIP IN SEP10 (ED)";
label variable MCDOC10X "COV BY MEDICAID OR SCHIP IN OCT10 (ED)";
label variable MCDNO10X "COV BY MEDICAID OR SCHIP IN NOV10 (ED)";
label variable MCDDE10X "COV BY MEDICAID OR SCHIP IN DEC10 (ED)";
label variable OPAJA10 "COV BY OTHER PUBLIC A INS IN JAN10";
label variable OPAFE10 "COV BY OTHER PUBLIC A INS IN FEB10";
label variable OPAMA10 "COV BY OTHER PUBLIC A INS IN MAR10";
label variable OPAAP10 "COV BY OTHER PUBLIC A INS IN APR10";
label variable OPAMY10 "COV BY OTHER PUBLIC A INS IN MAY10";
label variable OPAJU10 "COV BY OTHER PUBLIC A INS IN JUN10";
label variable OPAJL10 "COV BY OTHER PUBLIC A INS IN JUL10";
label variable OPAAU10 "COV BY OTHER PUBLIC A INS IN AUG10";
label variable OPASE10 "COV BY OTHER PUBLIC A INS IN SEP10";
label variable OPAOC10 "COV BY OTHER PUBLIC A INS IN OCT10";
label variable OPANO10 "COV BY OTHER PUBLIC A INS IN NOV10";
label variable OPADE10 "COV BY OTHER PUBLIC A INS IN DEC10";
label variable OPBJA10 "COV BY OTHER PUBLIC B INS IN JAN10";
label variable OPBFE10 "COV BY OTHER PUBLIC B INS IN FEB10";
label variable OPBMA10 "COV BY OTHER PUBLIC B INS IN MAR10";
label variable OPBAP10 "COV BY OTHER PUBLIC B INS IN APR10";
label variable OPBMY10 "COV BY OTHER PUBLIC B INS IN MAY10";
label variable OPBJU10 "COV BY OTHER PUBLIC B INS IN JUN10";
label variable OPBJL10 "COV BY OTHER PUBLIC B INS IN JUL10";
label variable OPBAU10 "COV BY OTHER PUBLIC B INS IN AUG10";
label variable OPBSE10 "COV BY OTHER PUBLIC B INS IN SEP10";
label variable OPBOC10 "COV BY OTHER PUBLIC B INS IN OCT10";
label variable OPBNO10 "COV BY OTHER PUBLIC B INS IN NOV10";
label variable OPBDE10 "COV BY OTHER PUBLIC B INS IN DEC10";
label variable STAJA10 "COVERED BY OTHER STATE PROG IN JAN10";
label variable STAFE10 "COVERED BY OTHER STATE PROG IN FEB10";
label variable STAMA10 "COVERED BY OTHER STATE PROG IN MAR10";
label variable STAAP10 "COVERED BY OTHER STATE PROG IN APR10";
label variable STAMY10 "COVERED BY OTHER STATE PROG IN MAY10";
label variable STAJU10 "COVERED BY OTHER STATE PROG IN JUN10";
label variable STAJL10 "COVERED BY OTHER STATE PROG IN JUL10";
label variable STAAU10 "COVERED BY OTHER STATE PROG IN AUG10";
label variable STASE10 "COVERED BY OTHER STATE PROG IN SEP10";
label variable STAOC10 "COVERED BY OTHER STATE PROG IN OCT10";
label variable STANO10 "COVERED BY OTHER STATE PROG IN NOV10";
label variable STADE10 "COVERED BY OTHER STATE PROG IN DEC10";
label variable PUBJA10X "COVR BY ANY PUBLIC INS IN JAN10 (ED)";
label variable PUBFE10X "COVR BY ANY PUBLIC INS IN FEB10 (ED)";
label variable PUBMA10X "COVR BY ANY PUBLIC INS IN MAR10 (ED)";
label variable PUBAP10X "COVR BY ANY PUBLIC INS IN APR10 (ED)";
label variable PUBMY10X "COVR BY ANY PUBLIC INS IN MAY10 (ED)";
label variable PUBJU10X "COVR BY ANY PUBLIC INS IN JUN10 (ED)";
label variable PUBJL10X "COVR BY ANY PUBLIC INS IN JUL10 (ED)";
label variable PUBAU10X "COVR BY ANY PUBLIC INS IN AUG10 (ED)";
label variable PUBSE10X "COVR BY ANY PUBLIC INS IN SEP10 (ED)";
label variable PUBOC10X "COVR BY ANY PUBLIC INS IN OCT10 (ED)";
label variable PUBNO10X "COVR BY ANY PUBLIC INS IN NOV10 (ED)";
label variable PUBDE10X "COVR BY ANY PUBLIC INS IN DEC10 (ED)";
label variable PEGJA10 "COVERED BY EMPL UNION INS IN JAN10";
label variable PEGFE10 "COVERED BY EMPL UNION INS IN FEB10";
label variable PEGMA10 "COVERED BY EMPL UNION INS IN MAR10";
label variable PEGAP10 "COVERED BY EMPL UNION INS IN APR10";
label variable PEGMY10 "COVERED BY EMPL UNION INS IN MAY10";
label variable PEGJU10 "COVERED BY EMPL UNION INS IN JUN10";
label variable PEGJL10 "COVERED BY EMPL UNION INS IN JUL10";
label variable PEGAU10 "COVERED BY EMPL UNION INS IN AUG10";
label variable PEGSE10 "COVERED BY EMPL UNION INS IN SEP10";
label variable PEGOC10 "COVERED BY EMPL UNION INS IN OCT10";
label variable PEGNO10 "COVERED BY EMPL UNION INS IN NOV10";
label variable PEGDE10 "COVERED BY EMPL UNION INS IN DEC10";
label variable PDKJA10 "COVR BY PRIV INS (SOURCE UNKNWN) JAN10";
label variable PDKFE10 "COVR BY PRIV INS (SOURCE UNKNWN) FEB10";
label variable PDKMA10 "COVR BY PRIV INS (SOURCE UNKNWN) MAR10";
label variable PDKAP10 "COVR BY PRIV INS (SOURCE UNKNWN) APR10";
label variable PDKMY10 "COVR BY PRIV INS (SOURCE UNKNWN) MAY10";
label variable PDKJU10 "COVR BY PRIV INS (SOURCE UNKNWN) JUN10";
label variable PDKJL10 "COVR BY PRIV INS (SOURCE UNKNWN) JUL10";
label variable PDKAU10 "COVR BY PRIV INS (SOURCE UNKNWN) AUG10";
label variable PDKSE10 "COVR BY PRIV INS (SOURCE UNKNWN) SEP10";
label variable PDKOC10 "COVR BY PRIV INS (SOURCE UNKNWN) OCT10";
label variable PDKNO10 "COVR BY PRIV INS (SOURCE UNKNWN) NOV10";
label variable PDKDE10 "COVR BY PRIV INS (SOURCE UNKNWN) DEC10";
label variable PNGJA10 "COVERED BY NONGROUP INS IN JAN10";
label variable PNGFE10 "COVERED BY NONGROUP INS IN FEB10";
label variable PNGMA10 "COVERED BY NONGROUP INS IN MAR10";
label variable PNGAP10 "COVERED BY NONGROUP INS IN APR10";
label variable PNGMY10 "COVERED BY NONGROUP INS IN MAY10";
label variable PNGJU10 "COVERED BY NONGROUP INS IN JUN10";
label variable PNGJL10 "COVERED BY NONGROUP INS IN JUL10";
label variable PNGAU10 "COVERED BY NONGROUP INS IN AUG10";
label variable PNGSE10 "COVERED BY NONGROUP INS IN SEP10";
label variable PNGOC10 "COVERED BY NONGROUP INS IN OCT10";
label variable PNGNO10 "COVERED BY NONGROUP INS IN NOV10";
label variable PNGDE10 "COVERED BY NONGROUP INS IN DEC10";
label variable POGJA10 "COVERED BY OTHER GROUP INS IN JAN10";
label variable POGFE10 "COVERED BY OTHER GROUP INS IN FEB10";
label variable POGMA10 "COVERED BY OTHER GROUP INS IN MAR10";
label variable POGAP10 "COVERED BY OTHER GROUP INS IN APR10";
label variable POGMY10 "COVERED BY OTHER GROUP INS IN MAY10";
label variable POGJU10 "COVERED BY OTHER GROUP INS IN JUN10";
label variable POGJL10 "COVERED BY OTHER GROUP INS IN JUL10";
label variable POGAU10 "COVERED BY OTHER GROUP INS IN AUG10";
label variable POGSE10 "COVERED BY OTHER GROUP INS IN SEP10";
label variable POGOC10 "COVERED BY OTHER GROUP INS IN OCT10";
label variable POGNO10 "COVERED BY OTHER GROUP INS IN NOV10";
label variable POGDE10 "COVERED BY OTHER GROUP INS IN DEC10";
label variable PRSJA10 "COVERED BY SELF-EMP-1 INS IN JAN10";
label variable PRSFE10 "COVERED BY SELF-EMP-1 INS IN FEB10";
label variable PRSMA10 "COVERED BY SELF-EMP-1 INS IN MAR10";
label variable PRSAP10 "COVERED BY SELF-EMP-1 INS IN APR10";
label variable PRSMY10 "COVERED BY SELF-EMP-1 INS IN MAY10";
label variable PRSJU10 "COVERED BY SELF-EMP-1 INS IN JUN10";
label variable PRSJL10 "COVERED BY SELF-EMP-1 INS IN JUL10";
label variable PRSAU10 "COVERED BY SELF-EMP-1 INS IN AUG10";
label variable PRSSE10 "COVERED BY SELF-EMP-1 INS IN SEP10";
label variable PRSOC10 "COVERED BY SELF-EMP-1 INS IN OCT10";
label variable PRSNO10 "COVERED BY SELF-EMP-1 INS IN NOV10";
label variable PRSDE10 "COVERED BY SELF-EMP-1 INS IN DEC10";
label variable POUJA10 "COVERED BY HOLDER OUTSIDE OF RU IN JAN10";
label variable POUFE10 "COVERED BY HOLDER OUTSIDE OF RU IN FEB10";
label variable POUMA10 "COVERED BY HOLDER OUTSIDE OF RU IN MAR10";
label variable POUAP10 "COVERED BY HOLDER OUTSIDE OF RU IN APR10";
label variable POUMY10 "COVERED BY HOLDER OUTSIDE OF RU IN MAY10";
label variable POUJU10 "COVERED BY HOLDER OUTSIDE OF RU IN JUN10";
label variable POUJL10 "COVERED BY HOLDER OUTSIDE OF RU IN JUL10";
label variable POUAU10 "COVERED BY HOLDER OUTSIDE OF RU IN AUG10";
label variable POUSE10 "COVERED BY HOLDER OUTSIDE OF RU IN SEP10";
label variable POUOC10 "COVERED BY HOLDER OUTSIDE OF RU IN OCT10";
label variable POUNO10 "COVERED BY HOLDER OUTSIDE OF RU IN NOV10";
label variable POUDE10 "COVERED BY HOLDER OUTSIDE OF RU IN DEC10";
label variable PRIJA10 "COVERED BY PRIVATE INS IN JAN10";
label variable PRIFE10 "COVERED BY PRIVATE INS IN FEB10";
label variable PRIMA10 "COVERED BY PRIVATE INS IN MAR10";
label variable PRIAP10 "COVERED BY PRIVATE INS IN APR10";
label variable PRIMY10 "COVERED BY PRIVATE INS IN MAY10";
label variable PRIJU10 "COVERED BY PRIVATE INS IN JUN10";
label variable PRIJL10 "COVERED BY PRIVATE INS IN JUL10";
label variable PRIAU10 "COVERED BY PRIVATE INS IN AUG10";
label variable PRISE10 "COVERED BY PRIVATE INS IN SEP10";
label variable PRIOC10 "COVERED BY PRIVATE INS IN OCT10";
label variable PRINO10 "COVERED BY PRIVATE INS IN NOV10";
label variable PRIDE10 "COVERED BY PRIVATE INS IN DEC10";
label variable HPEJA10 "HOLDER OF EMPL UNION INS IN JAN10";
label variable HPEFE10 "HOLDER OF EMPL UNION INS IN FEB10";
label variable HPEMA10 "HOLDER OF EMPL UNION INS IN MAR10";
label variable HPEAP10 "HOLDER OF EMPL UNION INS IN APR10";
label variable HPEMY10 "HOLDER OF EMPL UNION INS IN MAY10";
label variable HPEJU10 "HOLDER OF EMPL UNION INS IN JUN10";
label variable HPEJL10 "HOLDER OF EMPL UNION INS IN JUL10";
label variable HPEAU10 "HOLDER OF EMPL UNION INS IN AUG10";
label variable HPESE10 "HOLDER OF EMPL UNION INS IN SEP10";
label variable HPEOC10 "HOLDER OF EMPL UNION INS IN OCT10";
label variable HPENO10 "HOLDER OF EMPL UNION INS IN NOV10";
label variable HPEDE10 "HOLDER OF EMPL UNION INS IN DEC10";
label variable HPDJA10 "HOLDER OF PRIV INS (SOURCE UNKNWN) JAN10";
label variable HPDFE10 "HOLDER OF PRIV INS (SOURCE UNKNWN) FEB10";
label variable HPDMA10 "HOLDER OF PRIV INS (SOURCE UNKNWN) MAR10";
label variable HPDAP10 "HOLDER OF PRIV INS (SOURCE UNKNWN) APR10";
label variable HPDMY10 "HOLDER OF PRIV INS (SOURCE UNKNWN) MAY10";
label variable HPDJU10 "HOLDER OF PRIV INS (SOURCE UNKNWN) JUN10";
label variable HPDJL10 "HOLDER OF PRIV INS (SOURCE UNKNWN) JUL10";
label variable HPDAU10 "HOLDER OF PRIV INS (SOURCE UNKNWN) AUG10";
label variable HPDSE10 "HOLDER OF PRIV INS (SOURCE UNKNWN) SEP10";
label variable HPDOC10 "HOLDER OF PRIV INS (SOURCE UNKNWN) OCT10";
label variable HPDNO10 "HOLDER OF PRIV INS (SOURCE UNKNWN) NOV10";
label variable HPDDE10 "HOLDER OF PRIV INS (SOURCE UNKNWN) DEC10";
label variable HPNJA10 "HOLDER OF NONGROUP INS IN JAN10";
label variable HPNFE10 "HOLDER OF NONGROUP INS IN FEB10";
label variable HPNMA10 "HOLDER OF NONGROUP INS IN MAR10";
label variable HPNAP10 "HOLDER OF NONGROUP INS IN APR10";
label variable HPNMY10 "HOLDER OF NONGROUP INS IN MAY10";
label variable HPNJU10 "HOLDER OF NONGROUP INS IN JUN10";
label variable HPNJL10 "HOLDER OF NONGROUP INS IN JUL10";
label variable HPNAU10 "HOLDER OF NONGROUP INS IN AUG10";
label variable HPNSE10 "HOLDER OF NONGROUP INS IN SEP10";
label variable HPNOC10 "HOLDER OF NONGROUP INS IN OCT10";
label variable HPNNO10 "HOLDER OF NONGROUP INS IN NOV10";
label variable HPNDE10 "HOLDER OF NONGROUP INS IN DEC10";
label variable HPOJA10 "HOLDER OF OTHER GROUP INS IN JAN10";
label variable HPOFE10 "HOLDER OF OTHER GROUP INS IN FEB10";
label variable HPOMA10 "HOLDER OF OTHER GROUP INS IN MAR10";
label variable HPOAP10 "HOLDER OF OTHER GROUP INS IN APR10";
label variable HPOMY10 "HOLDER OF OTHER GROUP INS IN MAY10";
label variable HPOJU10 "HOLDER OF OTHER GROUP INS IN JUN10";
label variable HPOJL10 "HOLDER OF OTHER GROUP INS IN JUL10";
label variable HPOAU10 "HOLDER OF OTHER GROUP INS IN AUG10";
label variable HPOSE10 "HOLDER OF OTHER GROUP INS IN SEP10";
label variable HPOOC10 "HOLDER OF OTHER GROUP INS IN OCT10";
label variable HPONO10 "HOLDER OF OTHER GROUP INS IN NOV10";
label variable HPODE10 "HOLDER OF OTHER GROUP INS IN DEC10";
label variable HPSJA10 "HOLDER OF SELF-EMP-1 INS IN JAN10";
label variable HPSFE10 "HOLDER OF SELF-EMP-1 INS IN FEB10";
label variable HPSMA10 "HOLDER OF SELF-EMP-1 INS IN MAR10";
label variable HPSAP10 "HOLDER OF SELF-EMP-1 INS IN APR10";
label variable HPSMY10 "HOLDER OF SELF-EMP-1 INS IN MAY10";
label variable HPSJU10 "HOLDER OF SELF-EMP-1 INS IN JUN10";
label variable HPSJL10 "HOLDER OF SELF-EMP-1 INS IN JUL10";
label variable HPSAU10 "HOLDER OF SELF-EMP-1 INS IN AUG10";
label variable HPSSE10 "HOLDER OF SELF-EMP-1 INS IN SEP10";
label variable HPSOC10 "HOLDER OF SELF-EMP-1 INS IN OCT10";
label variable HPSNO10 "HOLDER OF SELF-EMP-1 INS IN NOV10";
label variable HPSDE10 "HOLDER OF SELF-EMP-1 INS IN DEC10";
label variable HPRJA10 "HOLDER OF PRIVATE INSURANCE IN JAN10";
label variable HPRFE10 "HOLDER OF PRIVATE INSURANCE IN FEB10";
label variable HPRMA10 "HOLDER OF PRIVATE INSURANCE IN MAR10";
label variable HPRAP10 "HOLDER OF PRIVATE INSURANCE IN APR10";
label variable HPRMY10 "HOLDER OF PRIVATE INSURANCE IN MAY10";
label variable HPRJU10 "HOLDER OF PRIVATE INSURANCE IN JUN10";
label variable HPRJL10 "HOLDER OF PRIVATE INSURANCE IN JUL10";
label variable HPRAU10 "HOLDER OF PRIVATE INSURANCE IN AUG10";
label variable HPRSE10 "HOLDER OF PRIVATE INSURANCE IN SEP10";
label variable HPROC10 "HOLDER OF PRIVATE INSURANCE IN OCT10";
label variable HPRNO10 "HOLDER OF PRIVATE INSURANCE IN NOV10";
label variable HPRDE10 "HOLDER OF PRIVATE INSURANCE IN DEC10";
label variable INSJA10X "COVR BY HOSP/MED INS IN JAN10 (ED)";
label variable INSFE10X "COVR BY HOSP/MED INS IN FEB10 (ED)";
label variable INSMA10X "COVR BY HOSP/MED INS IN MAR10 (ED)";
label variable INSAP10X "COVR BY HOSP/MED INS IN APR10 (ED)";
label variable INSMY10X "COVR BY HOSP/MED INS IN MAY10 (ED)";
label variable INSJU10X "COVR BY HOSP/MED INS IN JUN10 (ED)";
label variable INSJL10X "COVR BY HOSP/MED INS IN JUL10 (ED)";
label variable INSAU10X "COVR BY HOSP/MED INS IN AUG10 (ED)";
label variable INSSE10X "COVR BY HOSP/MED INS IN SEP10 (ED)";
label variable INSOC10X "COVR BY HOSP/MED INS IN OCT10 (ED)";
label variable INSNO10X "COVR BY HOSP/MED INS IN NOV10 (ED)";
label variable INSDE10X "COVR BY HOSP/MED INS IN DEC10 (ED)";
label variable PRVEV10 "EVER HAVE PRIVATE INSURANCE DURING 10";
label variable TRIEV10 "EVER HAVE TRICARE/CHAMPVA DURING 10";
label variable MCREV10 "EVER HAVE MEDICARE DURING 10 (ED)";
label variable MCDEV10 "EVER HAVE MEDICAID/SCHIP DURING 10 (ED)";
label variable OPAEV10 "EVER HAVE OTHER PUBLIC A INS DURING 10";
label variable OPBEV10 "EVER HAVE OTHER PUBLIC B INS DURING 10";
label variable UNINS10 "UNINSURED ALL OF 10";
label variable INSCOV10 "HEALTH INSURANCE COVERAGE INDICATOR 10";
label variable TRIST31X "COVERED BY TRICARE STANDARD - R3/1";
label variable TRIST42X "COVERED BY TRICARE STANDARD - R4/2";
label variable TRIST10X "COVERED BY TRICARE STANDARD - 12/31/10";
label variable TRIPR31X "COVERED BY TRICARE PRIME - R3/1";
label variable TRIPR42X "COVERED BY TRICARE PRIME - R4/2";
label variable TRIPR10X "COVERED BY TRICARE PRIME - 12/31/10";
label variable TRIEX31X "COVERED BY TRICARE EXTRA - R3/1";
label variable TRIEX42X "COVERED BY TRICARE EXTRA - R4/2";
label variable TRIEX10X "COVERED BY TRICARE EXTRA - 12/31/10";
label variable TRILI31X "COVERED BY TRICARE FOR LIFE - R3/1";
label variable TRILI42X "COVERED BY TRICARE FOR LIFE - R4/2";
label variable TRILI10X "COVERED BY TRICARE FOR LIFE - 12/31/10";
label variable TRICH31X "COVERED BY TRICARE CHAMPVA - R3/1";
label variable TRICH42X "COVERED BY TRICARE CHAMPVA - R4/2";
label variable TRICH10X "COVERED BY TRICARE CHAMPVA - 12/31/10";
label variable MCRPD31 "COV BY MEDICARE PMED BENEFIT - R3/1";
label variable MCRPD42 "COV BY MEDICARE PMED BENEFIT - R4/2";
label variable MCRPD10 "COV BY MEDICARE PMED BENEFIT - 12/31/10";
label variable MCRPD31X "COV BY MEDICARE PMED BENEFIT - R3/1 (ED)";
label variable MCRPD42X "COV BY MEDICARE PMED BENEFIT - R4/2 (ED)";
label variable MCRPD10X "COV BY MCARE PMED BENEFIT-12/31/10 (ED)";
label variable MCRPB31 "COV BY MEDICARE PART B - R3/1";
label variable MCRPB42 "COV BY MEDICARE PART B - R4/2";
label variable MCRPB10 "COV BY MEDICARE PART B - 12/31/10";
label variable MCRPHO31 "COV BY MEDICARE MANAGED CARE - R3/1";
label variable MCRPHO42 "COV BY MEDICARE MANAGED CARE - R4/2";
label variable MCRPHO10 "COV BY MEDICARE MANAGED CARE - 12/31/10";
label variable MCDHMO31 "COVERED BY MEDICAID OR SCHIP HMO - R3/1";
label variable MCDHMO42 "COVERED BY MEDICAID OR SCHIP HMO - R4/2";
label variable MCDHMO10 "COVRED BY MEDICAID OR SCHIP HMO-12/31/10";
label variable MCDMC31 "COV BY MCAID/SCHIP GATEKEEPER PLAN-R3/1";
label variable MCDMC42 "COV BY MCAID/SCHIP GATEKEEPER PLAN-R4/2";
label variable MCDMC10 "COV BY MCAID/SCHIP GTKEEPR PLAN-12/31/10";
label variable PRVHMO31 "COVERED BY PRIVATE HMO - R3/1";
label variable PRVHMO42 "COVERED BY PRIVATE HMO - R4/2";
label variable PRVHMO10 "COVERED BY PRIVATE HMO - 12/31/10";
label variable PRVMNC31 "COVERED BY PRIVATE GATEKEEPER PLAN-R3/1";
label variable PRVMNC42 "COVERED BY PRIVATE GATEKEEPER PLAN-R4/2";
label variable PRVMNC10 "COVERED BY PRIV GATEKEEPER PLAN-12/31/10";
label variable PRVDRL31 "COV BY PRIV PLAN W/DOCTOR LIST - R3/1";
label variable PRVDRL42 "COV BY PRIV PLAN W/DOCTOR LIST - R4/2";
label variable PRVDRL10 "COV BY PRIV PLAN W/DOCTOR LIST-12/31/10";
label variable PHMONP31 "COV BY HMO-PAYS NON-PLAN DR VISITS-R3/1";
label variable PHMONP42 "COV BY HMO-PAYS NON-PLAN DR VISITS-R4/2";
label variable PHMONP10 "COV BY HMO-PAYS NON-PLAN DRS - 12/31/10";
label variable PMNCNP31 "COV BY GATEKPR-PAYS NON-PLAN DRS-R3/1";
label variable PMNCNP42 "COV BY GATEKPR-PAYS NON-PLAN DRS-R4/2";
label variable PMNCNP10 "COV BY GATEKP-PAYS NON-PLAN DRS-12/31/10";
label variable PRDRNP31 "COV BY DR LIST-PAYS NON-PLAN DRS-R3/1";
label variable PRDRNP42 "COV BY DR LIST-PAYS NON-PLAN DRS-R4/2";
label variable PRDRNP10 "COV BY DR LIST-PAYS NON-PLAN DR-12/31/10";
label variable PREVCOVR "PER COV BY INS IN PREV 2 YRS-PNL 15 ONLY";
label variable COVRMM "MONTH MOST RECENTLY COVERED-PNL 15 ONLY";
label variable COVRYY "YEAR MOST RECENTLY COVERED-PANEL 15 ONLY";
label variable WASESTB "WAS PREV INS BY EMPL OR UNION-PN 15 ONLY";
label variable WASMCARE "WAS PREV INS BY MEDICARE-PANEL 15 ONLY";
label variable WASMCAID "WAS PREV INS BY MCAID/SCHIP-PNL 15 ONLY";
label variable WASCHAMP "WAS PREV INS TRICARE/CHAMPVA-PNL 15 ONLY";
label variable WASVA "WAS PREV INS VA/MILITAR CARE-PNL 15 ONLY";
label variable WASPRIV "WAS PREV INS GRP/ASSOC/INS CO-PN 15 ONLY";
label variable WASOTGOV "WAS PREV INS BY OTH GOV PRG-PNL 15 ONLY";
label variable WASAFDC "WAS PREV INS BY PUBLIC AFDC-PNL 15 ONLY";
label variable WASSSI "WAS PREV INS BY SSI PROGRAM-PNL 15 ONLY";
label variable WASSTAT1 "WAS PREV INS BY STAT PROG 1-PNL 15 ONLY";
label variable WASSTAT2 "WAS PREV INS BY STAT PROG 2-PNL 15 ONLY";
label variable WASSTAT3 "WAS PREV INS BY STAT PROG 3-PNL 15 ONLY";
label variable WASSTAT4 "WAS PREV INS BY STAT PROG 4-PNL 15 ONLY";
label variable WASOTHER "WAS PREV INS BY OTH SOURCE-PANEL 15 ONLY";
label variable NOINSBEF "EVR WOUT HLTH INSR PREV YR-PANEL 15 ONLY";
label variable NOINSTM "# WKS/MON WOUT HLTH INS PRV YR-PN 15 ONL";
label variable NOINUNIT "UNIT OF TIME WOUT HLTH INS-PANEL 15 ONLY";
label variable MORECOVR "COV BY MOR COMPR PL PREV 2 YR-PN 15 ONLY";
label variable INSENDMM "MONTH MOST RECENTLY COVD-PANEL 15 ONLY";
label variable INSENDYY "YEAR MOST RECENTLY COVD-PANEL 15 ONLY";
label variable TRICR31X "COV BY TRICR/CHAMV - R3/1 INT DT (ED)";
label variable TRICR42X "COV BY TRICR/CHAMV - R4/2 INT DT (ED)";
label variable TRICR53X "COV BY TRICR/CHAMV 12-31/R3 INT DT (ED)";
label variable TRICR10X "COV BY TRICR/CHAMV - 12/31/10 (ED)";
label variable TRIAT31X "ANY TIME COV TRICARE/CHAMPVA - R3/1";
label variable TRIAT42X "ANY TIME COV TRICARE/CHAMPVA - R4/2";
label variable TRIAT53X "ANY TIME COV TRICARE/CHAMPVA - R5/3";
label variable TRIAT10X "ANY TIME COV TRICARE/CHAMPVA - 12/31/10";
label variable MCAID31 "COV BY MEDICAID OR SCHIP - R3/1 INT DT";
label variable MCAID42 "COV BY MEDICAID OR SCHIP - R4/2 INT DT";
label variable MCAID53 "COV BY MEDICAID OR SCHIP 12-31/R3 INT DT";
label variable MCAID10 "COV BY MEDICAID OR SCHIP - 12/31/10";
label variable MCAID31X "COV BY MEDICAID/SCHIP - R3/1 INT DT (ED)";
label variable MCAID42X "COV BY MEDICAID/SCHIP - R4/2 INT DT (ED)";
label variable MCAID53X "COV MEDICAID/SCHIP 12-31/R3 INT DT(ED)";
label variable MCAID10X "COV BY MEDICAID OR SCHIP - 12/31/10 (ED)";
label variable MCARE31 "COV BY MEDICARE - R3/1 INT DT";
label variable MCARE42 "COV BY MEDICARE - R4/2 INT DT";
label variable MCARE53 "COV BY MEDICARE 12-31/R3 INT DT";
label variable MCARE10 "COV BY MEDICARE - 12/31/10";
label variable MCARE31X "COV BY MEDICARE - R3/1 INT DT (ED)";
label variable MCARE42X "COV BY MEDICARE - R4/2 INT DT (ED)";
label variable MCARE53X "COV BY MEDICARE 12-31/R3 INT DT (ED)";
label variable MCARE10X "COV BY MEDICARE - 12/31/10 (ED)";
label variable MCDAT31X "ANY TIME COV MEDICAID OR SCHIP - R3/1";
label variable MCDAT42X "ANY TIME COV MEDICAID OR SCHIP - R4/2";
label variable MCDAT53X "ANY TIME COV MEDICAID OR SCHIP - R5/3";
label variable MCDAT10X "ANY TIME COV MEDICAID OR SCHIP-12/31/10";
label variable OTPAAT31 "ANY TIME COV OT GOV MCAID/SCHIP HMO-R3/1";
label variable OTPAAT42 "ANY TIME COV OT GOV MCAID/SCHIP HMO-R4/2";
label variable OTPAAT53 "ANY TIME COV OT GOV MCAID/SCHIP HMO-R5/3";
label variable OTPAAT10 "ANY COV OT GOV MCAID/SCHIP HMO-12/31/10";
label variable OTPBAT31 "ANY COV OT GOV NOT MCAID/SCHIP HMO-R3/1";
label variable OTPBAT42 "ANY COV OT GOV NOT MCAID/SCHIP HMO-R4/2";
label variable OTPBAT53 "ANY COV OT GOV NOT MCAID/SCHIP HMO-R5/3";
label variable OTPBAT10 "ANY CV OT GV NT MCAID/SCHIP HMO-12/31/10";
label variable OTPUBA31 "COV/PAY OTH GOV MCAID/SCHIP HMO-R3/1 INT";
label variable OTPUBA42 "COV/PAY OTH GOV MCAID/SCHIP HMO-R4/2 INT";
label variable OTPUBA53 "COV/PAY OTH GOV MCAID/SCHIP HMO 12-31/R3";
label variable OTPUBA10 "COV/PAY OTH GOV MCAID/SCHIP HMO-12/31/10";
label variable OTPUBB31 "COV OTH GOV NOT MCAID/SCHIP HMO-R3/1 INT";
label variable OTPUBB42 "COV OTH GOV NOT MCAID/SCHIP HMO-R4/2 INT";
label variable OTPUBB53 "COV OTH GOV NOT MCAID/SCHIP HMO 12-31/R3";
label variable OTPUBB10 "COV OTH GOV NOT MCAID/SCHIP HMO-12/31/10";
label variable PRIDK31 "COV BY PRIV INS (DK PLAN) - R3/1 INT";
label variable PRIDK42 "COV BY PRIV INS (DK PLAN) - R4/2 INT";
label variable PRIDK53 "COV BY PRIV INS (DK PLAN) 12-31/R3 INT";
label variable PRIDK10 "COV BY PRIV INS (DK PLAN) - 12/31/10";
label variable PRIEU31 "COV BY EMPL/UNION GRP INS - R3/1 INT DT";
label variable PRIEU42 "COV BY EMPL/UNION GRP INS - R4/2 INT DT";
label variable PRIEU53 "COV BY EMPL/UNION GRP INS 12-31/R3 INT";
label variable PRIEU10 "COV BY EMPL/UNION GRP INS - 12/31/10";
label variable PRING31 "COV BY NON-GROUP INS - R3/1 INT DT";
label variable PRING42 "COV BY NON-GROUP INS - R4/2 INT DT";
label variable PRING53 "COV BY NON-GROUP INS 12-31/R3 INT DT";
label variable PRING10 "COV BY NON-GROUP INS - 12/31/10";
label variable PRIOG31 "COV BY OTHER GROUP INS - R3/1 INT DT";
label variable PRIOG42 "COV BY OTHER GROUP INS - R4/2 INT DT";
label variable PRIOG53 "COV BY OTHER GROUP INS 12-31/R3 INT DT";
label variable PRIOG10 "COV BY OTHER GROUP INS - 12/31/10";
label variable PRIS31 "COV BY SELF-EMP-1 INS - R3/1 INT DT";
label variable PRIS42 "COV BY SELF-EMP-1 INS - R4/2 INT DT";
label variable PRIS53 "COV BY SELF-EMP-1 INS 12-31/R3 INT DT";
label variable PRIS10 "COV BY SELF-EMP-1 INS - 12/31/10";
label variable PRIV31 "COV BY PRIV HLTH INS - R3/1 INT DATE";
label variable PRIV42 "COV BY PRIV HLTH INS - R4/2 INT DATE";
label variable PRIV53 "COV BY PRIV HLTH INS 12-31/R3 INT DATE";
label variable PRIV10 "COV BY PRIV HLTH INS - 12/31/10";
label variable PRIVAT31 "ANY TIME COV PRIVATE INS - R3/1";
label variable PRIVAT42 "ANY TIME COV PRIVATE INS - R4/2";
label variable PRIVAT53 "ANY TIME COV PRIVATE INS - R5/3";
label variable PRIVAT10 "ANY TIME COV PRIVATE INS - 12/31/10";
label variable PROUT31 "COV BY SOMEONE OUT OF RU - R3/1 INT";
label variable PROUT42 "COV BY SOMEONE OUT OF RU - R4/2 INT";
label variable PROUT53 "COV BY SOMEONE OUT OF RU 12-31/R3 INT DT";
label variable PROUT10 "COV BY SOMEONE OUT OF RU - 12/31/10";
label variable PUB31X "COV BY PUBLIC INS - R3/1 INT DT (ED)";
label variable PUB42X "COV BY PUBLIC INS - R4/2 INT DT (ED)";
label variable PUB53X "COV BY PUBLIC INS 12-31/R3 INT DT (ED)";
label variable PUB10X "COV BY PUBLIC INS - 12/31/10 (ED)";
label variable PUBAT31X "ANY TIME COV BY PUBLIC - R3/1";
label variable PUBAT42X "ANY TIME COV BY PUBLIC - R4/2";
label variable PUBAT53X "ANY TIME COV BY PUBLIC - R5/3";
label variable PUBAT10X "ANY TIME COV BY PUBLIC - 12/31/10";
label variable INS31X "INSURED - R3/1 INT DATE (ED)";
label variable INS42X "INSURED - R4/2 INT DATE (ED)";
label variable INS53X "INSURED 12-31/R3 INT DATE (ED)";
label variable INS10X "INSURED - 12/31/10 (ED)";
label variable INSAT31X "INSURED ANY TIME IN R3/1";
label variable INSAT42X "INSURED ANY TIME IN R4/2";
label variable INSAT53X "INSURED ANY TIME IN R5/3";
label variable INSAT10X "INSURED ANY TIME IN R5/R3 UNTIL 12/31/10";
label variable STAPR31 "COV BY STATE-SPEC PROG - R3/1 INT DT";
label variable STAPR42 "COV BY STATE-SPEC PROG - R4/2 INT DT";
label variable STAPR53 "COV BY STATE-SPEC PROG 12-31/R3 INT DT";
label variable STAPR10 "COV BY STATE-SPEC PROG - 12/31/10";
label variable STPRAT31 "ANY TIME COVERAGE BY STATE INS - R3/1";
label variable STPRAT42 "ANY TIME COVERAGE BY STATE INS - R4/2";
label variable STPRAT53 "ANY TIME COVERAGE BY STATE INS - R5/3";
label variable STPRAT10 "ANY TIME COV BY STATE INS - 12/31/10";
label variable EVRUNINS "EVER UNINSURED IN 10 USING PRIV/PUBX";
label variable EVRUNAT "EVER UNINSURED IN 10 USING PRIVAT/PUBATX";
label variable DENTIN31 "DENTAL INSURANCE - RD 3/1";
label variable DENTIN42 "DENTAL INSURANCE - RD 4/2";
label variable DENTIN53 "DENTAL INSURANCE - RD 5/3";
label variable DNTINS31 "DENTAL INS - RD 3/1 IN 10";
label variable DNTINS10 "DENTAL INS - R5/R3 UNTIL 12/31/10";
label variable PMEDIN31 "PRESCRIPTION DRUG INSURANCE - RD 3/1";
label variable PMEDIN42 "PRESCRIPTION DRUG INSURANCE - RD 4/2";
label variable PMEDIN53 "PRESCRIPTION DRUG INSURANCE - RD 5/3";
label variable PMDINS31 "PMED INS - RD 3/1 IN 10";
label variable PMDINS10 "PMED INS - R5/R3 UNTIL 12/31/10";
label variable PMEDUP31 "HAS USUAL 3RD PARTY PAYER FOR PMEDS-R3/1";
label variable PMEDUP42 "HAS USUAL 3RD PARTY PAYER FOR PMEDS-R4/2";
label variable PMEDUP53 "HAS USUAL 3RD PARTY PAYER FOR PMEDS-R5/3";
label variable PMEDPY31 "USUAL 3RD PARTY PAYER FOR PMEDS - R3/1";
label variable PMEDPY42 "USUAL 3RD PARTY PAYER FOR PMEDS - R4/2";
label variable PMEDPY53 "USUAL 3RD PARTY PAYER FOR PMEDS - R5/3";
label variable PMEDPP31 "OUT-OF-POCKET PAYMENT FOR LAST PMED-R3/1";
label variable PMEDPP42 "OUT-OF-POCKET PAYMENT FOR LAST PMED-R4/2";
label variable PMEDPP53 "OUT-OF-POCKET PAYMENT FOR LAST PMED-R5/3";
label variable GDCPBM42 "MCAID/SCHIP/O PUB: PRB GET PERS DOC-R4/2";
label variable APRTRM42 "MCAID/SCHIP/O PUB: NEED APPRV 4 TRT-R4/2";
label variable APRDLM42 "MCAID/SCHIP/O PUB: DLY WAIT 4 APPRV-R4/2";
label variable LKINFM42 "MCAID/SCHIP/O PUB: LOOK 4 PLAN INFO-R4/2";
label variable PBINFM42 "MCAID/SCHIP/O PUB: PROB FINDNG INFO-R4/2";
label variable CSTSVM42 "MCAID/SCHIP/O PUB: CALL CUSTMR SERV-R4/2";
label variable PBSVCM42 "MCAID/SCHIP/O PUB: PRB W CUSRVC HLP-R4/2";
label variable PPRWKM42 "MCAID/SCHIP/O PUB: COMP PLAN PPRWRK-R4/2";
label variable PBPWKM42 "MCAID/SCHIP/O PUB: PRB W PLN PPRWRK-R4/2";
label variable RTPLNM42 "MCAID/SCHIP/O PUB: RATE EXP W PLAN-R4/2";
label variable GDCPBT42 "TRICR/CHAMV: PROB GETTING PERS DOC-R4/2";
label variable APRTRT42 "TRICR/CHAMV: NEED APPRVL 4 TREATMNT-R4/2";
label variable APRDLT42 "TRICR/CHAMV: DELAY WAITING 4 APPRVL-R4/2";
label variable LKINFT42 "TRICR/CHAMV: INFO ON HOW PLAN WORKS-R4/2";
label variable PBINFT42 "TRICR/CHAMV: PROBLEM FINDING INFO-R4/2";
label variable CSTSVT42 "TRICR/CHAMV: CALL CUSTOMER SERVICE-R4/2";
label variable PBSVCT42 "TRICR/CHAMV: PROB GET HELP FR CSRVC-R4/2";
label variable PPRWKT42 "TRICR/CHAMV:FILL OUT PAPERWRK 4 PLN-R4/2";
label variable PBPWKT42 "TRICR/CHAMV: PROB W PLAN PAPERWORK-R4/2";
label variable RTPLNT42 "TRICR/CHAMV: RATE EXPERIENCE W PLAN-R4/2";
label variable TOTTCH10 "TOTAL HEALTH CARE CHARGES 10, EXCL RX";
label variable TOTEXP10 "TOTAL HEALTH CARE EXP 10";
label variable TOTSLF10 "TOTAL AMT PAID BY SELF/FAMILY 10";
label variable TOTMCR10 "TOTAL AMT PAID BY MEDICARE 10";
label variable TOTMCD10 "TOTAL AMT PAID BY MEDICAID 10";
label variable TOTPRV10 "TOTAL AMT PAID BY PRIVATE INS 10";
label variable TOTVA10 "TOTAL AMT PAID BY VA/CHAMPVA 10";
label variable TOTTRI10 "TOTAL AMT PAID BY TRICARE 10";
label variable TOTOFD10 "TOTAL AMT PAID BY OTHER FEDERAL 10";
label variable TOTSTL10 "TOTAL AMT PAID BY OTH ST/LOCAL 10";
label variable TOTWCP10 "TOTAL AMT PAID BY WORKERS COMP 10";
label variable TOTOPR10 "TOTAL AMT PAID BY OTHER PRIVATE 10";
label variable TOTOPU10 "TOTAL AMT PAID BY OTHER PUBLIC 10";
label variable TOTOSR10 "TOTAL AMT PAID BY OTHER SOURCES 10";
label variable TOTPTR10 "TOTAL AMT PAID BY PRV & TRI 10";
label variable TOTOTH10 "TOTAL AMT PAID BY OTH COMBINED 10";
label variable OBTOTV10 "# OFFICE-BASED PROVIDER VISITS 10";
label variable OBVTCH10 "OFFICE-BASED PROVIDER VISIT CHARGES 10";
label variable OBVEXP10 "TOTAL OFFICE-BASED EXP 10";
label variable OBVSLF10 "ALL OFFICE VISITS - SELF/FAMILY AMT 10";
label variable OBVMCR10 "ALL OFFICE VISITS - MEDICARE AMT 10";
label variable OBVMCD10 "ALL OFFICE VISITS - MEDICAID AMT 10";
label variable OBVPRV10 "ALL OFFICE VISITS - PRIVATE INS AMT 10";
label variable OBVVA10 "ALL OFFICE VISITS-VA/CHAMPVA AMT 10";
label variable OBVTRI10 "ALL OFFICE VISITS-TRICARE AMT 10";
label variable OBVOFD10 "ALL OFFICE VISITS-OTHER FEDERAL AMT 10";
label variable OBVSTL10 "ALL OFFICE VISITS-OTH ST/LOCAL AMT 10";
label variable OBVWCP10 "ALL OFFICE VISITS - WORKERS COMP AMT 10";
label variable OBVOPR10 "ALL OFFICE VISITS - OTH PRIVATE AMT 10";
label variable OBVOPU10 "ALL OFFICE VISITS - OTH PUBLIC AMT 10";
label variable OBVOSR10 "ALL OFF VSTS - OTH UNCLASS SRCE AMT 10";
label variable OBVPTR10 "ALL OFFICE VISITS - PRV & TRI AMT 10";
label variable OBVOTH10 "ALL OFFICE VISITS - OTH COMBINED AMT 10";
label variable OBDRV10 "# OFFICE-BASED PHYSICIAN VISITS 10";
label variable OBDTCH10 "OFFICE-BASED PHYSICIAN VISIT CHARGES 10";
label variable OBDEXP10 "TOTAL OFF-BASED DR EXP 10";
label variable OBDSLF10 "DR OFFICE VISITS - SELF/FAMILY AMT 10";
label variable OBDMCR10 "DR OFFICE VISITS - MEDICARE AMT 10";
label variable OBDMCD10 "DR OFFICE VISITS - MEDICAID AMT 10";
label variable OBDPRV10 "DR OFFICE VISITS - PRIVATE INS AMT 10";
label variable OBDVA10 "DR OFFICE VISITS - VA/CHAMPVA AMT 10";
label variable OBDTRI10 "DR OFFICE VISITS - TRICARE AMT 10";
label variable OBDOFD10 "DR OFFICE VISITS - OTHER FEDERAL AMT 10";
label variable OBDSTL10 "DR OFFICE VISITS - OTH ST/LOCAL AMT 10";
label variable OBDWCP10 "DR OFFICE VISITS - WORKERS COMP AMT 10";
label variable OBDOPR10 "DR OFFICE VISITS - OTH PRIVATE AMT 10";
label variable OBDOPU10 "DR OFFICE VISITS - OTH PUBLIC AMT 10";
label variable OBDOSR10 "DR OFF VSTS - OTH UNCLASS SRCE AMT 10";
label variable OBDPTR10 "DR OFFICE VISITS - PRV & TRI AMT 10";
label variable OBDOTH10 "DR OFFICE VISITS - OTH COMBINED AMT 10";
label variable OBOTHV10 "# OFFICE-BASED NON-PHYSICAN VISITS 10";
label variable OBOTCH10 "OFFICE-BASED NON-DR VISIT CHARGES 10";
label variable OBOEXP10 "TOTAL OFF-BASED NON-DR EXP 10";
label variable OBOSLF10 "NON-DR OFF VISTS - SELF/FAMILY AMT 10";
label variable OBOMCR10 "NON-DR OFF VISTS - MEDICARE AMT 10";
label variable OBOMCD10 "NON-DR OFF VISTS - MEDICAID AMT 10";
label variable OBOPRV10 "NON-DR OFF VISTS - PRIVATE INS AMT 10";
label variable OBOVA10 "NON-DR OFF VISTS - VA/CHAMPVA AMT 10";
label variable OBOTRI10 "NON-DR OFF VISTS - TRICARE AMT 10";
label variable OBOOFD10 "NON-DR OFF VISTS - OTHER FEDERAL AMT 10";
label variable OBOSTL10 "NON-DR OFF VISTS - OTH ST/LOCAL AMT 10";
label variable OBOWCP10 "NON-DR OFF VISTS - WORKERS COMP AMT 10";
label variable OBOOPR10 "NON-DR OFF VISTS - OTH PRIVATE AMT 10";
label variable OBOOPU10 "NON-DR OFF VISTS - OTH PUBLIC AMT 10";
label variable OBOOSR10 "NON-DR OF VSTS - OTH UNCLASS SRCE AMT 10";
label variable OBOPTR10 "NON-DR OFF VISTS - PRV & TRI AMT 10";
label variable OBOOTH10 "NON-DR OFF VISTS - OTH COMBINED AMT 10";
label variable OBCHIR10 "# OFFICE-BASED CHIROPRACTOR VISITS 10";
label variable OBCTCH10 "OFFICE-BASED CHIRO VISIT CHARGES 10";
label variable OBCEXP10 "TOTAL OFF-BASED CHIRO EXP 10";
label variable OBCSLF10 "CHIRO OFF VISITS - SELF/FAMILY AMT 10";
label variable OBCMCR10 "CHIRO OFF VISITS - MEDICARE AMT 10";
label variable OBCMCD10 "CHIRO OFF VISITS - MEDICAID AMT 10";
label variable OBCPRV10 "CHIRO OFF VISITS - PRIVATE INS AMT 10";
label variable OBCVA10 "CHIRO OFF VISITS - VA/CHAMPVA AMT 10";
label variable OBCTRI10 "CHIRO OFF VISITS - TRICARE AMT 10";
label variable OBCOFD10 "CHIRO OFF VISITS - OTHER FEDERAL AMT 10";
label variable OBCSTL10 "CHIRO OFF VISITS - OTH ST/LOCAL AMT 10";
label variable OBCWCP10 "CHIRO OFF VISITS - WORKERS COMP AMT 10";
label variable OBCOPR10 "CHIRO OFF VISTS - OTHR PRIVATE AMT 10";
label variable OBCOPU10 "CHIRO OFF VISTS - OTHR PUBLIC AMT 10";
label variable OBCOSR10 "CHIRO OFF VSTS-OTHR UNCLASS SRCE AMT 10";
label variable OBCPTR10 "CHIRO OFF VISITS - PRV & TRI AMT 10";
label variable OBCOTH10 "CHIRO OFF VISITS -OTH COMBINED AMT 10";
label variable OBNURS10 "# OFF-BASED NURSE/PRACTITIONER VISITS 10";
label variable OBNTCH10 "OFFICE-BASED NURSE/PRAC VISIT CHARGES 10";
label variable OBNEXP10 "TOTAL OFF-BASED NURSE/PRAC 10";
label variable OBNSLF10 "NURSE/PRAC OFF VISITS-SELF/FAMILY AMT 10";
label variable OBNMCR10 "NURSE/PRAC OFF VISITS - MEDICARE AMT 10";
label variable OBNMCD10 "NURSE/PRAC OFF VSTS - MEDICAID AMT 10";
label variable OBNPRV10 "NURSE/PRAC OFF VSTS-PRIVATE INS AMT 10";
label variable OBNVA10 "NURSE/PRAC OFF VSTS - VA/CHAMPVA AMT 10";
label variable OBNTRI10 "NURSE/PRAC OFF VSTS - TRICARE AMT 10";
label variable OBNOFD10 "NURSE/PRAC OFF VSTS-OTHER FEDERAL AMT 10";
label variable OBNSTL10 "NURSE/PRAC OFF VSTS-OTH ST/LOCAL AMT 10";
label variable OBNWCP10 "NURSE/PRAC OFF VSTS-WORKERS COMP AMT 10";
label variable OBNOPR10 "NURSE/PRAC OFF VSTS - OTH PRIVATE AMT 10";
label variable OBNOPU10 "NURSE/PRAC OFF VSTS - OTH PUBLIC AMT 10";
label variable OBNOSR10 "NRS/PR OFF VSTS-OTH UNCLASS SRCE AMT 10";
label variable OBNPTR10 "NURSE/PRAC OFF VSTS - PRV & TRI AMT 10";
label variable OBNOTH10 "NURSE/PRAC OFF VSTS-OTH COMBINED AMT 10";
label variable OBOPTO10 "# OFF-BASED OPTOMETRIST VISITS 10";
label variable OBETCH10 "OFFICE-BASED OPTOMTRIST VISIT CHARGES 10";
label variable OBEEXP10 "TOTAL OFF-BASED OPTOMETRIST EXP 10";
label variable OBESLF10 "OPTOMETRIST OFF VSTS-SELF/FAMILY AMT 10";
label variable OBEMCR10 "OPTOMETRIST OFF VSTS - MEDICARE AMT 10";
label variable OBEMCD10 "OPTOMETRIST OFF VSTS - MEDICAID AMT 10";
label variable OBEPRV10 "OPTOMETRIST OFF VSTS-PRIVATE INS AMT 10";
label variable OBEVA10 "OPTOMETRIST OFF VSTS - VA/CHAMPVA AMT 10";
label variable OBETRI10 "OPTOMETRIST OFF VSTS - TRICARE AMT 10";
label variable OBEOFD10 "OPTOMETRIST OFF VSTS-OTH FEDERAL AMT 10";
label variable OBESTL10 "OPTOMETRIST OFF VSTS-OTH ST/LOCL AMT 10";
label variable OBEWCP10 "OPTOMETRIST OFF VSTS-WORKERS COMP AMT 10";
label variable OBEOPR10 "OPTOMETRIST OFF VSTS-OTH PRIVATE AMT 10";
label variable OBEOPU10 "OPTOMETRIST OFF VSTS - OTH PUBLIC AMT 10";
label variable OBEOSR10 "OPTOM OFF VSTS-OTH UNCLASS SRCE AMT 10";
label variable OBEPTR10 "OPTOMETRIST OFF VSTS - PRV & TRI AMT 10";
label variable OBEOTH10 "OPTOMETRIST OFF VSTS-OTH COMBINED AMT 10";
label variable OBASST10 "# OFF-BASED PHYSICIAN ASSIST VISITS 10";
label variable OBATCH10 "OFFICE-BASED PHYS ASST VISIT CHARGES 10";
label variable OBAEXP10 "TOTAL OFF-BASED PHYS ASS T EXP 10";
label variable OBASLF10 "PHYS ASS T OFF VSTS - SELF/FAMILY AMT 10";
label variable OBAMCR10 "PHYS ASS T OFF VSTS - MEDICARE AMT 10";
label variable OBAMCD10 "PHYS ASS T OFF VSTS - MEDICAID AMT 10";
label variable OBAPRV10 "PHYS ASS T OFF VSTS - PRIVATE INS AMT 10";
label variable OBAVA10 "PHYS ASS T OFF VSTS - VA/CHAMPVA AMT 10";
label variable OBATRI10 "PHYS ASS T OFF VSTS - TRICARE AMT 10";
label variable OBAOFD10 "PHYS ASS T OFF VSTS - OTHER FED AMT 10";
label variable OBASTL10 "PHYS ASS T OFF VSTS - OTH ST/LOCL AMT 10";
label variable OBAWCP10 "PHYS ASS T OFF VSTS-WORKERS COMP AMT 10";
label variable OBAOPR10 "PHYS ASS T OFF VSTS - OTH PRIVATE AMT 10";
label variable OBAOPU10 "PHYS ASS T OFF VSTS - OTH PUBLIC AMT 10";
label variable OBAOSR10 "P A OFF VSTS - OTH UNCLASS SRCE AMT 10";
label variable OBAPTR10 "PHYS ASST OFF VSTS - PRV & TRI AMT 10";
label variable OBAOTH10 "PHYS ASST OFF VSTS - OTH COMBINED AMT 10";
label variable OBTHER10 "# OFF-BASED PT/OT VISITS 10";
label variable OBTTCH10 "OFFICE-BASED PT/OC VISIT CHARGES 10";
label variable OBTEXP10 "TOT OFF-BASED PT EXP 10";
label variable OBTSLF10 "PT/OT OFF VISITS - SELF/FAMILY AMT 10";
label variable OBTMCR10 "PT/OT OFF VISITS - MEDICARE AMT 10";
label variable OBTMCD10 "PT/OT OFF VISITS - MEDICAID AMT 10";
label variable OBTPRV10 "PT/OT OFF VISITS - PRIVATE INS AMT 10";
label variable OBTVA10 "PT/OT OFF VISITS - VA/CHAMPVA AMT 10";
label variable OBTTRI10 "PT/OT OFF VISITS - TRICARE AMT 10";
label variable OBTOFD10 "PT/OT OFF VISITS - OTHER FED AMT 10";
label variable OBTSTL10 "PT/OT OFF VISITS - OTH ST/LOCL AMT 10";
label variable OBTWCP10 "PT/OT OFF VISITS - WORKERS COMP AMT 10";
label variable OBTOPR10 "PT/OT OFF VISITS - OTH PRIVATE AMT 10";
label variable OBTOPU10 "PT/OT OFF VISITS - OTH PUBLIC AMT 10";
label variable OBTOSR10 "PT/OT OFF VSTS-OTH UNCLASS SRCE AMT 10";
label variable OBTPTR10 "PT/OT OFF VISITS - PRV & TRI AMT 10";
label variable OBTOTH10 "PT/OT OFF VISITS - OTH COMBINED AMT 10";
label variable OPTOTV10 "# OUTPATIENT DEPT PROVIDER VISITS 10";
label variable OPTTCH10 "OPD FACILITY + DR VISIT CHARGES - 10";
label variable OPTEXP10 "TOTAL OUTPATIENT FAC + DR EXP 10";
label variable OPTSLF10 "ALL OPD VSTS-SELF/FAMILY AMT-(FAC+DR) 10";
label variable OPTMCR10 "ALL OPD VSTS-MEDICARE AMT-(FAC+DR) 10";
label variable OPTMCD10 "ALL OPD VSTS-MEDICAID AMT-(FAC+DR) 10";
label variable OPTPRV10 "ALL OPD VSTS-PRIV INS AMT-(FAC+DR) 10";
label variable OPTVA10 "ALL OPD VSTS-VA/CHAMPVA AMT-(FAC+DR) 10";
label variable OPTTRI10 "ALL OPD VSTS-TRICARE AMT-(FAC+DR) 10";
label variable OPTOFD10 "ALL OPD VSTS-OTHER FED AMT-(FAC+DR) 10";
label variable OPTSTL10 "ALL OPD VST-OTH ST/LOCAL AMT(FAC+DR) 10";
label variable OPTWCP10 "ALL OPD VST-WORKRS COMP AMT-(FAC+DR) 10";
label variable OPTOPR10 "ALL OPD VSTS-OTH PRIVATE AMT-(FAC+DR) 10";
label variable OPTOPU10 "ALL OPD VSTS-OTH PUBLIC AMT-(FAC+DR) 10";
label variable OPTOSR10 "ALL OPD VST-OTH UNCLS SRC AMT(FAC+DR) 10";
label variable OPTPTR10 "ALL OPD VISITS-PRV & TRI AMT (FAC+DR) 10";
label variable OPTOTH10 "ALL OPD VSTS-OTH COMBINED AMT(FAC+DR) 10";
label variable OPFTCH10 "OPD PROVIDER VISIT CHARGES - FAC 10";
label variable OPFEXP10 "TOTAL OUTPATIENT FACILITY EXP 10";
label variable OPFSLF10 "ALL OPD VISITS-SELF/FAMILY AMT-FAC 10";
label variable OPFMCR10 "ALL OPD VISITS-MEDICARE AMT-FAC 10";
label variable OPFMCD10 "ALL OPD VISITS-MEDICAID AMT-FAC 10";
label variable OPFPRV10 "ALL OPD VISITS-PRIV INS AMT-FAC 10";
label variable OPFVA10 "ALL OPD VISITS-VA/CHAMPVA AMT-FAC 10";
label variable OPFTRI10 "ALL OPD VISITS-TRICARE AMT-FAC 10";
label variable OPFOFD10 "ALL OPD VISITS-OTHER FED AMT-FAC 10";
label variable OPFSTL10 "ALL OPD VISITS-OTH ST/LOCAL AMT-FAC 10";
label variable OPFWCP10 "ALL OPD VISITS-WORKERS COMP AMT-FAC 10";
label variable OPFOPR10 "ALL OPD VISITS - OTH PRIVATE AMT-FAC 10";
label variable OPFOPU10 "ALL OPD VISITS - OTH PUBLIC AMT-FAC 10";
label variable OPFOSR10 "ALL OPD VSTS-OTH UNCLASS SRCE AMT-FAC 10";
label variable OPFPTR10 "ALL OPD VISITS - PRV & TRI AMT-FAC 10";
label variable OPFOTH10 "ALL OPD VISITS - OTH COMBINED AMT-FAC 10";
label variable OPDEXP10 "TOTAL OUTPATIENT PROVIDER EXP 10";
label variable OPDTCH10 "OPD PROVIDER VISIT CHARGES - DR 10";
label variable OPDSLF10 "ALL OPD VISITS-SELF/FAMILY AMT-DR 10";
label variable OPDMCR10 "ALL OPD VISITS-MEDICARE AMT-DR 10";
label variable OPDMCD10 "ALL OPD VISITS-MEDICAID AMT-DR 10";
label variable OPDPRV10 "ALL OPD VISITS-PRIV INS AMT-DR 10";
label variable OPDVA10 "ALL OPD VISITS-VA/CHAMPVA AMT-DR 10";
label variable OPDTRI10 "ALL OPD VISITS-TRICARE AMT-DR 10";
label variable OPDOFD10 "ALL OPD VISITS-OTHER FED AMT-DR 10";
label variable OPDSTL10 "ALL OPD VISITS-OTH ST/LOCAL AMT-DR 10";
label variable OPDWCP10 "ALL OPD VISITS-WORKERS COMP AMT-DR 10";
label variable OPDOPR10 "ALL OPD VISITS - OTH PRIVATE AMT-DR 10";
label variable OPDOPU10 "ALL OPD VISITS-OTH PUBLIC AMT-DR 10";
label variable OPDOSR10 "ALL OPD VSTS-OTH UNCLASS SRCE AMT-DR 10";
label variable OPDPTR10 "ALL OPD VISITS-PRV & TRI AMT -DR 10";
label variable OPDOTH10 "ALL OPD VISITS-OTH COMBINED AMT-DR 10";
label variable OPDRV10 "# OUTPATIENT DEPT PHYSICIAN VISITS 10";
label variable OPVTCH10 "OPD PHYSICIAN VISIT CHARGES - FAC 10";
label variable OPVEXP10 "TOTAL OUTPATIENT PHYSICIAN - FAC EXP 10";
label variable OPVSLF10 "OPD DR VISITS-SELF/FAMILY AMT-FAC 10";
label variable OPVMCR10 "OPD DR VISITS-MEDICARE AMT-FAC 10";
label variable OPVMCD10 "OPD DR VISITS-MEDICAID AMT-FAC 10";
label variable OPVPRV10 "OPD DR VISITS-PRIV INS AMT-FAC 10";
label variable OPVVA10 "OPD DR VISITS-VA/CHAMPVA AMT-FAC 10";
label variable OPVTRI10 "OPD DR VISITS-TRICARE AMT-FAC 10";
label variable OPVOFD10 "OPD DR VISITS-OTHER FED AMT-FAC 10";
label variable OPVSTL10 "OPD DR VISITS-OTH ST/LOCAL AMT-FAC 10";
label variable OPVWCP10 "OPD DR VISITS-WORKERS COMP AMT-FAC 10";
label variable OPVOPR10 "OPD DR VISITS - OTH PRIVATE AMT-FAC 10";
label variable OPVOPU10 "OPD DR VISITS-OTH PUBLIC AMT-FAC 10";
label variable OPVOSR10 "OPD DR VSTS-OTH UNCLASS SRCE AMT-FAC 10";
label variable OPVPTR10 "OPD DR VISITS - PRV & TRI AMT-FAC 10";
label variable OPVOTH10 "OPD DR VISITS - OTH COMBINED AMT-FAC 10";
label variable OPSEXP10 "TOTAL OUTPATIENT PHYSICIAN - DR EXP 10";
label variable OPSTCH10 "OPD PHYSICIAN VISIT CHARGES - DR 10";
label variable OPSSLF10 "OPD DR VISITS-SELF/FAMILY AMT-DR 10";
label variable OPSMCR10 "OPD DR VISITS-MEDICARE AMT-DR 10";
label variable OPSMCD10 "OPD DR VISITS-MEDICAID AMT-DR 10";
label variable OPSPRV10 "OPD DR VISITS-PRIV INS AMT-DR 10";
label variable OPSVA10 "OPD DR VISITS-VA/CHAMPVA AMT-DR 10";
label variable OPSTRI10 "OPD DR VISITS-TRICARE AMT-DR 10";
label variable OPSOFD10 "OPD DR VISITS-OTHER FED AMT-DR 10";
label variable OPSSTL10 "OPD DR VISITS-OTH ST/LOCAL AMT-DR 10";
label variable OPSWCP10 "OPD DR VISITS-WORKERS COMP AMT-DR 10";
label variable OPSOPR10 "OPD DR VISITS - OTH PRIVATE AMT-DR 10";
label variable OPSOPU10 "OPD DR VISITS-OTH PUBLIC AMT-DR 10";
label variable OPSOSR10 "OPD DR VSTS-OTH UNCLASS SRCE AMT-DR 10";
label variable OPSPTR10 "OPD DR VISITS - PRV & TRI AMT-DR 10";
label variable OPSOTH10 "OPD DR VISITS -OTH COMBINED AMT-DR 10";
label variable OPOTHV10 "# OUTPATIENT DEPT NON-DR VISITS 10";
label variable OPOTCH10 "OPD NON-PHYS VISIT CHARGES - FAC 10";
label variable OPOEXP10 "TOTAL OUTPATIENT NON-DR - FAC EXP 10";
label variable OPOSLF10 "OPD NON-DR VISITS-SELF/FAM AMT-FAC 10";
label variable OPOMCR10 "OPD NON-DR VISITS-MEDICARE AMT-FAC 10";
label variable OPOMCD10 "OPD NON-DR VISITS-MEDICAID AMT-FAC 10";
label variable OPOPRV10 "OPD NON-DR VISITS-PRIV INS AMT-FAC 10";
label variable OPOVA10 "OPD NON-DR VISITS-VA/CHAMPVA AMT-FAC 10";
label variable OPOTRI10 "OPD NON-DR VISITS-TRICARE AMT-FAC 10";
label variable OPOOFD10 "OPD NON-DR VISITS-OTHER FED AMT-FAC 10";
label variable OPOSTL10 "OPD NON-DR VISITS-OTH ST/LOC AMT-FAC 10";
label variable OPOWCP10 "OPD NON-DR VISITS-WRKRS COMP AMT-FAC 10";
label variable OPOOPR10 "OPD NON-DR VISITS-OTH PRIVATE AMT-FAC 10";
label variable OPOOPU10 "OPD NON-DR VISITS-OTH PUBLIC AMT-FAC 10";
label variable OPOOSR10 "OPD NON-DR VSTS-OT UNCLAS SRC AMT-FAC 10";
label variable OPOPTR10 "OPD NON-DR VISITS - PRV & TRI AMT-FAC 10";
label variable OPOOTH10 "OPD NON-DR VISITS-OTH COMBINED AM-FAC 10";
label variable OPPEXP10 "TOTAL OUTPATIENT NON-DR - DR EXP 10";
label variable OPPTCH10 "OPD NON-PHYS VISIT CHARGES - DR 10";
label variable OPPSLF10 "OPD NON-DR VISITS-SELF/FAM AMT-DR 10";
label variable OPPMCR10 "OPD NON-DR VISITS-MEDICARE AMT-DR 10";
label variable OPPMCD10 "OPD NON-DR VISITS-MEDICAID AMT-DR 10";
label variable OPPPRV10 "OPD NON-DR VISITS-PRIV INS AMT-DR 10";
label variable OPPVA10 "OPD NON-DR VISITS-VA/CHAMPVA AMT-DR 10";
label variable OPPTRI10 "OPD NON-DR VISITS-TRICARE AMT-DR 10";
label variable OPPOFD10 "OPD NON-DR VISITS-OTHER FED AMT-DR 10";
label variable OPPSTL10 "OPD NON-DR VISITS-OTH ST/LOC AMT-DR 10";
label variable OPPWCP10 "OPD NON-DR VISITS-WRKRS COMP AMT-DR 10";
label variable OPPOPR10 "OPD NON-DR VISITS-OTH PRIVATE AMT-DR 10";
label variable OPPOPU10 "OPD NON-DR VISITS-OTH PUBLIC AMT-DR 10";
label variable OPPOSR10 "OPD NON-DR VSTS-OT UNCLAS SRC AMT-DR 10";
label variable OPPPTR10 "OPD NON-DR VISITS - PRV & TRI AMT-DR 10";
label variable OPPOTH10 "OPD NON-DR VISITS-OTH COMBINED AMT-DR 10";
label variable AMCHIR10 "# CHIROPRACTR VSTS (OFF+OUTPAT), 2010";
label variable AMCTCH10 "CHIRO AMBULATORY VISIT CHARGES 10";
label variable AMCEXP10 "TOTL AMBULTRY (OB+OP) CHIRO EXP 10";
label variable AMCSLF10 "CHIRO AMB VISITS - SELF/FAMILY AMT 10";
label variable AMCMCR10 "CHIRO AMB VISITS - MEDICARE AMT 10";
label variable AMCMCD10 "CHIRO AMB VISITS - MEDICAID AMT 10";
label variable AMCPRV10 "CHIRO AMB VISITS - PRIVATE INS AMT 10";
label variable AMCVA10 "CHIRO AMB VISITS - VA/CHAMPVA AMT 10";
label variable AMCTRI10 "CHIRO AMB VISITS-TRICARE AMT 10";
label variable AMCOFD10 "CHIRO AMB VISITS - OTHER FEDERAL AMT 10";
label variable AMCSTL10 "CHIRO AMB VISITS - OTH ST/LOCAL AMT 10";
label variable AMCWCP10 "CHIRO AMB VISITS-WORKERS COMP AMT 10";
label variable AMCOPR10 "CHIRO AMB VISITS - OTH PRIVATE AMT 10";
label variable AMCOPU10 "CHIRO AMB VISITS - OTH PUBLIC AMT 10";
label variable AMCOSR10 "CHIR AMB VSTS - OTH UNCLASS SRCE AMT 10";
label variable AMCPTR10 "CHIRO AMB VISITS -PRV & TRI AMT 10";
label variable AMCOTH10 "CHIRO AMB VISITS - OTH COMBINED AMT 10";
label variable AMNURS10 "# AMB NURSE/PRCTITIONR VSTS(OB+OP) 10";
label variable AMNTCH10 "NRS/PRAC AMBULATORY VISIT CHARGES 10";
label variable AMNEXP10 "TOTL AMBULTRY (OB+OP) NURSE/PRAC EXP 10";
label variable AMNSLF10 "NRS/PRAC AMB VSTS - SELF/FAMILY AMT 10";
label variable AMNMCR10 "NRS/PRAC AMB VSTS - MEDICARE AMT 10";
label variable AMNMCD10 "NRS/PRAC AMB VSTS - MEDICAID AMT 10";
label variable AMNPRV10 "NRS/PRAC AMB VSTS - PRIV INS AMT 10";
label variable AMNVA10 "NRS/PRAC AMB VSTS-VA/CHAMPVA AMT 10";
label variable AMNTRI10 "NRS/PRAC AMB VSTS-TRICARE AMT 10";
label variable AMNOFD10 "NRS/PRAC AMB VSTS-OTHER FEDERAL AMT 10";
label variable AMNSTL10 "NRS/PRAC AMB VSTS-OTH ST/LOCAL AMT 10";
label variable AMNWCP10 "NRS/PRAC AMB VSTS-WORKERS COMP AMT 10";
label variable AMNOPR10 "NRS/PRAC AMB VSTS - OTH PRIVATE AMT 10";
label variable AMNOPU10 "NRS/PRAC AMB VSTS - OTH PUBLIC AMT 10";
label variable AMNOSR10 "NRS/PR AMB VSTS - OTH UNCLAS SRCE AMT 10";
label variable AMNPTR10 "NRS/PRAC AMB VSTS - PRV & TRI AMT 10";
label variable AMNOTH10 "NRS/PRAC AMB VSTS - OTH COMBINED AMT 10";
label variable AMOPTO10 "# AMB OPTOMETRIST VSTS (OB+OP) 10";
label variable AMETCH10 "OPTOMETRIST AMBULATORY VISIT CHARGES 10";
label variable AMEEXP10 "TOTL AMBULTRY (OB+OP) OPTOMETRIST EXP 10";
label variable AMESLF10 "OPTMTRIST AMB VSTS - SELF/FAMILY AMT 10";
label variable AMEMCR10 "OPTMTRIST AMB VSTS - MEDICARE AMT 10";
label variable AMEMCD10 "OPTMTRIST AMB VSTS - MEDICAID AMT 10";
label variable AMEPRV10 "OPTMTRIST AMB VSTS - PRIVATE INS AMT 10";
label variable AMEVA10 "OPTMTRIST AMB VSTS-VA/CHAMPVA AMT 10";
label variable AMETRI10 "OPTMTRIST AMB VSTS-TRICARE AMT 10";
label variable AMEOFD10 "OPTMTRIST AMB VSTS-OTHER FED AMT 10";
label variable AMESTL10 "OPTMTRIST AMB VSTS-OTH ST/LOCAL AMT 10";
label variable AMEWCP10 "OPTMTRIST AMB VSTS-WORKERS COMP AMT 10";
label variable AMEOPR10 "OPTMTRIST AMB VSTS - OTH PRIVATE AMT 10";
label variable AMEOPU10 "OPTMTRIST AMB VSTS - OTH PUBLIC AMT 10";
label variable AMEOSR10 "OPTOM AMB VSTS - OTH UNCLAS SRCE AMT 10";
label variable AMEPTR10 "OPTMTRIST AMB VSTS - PRV & TRI AMT 10";
label variable AMEOTH10 "OPTMTRIST AMB VSTS - OTH COMBINED AMT 10";
label variable AMASST10 "# PHYSICIAN ASS T VSTS (OFF+OUPAT), 2010";
label variable AMATCH10 "PHYS ASS T AMBULATORY VISIT CHARGES 10";
label variable AMAEXP10 "TOTL AMBULTRY (OB+OP) PHYS ASS T EXP 10";
label variable AMASLF10 "PHYS ASS T AMB VSTS-SELF/FAMILY AMT 10";
label variable AMAMCR10 "PHYS ASS T AMB VSTS-MEDICARE AMT 10";
label variable AMAMCD10 "PHYS ASS T AMB VSTS-MEDICAID AMT 10";
label variable AMAPRV10 "PHYS ASS T AMB VSTS-PRIVATE INS AMT 10";
label variable AMAVA10 "PHYS ASS T AMB VSTS-VA/CHAMPVA AMT 10";
label variable AMATRI10 "PHYS ASS T AMB VSTS-TRICARE AMT 10";
label variable AMAOFD10 "PHYS ASS T AMB VSTS - OTHER FED AMT 10";
label variable AMASTL10 "PHYS ASS T AMB VSTS-OTH ST/LOCL AMT 10";
label variable AMAWCP10 "PHYS ASS T AMB VSTS-WRKERS COMP AMT 10";
label variable AMAOPR10 "PHYS ASS T AMB VSTS - OTH PRIVATE AMT 10";
label variable AMAOPU10 "PHYS ASS T AMB VSTS - OTH PUBLIC AMT 10";
label variable AMAOSR10 "P A AMB VSTS - OTH UNCLASS SRCE AMT 10";
label variable AMAPTR10 "PHYS ASS T AMB VSTS - PRV & TRI AMT 10";
label variable AMAOTH10 "PHYS ASS T AMB VSTS-OTH COMBINED AMT 10";
label variable AMTHER10 "# AMB PT/OT THRPY VISITS (OB+OP) 10";
label variable AMTTCH10 "PT/OC AMBULATORY VISIT CHARGES 10";
label variable AMTEXP10 "TOTL AMBULTRY (OB+OP) PT/OT EXP 10";
label variable AMTSLF10 "PT/OT AMB VISITS-SELF/FAMILY AMT 10";
label variable AMTMCR10 "PT/OT AMB VISITS-MEDICARE AMT 10";
label variable AMTMCD10 "PT/OT AMB VISITS-MEDICAID AMT 10";
label variable AMTPRV10 "PT/OT AMB VISITS-PRIVATE INS AMT 10";
label variable AMTVA10 "PT/OT AMB VISITS-VA/CHAMPVA AMT 10";
label variable AMTTRI10 "PT/OT AMB VISITS-TRICARE AMT 10";
label variable AMTOFD10 "PT/OT AMB VISITS - OTHER FED AMT 10";
label variable AMTSTL10 "PT/OT AMB VISITS-OTH ST/LOCL AMT 10";
label variable AMTWCP10 "PT/OT AMB VISITS-WORKERS COMP AMT 10";
label variable AMTOPR10 "PT/OT AMB VISITS - OTH PRIVATE AMT 10";
label variable AMTOPU10 "PT/OT AMB VISITS-OTH PUBLIC AMT 10";
label variable AMTOSR10 "PT/OT AMB VSTS-OTH UNCLAS SRCE AMT 10";
label variable AMTPTR10 "PT/OT AMB VISITS -PRV & TRI AMT 10";
label variable AMTOTH10 "PT/OT AMB VISITS - OTH COMBINED AMT 10";
label variable AMTOTC10 "# CALLS W/OFFICE & OUPAT DEPTS, 2010";
label variable AMDRC10 "# CALLS W/OFF & OUTPAT PHYSICIANS, 2010";
label variable ERTOT10 "# EMERGENCY ROOM VISITS 10";
label variable ERTTCH10 "ER FACILITY + DR VISIT CHARGES 10";
label variable ERTEXP10 "TOTAL ER FACILITY + DR EXP 10";
label variable ERTSLF10 "ER-SELF/FAMILY AMT-(FAC+DR) 10";
label variable ERTMCR10 "ER-MEDICARE AMT-(FAC+DR) 10";
label variable ERTMCD10 "ER-MEDICAID AMT-(FAC+DR) 10";
label variable ERTPRV10 "ER-PRIV INS AMT-(FAC+DR) 10";
label variable ERTVA10 "ER-VA/CHAMPVA AMT-(FAC+DR) 10";
label variable ERTTRI10 "ER-TRICARE AMT-(FAC+DR) 10";
label variable ERTOFD10 "ER-OTHER FED AMT-(FAC+DR) 10";
label variable ERTSTL10 "ER-OTH ST/LOCAL AMT-(FAC+DR) 10";
label variable ERTWCP10 "ER-WORKERS COMP AMT-(FAC+DR) 10";
label variable ERTOPR10 "ER-OTH PRIVATE AMT-(FAC+DR) 10";
label variable ERTOPU10 "ER-OTH PUBLIC AMT-(FAC+DR) 10";
label variable ERTOSR10 "ER-OTH UNCLASS SRCE AMT-(FAC+DR) 10";
label variable ERTPTR10 "ER-PRV & TRI AMT (FAC+DR) 10";
label variable ERTOTH10 "ER -OTH COMBINED AMT (FAC+DR) 10";
label variable ERFTCH10 "ER FACILITY VISIT CHARGES 10";
label variable ERFEXP10 "TOTAL ER FACILITY EXP 10";
label variable ERFSLF10 "ER-SELF/FAMILY AMT - FAC 10";
label variable ERFMCR10 "ER-MEDICARE AMT - FAC 10";
label variable ERFMCD10 "ER-MEDICAID AMT - FAC 10";
label variable ERFPRV10 "ER-PRIVATE INS AMT - FAC 10";
label variable ERFVA10 "ER-VA/CHAMPVA AMT - FAC 10";
label variable ERFTRI10 "ER-TRICARE AMT - FAC 10";
label variable ERFOFD10 "ER-OTHER FEDERAL AMT - FAC 10";
label variable ERFSTL10 "ER-OTH ST/LOCAL AMT - FAC 10";
label variable ERFWCP10 "ER-WORKERS COMP AMT - FAC 10";
label variable ERFOPR10 "ER-OTHER PRIVATE AMT - FAC 10";
label variable ERFOPU10 "ER-OTHER PUBLIC AMT - FAC 10";
label variable ERFOSR10 "ER-OTH UNCLASS SRCE AMT - FAC 10";
label variable ERFPTR10 "ER-PRV & TRI AMT - FAC 10";
label variable ERFOTH10 "ER-OTH COMBINED AMT - FAC 10";
label variable ERDEXP10 "TOTAL EMERGENCY ROOM DR EXP 10";
label variable ERDTCH10 "ER DOCTOR VISIT CHARGES 10";
label variable ERDSLF10 "ER-SELF/FAMILY AMT - DR 10";
label variable ERDMCR10 "ER-MEDICARE AMT - DR 10";
label variable ERDMCD10 "ER-MEDICAID AMT - DR 10";
label variable ERDPRV10 "ER-PRIVATE INS AMT - DR 10";
label variable ERDVA10 "ER-VA/CHAMPVA AMT - DR 10";
label variable ERDTRI10 "ER-TRICARE AMT - DR 10";
label variable ERDOFD10 "ER-OTHER FED AMT - DR 10";
label variable ERDSTL10 "ER-OTH ST/LOCAL AMT - DR 10";
label variable ERDWCP10 "ER-WORKERS COMP AMT - DR 10";
label variable ERDOPR10 "ER - OTHER PRIVATE AMT - DR 10";
label variable ERDOPU10 "ER - OTHER PUBLIC AMT - DR 10";
label variable ERDOSR10 "ER-OTH UNCLASS SRCE AMT - DR 10";
label variable ERDPTR10 "ER-PRV & TRI AMT - DR 10";
label variable ERDOTH10 "ER-OTH COMBINED AMT - DR 10";
label variable IPZERO10 "# ZERO-NIGHT HOSPITAL STAYS 10";
label variable ZIFTCH10 "ZERO-NITE IP STAY CHARGES - FAC 10";
label variable ZIFEXP10 "TOTAL ZERO-NITE STAYS FAC EXP 10";
label variable ZIFSLF10 "ZERO-NITE IP STAZ-SELF/FAM AMT-FAC 10";
label variable ZIFMCR10 "ZERO-NITE IP STAZ-MEDICARE AMT-FAC 10";
label variable ZIFMCD10 "ZERO-NITE IP STAZ-MEDICAID AMT-FAC 10";
label variable ZIFPRV10 "ZERO-NITE IP STAZ-PRIV INS AMT-FAC 10";
label variable ZIFVA10 "ZERO-NITE IP STAZ-VA/CHAMPVA AMT-FAC 10";
label variable ZIFTRI10 "ZERO-NITE IP STAZ-TRICARE AMT-FAC 10";
label variable ZIFOFD10 "ZERO-NITE IP STAZ-OTHER FED AMT-FAC 10";
label variable ZIFSTL10 "ZERO-NITE IP STAZ-OTH ST/LOC AMT-FAC 10";
label variable ZIFWCP10 "ZERO-NITE IP STAZ-WRKERS COMP AMT-FAC 10";
label variable ZIFOPR10 "ZERO-NITE IP STAZ-OTH PRIVATE AMT-FAC 10";
label variable ZIFOPU10 "ZERO-NITE IP STAZ-OTH PUBLIC AMT-FAC 10";
label variable ZIFOSR10 "ZERO-NITE IP STAZ-UNCLAS SRCE AMT-FAC 10";
label variable ZIFPTR10 "ZERO-NITE IP STAZ-PRV & TRI AMT-FAC 10";
label variable ZIFOTH10 "ZERO-NITE IP STAZ-OTH COMBINE AMT-FAC 10";
label variable ZIDEXP10 "TOTAL ZERO-NITE STAZ DR 10";
label variable ZIDTCH10 "ZERO-NITE IP STAY CHARGES - DR 10";
label variable ZIDSLF10 "ZERO-NITE IP STAZ-SELF/FAM AMT-DR 10";
label variable ZIDMCR10 "ZERO-NITE IP STAZ-MEDICARE AMT-DR 10";
label variable ZIDMCD10 "ZERO-NITE IP STAZ-MEDICAID AMT-DR 10";
label variable ZIDPRV10 "ZERO-NITE IP STAZ-PRIV INS AMT-DR 10";
label variable ZIDVA10 "ZERO-NITE IP STAZ-VA/CHAMPVA AMT-DR 10";
label variable ZIDTRI10 "ZERO-NITE IP STAZ-TRICARE AMT-DR 10";
label variable ZIDOFD10 "ZERO-NITE IP STAZ-OTHER FED AMT-DR 10";
label variable ZIDSTL10 "ZERO-NITE IP STAZ-OTH ST/LOC AMT-DR 10";
label variable ZIDWCP10 "ZERO-NITE IP STAZ-WRKERS COMP AMT-DR 10";
label variable ZIDOPR10 "ZERO-NITE IP STAZ-OTH PRIVATE AMT-DR 10";
label variable ZIDOPU10 "ZERO-NITE IP STAZ-OTH PUBLIC AMT-DR 10";
label variable ZIDOSR10 "ZERO-NITE IP STAZ-UNCLAS SRCE AMT-DR 10";
label variable ZIDPTR10 "ZERO-NITE IP STAZ-PRV & TRI AMT-DR 10";
label variable ZIDOTH10 "ZERO-NITE IP STAZ-OTH COMBINED AMT-DR 10";
label variable IPDIS10 "# HOSPITAL DISCHARGES, 2010";
label variable IPTEXP10 "TOT HOSP IP FACILITY + DR EXP 10";
label variable IPTTCH10 "IP HOSP STAY CHARGES (FAC+DR) 10";
label variable IPTSLF10 "IP HOSP STAZ-SELF/FAMILY AMT-(FAC+DR) 10";
label variable IPTMCR10 "IP HOSP STAZ-MEDICARE AMT-(FAC+DR) 10";
label variable IPTMCD10 "IP HOSP STAZ-MEDICAID AMT-(FAC+DR) 10";
label variable IPTPRV10 "IP HOSP STAZ-PRIV INS AMT-(FAC+DR) 10";
label variable IPTVA10 "IP HOSP STAZ-VA/CHAMPVA AMT-(FAC+DR) 10";
label variable IPTTRI10 "IP HOSP STAZ-TRICARE AMT-(FAC+DR) 10";
label variable IPTOFD10 "IP HOSP STAZ-OTHER FED AMT-(FAC+DR) 10";
label variable IPTSTL10 "IP HSP STAZ-OTH ST/LOCAL AMT-(FAC+DR) 10";
label variable IPTWCP10 "IP HOSP STAZ-WRKRS COMP AMT-(FAC+DR) 10";
label variable IPTOPR10 "IP HOSP STAZ-OTH PRIVATE AMT-(FAC+DR) 10";
label variable IPTOPU10 "IP HOSP STAZ-OTH PUBLIC AMT-(FAC+DR) 10";
label variable IPTOSR10 "IP HSP STAZ-OTH UNCLS SRC AMT(FAC+DR) 10";
label variable IPTPTR10 "IP HOSP STAZ-PRV & TRI AMT-(FAC+DR) 10";
label variable IPTOTH10 "IP HOSP STAZ-OTH COMBINED AMT(FAC+DR) 10";
label variable IPFEXP10 "TOT HOSP IP FACILITY EXP-INC 0 NITES 10";
label variable IPFTCH10 "IP HOSP STAY CHARGES - FAC 10";
label variable IPFSLF10 "IP HOSP STAZ-SELF/FAMILY AMT-FAC 10";
label variable IPFMCR10 "IP HOSP STAZ-MEDICARE AMT-FAC 10";
label variable IPFMCD10 "IP HOSP STAZ-MEDICAID AMT-FAC 10";
label variable IPFPRV10 "IP HOSP STAZ-PRIV INS AMT-FAC 10";
label variable IPFVA10 "IP HOSP STAZ-VA/CHAMPVA AMT-FAC 10";
label variable IPFTRI10 "IP HOSP STAZ-TRICARE AMT-FAC 10";
label variable IPFOFD10 "IP HOSP STAZ-OTHER FED AMT-FAC 10";
label variable IPFSTL10 "IP HOSP STAZ-OTH ST/LOCAL AMT-FAC 10";
label variable IPFWCP10 "IP HOSP STAZ-WORKERS COMP AMT-FAC 10";
label variable IPFOPR10 "IP HOSP STAZ - OTH PRIVATE AMT-FAC 10";
label variable IPFOPU10 "IP HOSP STAZ - OTH PUBLIC AMT-FAC 10";
label variable IPFOSR10 "IP HOSP STAZ-OT UNCLASS SRCE AMT-FAC 10";
label variable IPFPTR10 "IP HOSP STAZ-PRV & TRI AMT-FAC 10";
label variable IPFOTH10 "IP HOSP STAZ-OTH COMBINED AMT-FAC 10";
label variable IPDEXP10 "TOTL HOSP STAZ DR EXP 10";
label variable IPDTCH10 "IP HOSP STAY CHARGES - DR 10";
label variable IPDSLF10 "IP HOSP STAZ-SELF/FAMILY AMT-DR 10";
label variable IPDMCR10 "IP HOSP STAZ-MEDICARE AMT- DR 10";
label variable IPDMCD10 "IP HOSP STAZ-MEDICAID AMT-DR 10";
label variable IPDPRV10 "IP HOSP STAZ-PRIV INS AMT-DR 10";
label variable IPDVA10 "IP HOSP STAZ-VA/CHAMPVA AMT-DR 10";
label variable IPDTRI10 "IP HOSP STAZ-TRICARE AMT-DR 10";
label variable IPDOFD10 "IP HOSP STAZ-OTHER FED AMT-DR 10";
label variable IPDSTL10 "IP HOSP STAZ-OTH ST/LOCAL AMT-DR 10";
label variable IPDWCP10 "IP HOSP STAZ-WORKERS COMP AMT-DR 10";
label variable IPDOPR10 "IP HOSP STAZ - OTH PRIVATE AMT-DR 10";
label variable IPDOPU10 "IP HOSP STAZ - OTH PUBLIC AMT-DR 10";
label variable IPDOSR10 "IP HOSP STAZ-OT UNCLASS SORCE AMT-DR 10";
label variable IPDPTR10 "IP HOSP STAZ-PRV & TRI AMT-DR 10";
label variable IPDOTH10 "IP HOSP STAZ-OTH COMBINED AMT-DR 10";
label variable IPNGTD10 "# NIGHTS IN HOSP FOR DISCHARGES, 2010";
label variable DVTOT10 "# DENTAL CARE VISITS 10";
label variable DVTTCH10 "TOTAL DENTAL CARE VISIT CHARGES 10";
label variable DVTEXP10 "TOTAL DENTAL CARE EXP 10";
label variable DVTSLF10 "ALL DENTAL CARE - SELF/FAMILY AMT 10";
label variable DVTMCR10 "ALL DENTAL CARE - MEDICARE AMT 10";
label variable DVTMCD10 "ALL DENTAL CARE - MEDICAID AMT 10";
label variable DVTPRV10 "ALL DENTAL CARE - PRIVATE INS AMT 10";
label variable DVTVA10 "ALL DENTAL CARE - VA/CHAMPVA AMT 10";
label variable DVTTRI10 "ALL DENTAL CARE - TRICARE AMT 10";
label variable DVTOFD10 "ALL DENTAL CARE - OTHER FEDRL AMT 10";
label variable DVTSTL10 "ALL DENTAL CARE - OTH ST/LOCAL AMT 10";
label variable DVTWCP10 "ALL DENTAL CARE - WORKERS COMP AMT 10";
label variable DVTOPR10 "ALL DENTAL CARE - OTH PRIVATE AMT 10";
label variable DVTOPU10 "ALL DENTAL CARE - OTH PUBLIC AMT 10";
label variable DVTOSR10 "ALL DENT CARE-OT UNCLASS SRCE AMT 10";
label variable DVTPTR10 "ALL DENTAL CARE - PRV & TRI AMT 10";
label variable DVTOTH10 "ALL DENTAL CARE - OTH COMBINED AMT 10";
label variable DVGEN10 "# GENERAL DENTIST VISITS 10";
label variable DVGTCH10 "GENERAL DENTAL CARE VISIT CHARGES 10";
label variable DVGEXP10 "TOTAL GENERAL DENTIST EXP 10";
label variable DVGSLF10 "GNRL DENTAL VISITS - SELF/FAM AMT 10";
label variable DVGMCR10 "GNRL DENTAL VISITS - MEDICARE AMT 10";
label variable DVGMCD10 "GNRL DENTAL VISITS - MEDICAID AMT 10";
label variable DVGPRV10 "GNRL DENTAL VISITS - PRIVATE INS AMT 10";
label variable DVGVA10 "GNRL DENTAL VISITS - VA/CHAMPVA AMT 10";
label variable DVGTRI10 "GNRL DENTAL VISITS-TRICARE AMT 10";
label variable DVGOFD10 "GNRL DENTAL VISITS - OTHER FED AMT 10";
label variable DVGSTL10 "GNRL DENTAL VISITS - OTH ST/LOCAL AMT 10";
label variable DVGWCP10 "GNRL DENTAL VISITS - WORKERS COMP AMT 10";
label variable DVGOPR10 "GNRL DENTAL VISITS - OTH PRIVATE AMT 10";
label variable DVGOPU10 "GNRL DENTAL VISITS - OTH PUBLIC AMT 10";
label variable DVGOSR10 "GNRL DENT VSTS - OT UNCLASS SRCE AMT 10";
label variable DVGPTR10 "GNRL DENTAL VISITS - PRV & TRI AMT 10";
label variable DVGOTH10 "GNRL DENTAL VISITS - OTH COMBINED AMT 10";
label variable DVORTH10 "# ORTHODONTIST VISITS 10";
label variable DVOTCH10 "ORTHODONTIST VISIT CHARGES 10";
label variable DVOEXP10 "TOTAL ORTHODONTIST EXP 10";
label variable DVOSLF10 "ORTHODONTIST VISITS - SELF/FAMILY AMT 10";
label variable DVOMCR10 "ORTHODONTIST VISITS - MEDICARE AMT 10";
label variable DVOMCD10 "ORTHODONTIST VISITS - MEDICAID AMT 10";
label variable DVOPRV10 "ORTHODONTIST VISITS - PRIVATE INS AMT 10";
label variable DVOVA10 "ORTHODONTIST VISITS-VA/CHAMPVA AMT 10";
label variable DVOTRI10 "ORTHODONTIST VISITS-TRICARE AMT 10";
label variable DVOOFD10 "ORTHODONTIST VISITS-OTHR FED AMT 10";
label variable DVOSTL10 "ORTHODONTIST VISITS-OTHR ST/LOCAL AMT 10";
label variable DVOWCP10 "ORTHODONTIST VISITS-WORKERS COMP AMT 10";
label variable DVOOPR10 "ORTHODONTIST VISITS-OTHR PRIVATE AMT 10";
label variable DVOOPU10 "ORTHODONTIST VISITS-OTHR PUBLIC AMT 10";
label variable DVOOSR10 "ORTHODONT VSTS - OT UNCLASS SRCE AMT 10";
label variable DVOPTR10 "ORTHODONTIST VISITS - PRV & TRI AMT 10";
label variable DVOOTH10 "ORTHODONTIST VISITS-OTH COMBINED AMT 10";
label variable HHTOTD10 "# HOME HEALTH PROVIDER DAYS, 2010";
label variable HHAGD10 "# AGENCY HOME HEALTH PROVIDER DAYS 10";
label variable HHATCH10 "HOME HEALTH AGENCY VISIT CHARGES 10";
label variable HHAEXP10 "TOTAL HOME HEALTH AGENCY EXP 10";
label variable HHASLF10 "HOME HLTH AGENCY - SELF/FAMILY AMT 10";
label variable HHAMCR10 "HOME HLTH AGENCY - MEDICARE AMT 10";
label variable HHAMCD10 "HOME HLTH AGENCY - MEDICAID AMT 10";
label variable HHAPRV10 "HOME HLTH AGENCY - PRIVATE INS AMT 10";
label variable HHAVA10 "HOME HLTH AGENCY-VA/CHAMPVA AMT 10";
label variable HHATRI10 "HOME HLTH AGENCY-TRICARE AMT 10";
label variable HHAOFD10 "HOME HLTH AGENCY - OTHER FED AMT 10";
label variable HHASTL10 "HOME HLTH AGENCY-OTHR ST/LOCAL AMT 10";
label variable HHAWCP10 "HOME HLTH AGENCY - WORKERS COMP AMT 10";
label variable HHAOPR10 "HOME HLTH AGENCY - OTH PRIVATE AMT 10";
label variable HHAOPU10 "HOME HLTH AGENCY - OTH PUBLIC AMT 10";
label variable HHAOSR10 "H HLTH AGENCY - OT UNCLASS SRCE AMT 10";
label variable HHAPTR10 "HOME HLTH AGENCY - PRV & TRI AMT 10";
label variable HHAOTH10 "HOME HLTH AGENCY - OTH COMBINED AMT 10";
label variable HHINDD10 "# NON-AGENCY HOME HEALTH PROVIDR DAYS 10";
label variable HHNTCH10 "HOME HEALTH NON-AGENCY VISIT CHARGES 10";
label variable HHNEXP10 "TOTAL HOME HEALTH NON-AGNCY EXP 10";
label variable HHNSLF10 "HOME HLTH NON-AGNCY - SELF/FAM AMT 10";
label variable HHNMCD10 "HOME HLTH NON-AGNCY - MEDICAID AMT 10";
label variable HHNMCR10 "HOME HLTH NON-AGNCY - MEDICARE AMT 10";
label variable HHNPRV10 "HOME HLTH NON-AGNCY - PRIV INS AMT 10";
label variable HHNVA10 "HOME HLTH NON-AGNCY-VA/CHAMPVA AMT 10";
label variable HHNTRI10 "HOME HLTH NON-AGNCY-TRICARE AMT 10";
label variable HHNOFD10 "HOME HLTH NON-AGNCY-OTHR FED AMT 10";
label variable HHNSTL10 "HOME HLTH NON-AGNCY-OTHR ST/LOCL AMT 10";
label variable HHNWCP10 "HOME HLTH NON-AGNCY-WORKERS COMP AMT 10";
label variable HHNOPR10 "HOME HLTH NON-AGNCY-OTH PRIVATE AMT 10";
label variable HHNOPU10 "HOME HLTH NON-AGNCY-OTH PUBLIC AMT 10";
label variable HHNOSR10 "H HLTH NON-AGNCY-OT UNCLASS SRCE AMT 10";
label variable HHNPTR10 "HOME HLTH NON-AGNCY - PRV & TRI AMT 10";
label variable HHNOTH10 "HOME HLTH NON-AGNCY-OTH COMBINED AMT 10";
label variable HHINFD10 "# INFORMAL HOME HEALTH PROVIDER DAYS 10";
label variable VISEXP10 "TOTAL GLASSES/CONTACT LENS EXP 10";
label variable VISTCH10 "GLASSES/CONTACT LENSES CHARGES 10";
label variable VISSLF10 "GLASSES/CNTCT LENSES -SELF/FAM AMT 10";
label variable VISMCR10 "GLASSES/CNTCT LENSES-MEDICARE AMT 10";
label variable VISMCD10 "GLASSES/CNTCT LENSES-MEDICAID AMT 10";
label variable VISPRV10 "GLASSES/CNTCT LENSES-PRIV INS AMT 10";
label variable VISVA10 "GLASSES/CNTCT LENSES-VA/CHAMPVA AMT 10";
label variable VISTRI10 "GLASSES/LENSES-TRICARE AMT 10";
label variable VISOFD10 "GLASSES/CNTCT LENSES-OTHR FED AMT 10";
label variable VISSTL10 "GLASSES/CNTCT LENSES-OTH ST/LOCL AMT 10";
label variable VISWCP10 "GLASSES/CNTCT LENSES-WORKERS COMP AMT 10";
label variable VISOPR10 "GLASSES/CNTCT LENSES-OTH PRIVATE AMT 10";
label variable VISOPU10 "GLASSES/CNTCT LENSES-OTH PUBLIC AMT 10";
label variable VISOSR10 "GLASES/CNTCT LENSE-OT UNCLAS SRCE AMT 10";
label variable VISPTR10 "GLASSES/CNTCT LENSES-PRV & TRI AMT 10";
label variable VISOTH10 "GLASSES/CNTCT LENSES-OTH COMBINED AMT 10";
label variable OTHTCH10 "OTHER EQUP/SUPPLIES CHARGES 10";
label variable OTHEXP10 "TOT OTHER EQUIP/SPLY (EXCL DIAB) EXP 10";
label variable OTHSLF10 "OTHER EQUP/SUPPLIES-SELF/FAM AMT 10";
label variable OTHMCR10 "OTHER EQUP/SUPPLIES-MEDICARE AMT 10";
label variable OTHMCD10 "OTHER EQUP/SUPPLIES-MEDICAID AMT 10";
label variable OTHPRV10 "OTHER EQUP/SUPPLIES-PRIV INS AMT 10";
label variable OTHVA10 "OTHER EQUP/SUPPLY-VA/CHAMPVA AMT 10";
label variable OTHTRI10 "OTHER EQUP/SUPPLY-TRICARE AMT 10";
label variable OTHOFD10 "OTHER EQUP/SUPPLIES-OTHR FEDRL AMT 10";
label variable OTHSTL10 "OTHER EQUP/SUPPLY-OTHR ST/LOCAL AMT 10";
label variable OTHWCP10 "OTHER EQUP/SUPPLY - WORKERS COMP AMT 10";
label variable OTHOPR10 "OTHER EQUP/SUPPLY-OTH PRIVATE AMT 10";
label variable OTHOPU10 "OTHER EQUP/SUPPLY - OTH PUBLIC AMT 10";
label variable OTHOSR10 "OTH EQUP/SUPLY - OT UNCLASS SRCE AMT 10";
label variable OTHPTR10 "OTHER EQUP/SUPPLY - PRV & TRI AMT 10";
label variable OTHOTH10 "OTHER EQUP/SUPPLY - OTH COMBINED AMT 10";
label variable RXTOT10 "# PRESC MEDS INCL REFILLS 10";
label variable RXEXP10 "TOTAL RX-EXP 10";
label variable RXSLF10 "TOTAL RX-SELF/FAMILY AMT 10";
label variable RXMCR10 "TOTAL RX-MEDICARE AMT 10";
label variable RXMCD10 "TOTAL RX-MEDICAID AMT 10";
label variable RXPRV10 "TOTAL RX-PRIVATE INS AMT 10";
label variable RXVA10 "TOTAL RX-VA/CHAMPVA AMT 10";
label variable RXTRI10 "TOTAL RX-TRICARE AMT 10";
label variable RXOFD10 "TOTAL RX-OTHER FED AMT 10";
label variable RXSTL10 "TOTAL RX-OTHER ST/LOCAL AMT 10";
label variable RXWCP10 "TOTAL RX-WORKERS COMP AMT 10";
label variable RXOPR10 "TOTAL RX-OTH PRIVATE AMT 10";
label variable RXOPU10 "TOTAL RX-OTH PUBLIC AMT 10";
label variable RXOSR10 "TOT RX-OTH UNCLASS SRCE AMT 10";
label variable RXPTR10 "TOTAL RX-PRV & TRI AMT 10";
label variable RXOTH10 "TOTAL RX-OTH COMBINED AMT 10";
label variable PERWT10F "FINAL PERSON WEIGHT, 2010";
label variable FAMWT10F "FINAL FAMILY WEIGHT, 2010";
label variable FAMWT10C "POV ADJ FAMILY WGT-CPS FAM ON 12/31/10";
label variable SAQWT10F "FINAL SAQ PERSON WEIGHT, 2010";
label variable DIABW10F "FINAL DIABETES CARE SUPPLEMENT WEIGHT";
label variable VARSTR "VARIANCE ESTIMATION STRATUM - 2010";
label variable VARPSU "VARIANCE ESTIMATION PSU - 2010";


*DEFINE VALUE LABELS FOR REPORTS;
label define H1380001X
         -1 "-1 INAPPLICABLE"
         1 "1 YES" ;

label define H1380002X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - ACTIVE DUTY"
         2 "2 NO - NOT FT ACTIVE DUTY"
         3 "3 UNDER 16 - INAPPLICABLE"
         4 "4 OVER 59 - INAPPLICABLE" ;

label define H1380003X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - ACTIVE DUTY"
         2 "2 NO - NOT FT ACTIVE DUTY"
         3 "3 UNDER 16 - INAPPLICABLE"
         4 "4 OVER 59 - INAPPLICABLE" ;

label define H1380004X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - ACTIVE DUTY"
         2 "2 NO - NOT FT ACTIVE DUTY"
         3 "3 UNDER 16 - INAPPLICABLE"
         4 "4 OVER 59 - INAPPLICABLE" ;

label define H1380005X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380006X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380007X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE"
         1 "1 1"
         2 "2 2"
         3 "3 3"
         4 "4 4"
         5 "5 5 TO 9"
         6 "6 10 OR MORE" ;

label define H1380008X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380009X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LIMITED A LOT"
         2 "2 LIMITED A LITTLE"
         3 "3 NOT LIMITED" ;

label define H1380010X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380011X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380012X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380013X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LIMITED A LOT"
         2 "2 LIMITED A LITTLE"
         3 "3 NOT LIMITED" ;

label define H1380014X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380015X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NOT AT ALL"
         1 "1 SEVERAL DAYS"
         2 "2 MORE THAN HALF THE DAYS"
         3 "3 NEARLY EVERY DAY" ;

label define H1380016X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380017X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380018X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380019X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380020X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1380021X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380022X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380023X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 WORST HEALTH CARE POSSIBLE"
         10 "10 BEST HEALTH CARE POSSIBLE" ;

label define H1380024X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380025X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380026X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380027X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAGREE STRONGLY"
         2 "2 DISAGREE SOMEWHAT"
         3 "3 UNCERTAIN"
         4 "4 AGREE SOMEWHAT"
         5 "5 AGREE STRONGLY" ;

label define H1380028X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAGREE STRONGLY"
         2 "2 DISAGREE SOMEWHAT"
         3 "3 UNCERTAIN"
         4 "4 AGREE SOMEWHAT"
         5 "5 AGREE STRONGLY" ;

label define H1380029X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NOT AT ALL"
         1 "1 SEVERAL DAYS"
         2 "2 MORE THAN HALF THE DAYS"
         3 "3 NEARLY EVERY DAY" ;

label define H1380030X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380031X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380032X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380033X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ENGLISH VERSION SAQ WAS ADMINISTERED"
         2 "2 SPANISH VERSION SAQ WAS ADMINISTERED" ;

label define H1380034X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380035X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380036X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380037X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380038X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380039X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380040X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380041X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380042X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380043X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO"
         3 "3 HAD NO VISITS IN THE LAST 12 MONTHS" ;

label define H1380044X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAGREE STRONGLY"
         2 "2 DISAGREE SOMEWHAT"
         3 "3 UNCERTAIN"
         4 "4 AGREE SOMEWHAT"
         5 "5 AGREE STRONGLY" ;

label define H1380045X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NOT AT ALL"
         2 "2 A LITTLE BIT"
         3 "3 MODERATELY"
         4 "4 QUITE A BIT"
         5 "5 EXTREMELY" ;

label define H1380046X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380047X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380048X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 SELF-ADMINISTERED"
         1 "1 MOTHER"
         10 "10 FATHER-IN-LAW"
         100 "100 INTERVIEWER ADMINISTERED"
         11 "11 SISTER-IN-LAW"
         12 "12 BROTHER-IN-LAW"
         13 "13 DAUGHTER-IN-LAW"
         14 "14 SON-IN-LAW"
         15 "15 STEPMOTHER"
         16 "16 STEPFATHER"
         17 "17 STEPDAUGHTER"
         18 "18 STEPSON"
         19 "19 GRANDMOTHER"
         2 "2 FATHER"
         20 "20 GRANDFATHER"
         21 "21 AUNT"
         22 "22 UNCLE"
         23 "23 NIECE"
         24 "24 NEPHEW"
         25 "25 COUSIN"
         26 "26 GRANDSON"
         27 "27 GRANDDAUGHTER"
         28 "28 FEMALE PARTNER"
         29 "29 MALE PARTNER"
         3 "3 SISTER/STEP - /HALF"
         30 "30 MOTHER'S PARTNER"
         31 "31 FATHER'S PARTNER"
         32 "32 PARTNER'S DAUGHTER"
         33 "33 PARTNER'S SON"
         35 "35 GREAT GRANDMOTHER"
         36 "36 GREAT GRANDFATHER"
         37 "37 GREAT GRANDDAUGHTER"
         38 "38 GREAT GRANDSON"
         39 "39 GREAT AUNT"
         4 "4 BROTHER/STEP - /HALF"
         40 "40 GREAT UNCLE"
         41 "41 GREAT NIECE"
         42 "42 GREAT NEPHEW"
         43 "43 FOSTER MOTHER"
         44 "44 FOSTER FATHER"
         45 "45 FOSTER DAUGHTER"
         46 "46 FOSTER SON"
         47 "47 PARENT"
         48 "48 GRANDPARENT"
         49 "49 NOT PERSON ON SAQ LABEL,RELATIONSHIP UNK"
         5 "5 DAUGHTER/ADOPTED DAUGHTER"
         6 "6 SON/ADOPTED SON"
         7 "7 WIFE/SPOUSE"
         8 "8 HUSBAND/SPOUSE"
         9 "9 MOTHER-IN-LAW"
         91 "91 OTHER RELATED, SPECIFY"
         99 "99 NOT RELATED" ;

label define H1380049X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380050X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380051X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380052X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAGREE STRONGLY"
         2 "2 DISAGREE SOMEWHAT"
         3 "3 UNCERTAIN"
         4 "4 AGREE SOMEWHAT"
         5 "5 AGREE STRONGLY" ;

label define H1380053X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380054X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380055X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380056X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380057X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALL OF THE TIME"
         2 "2 MOST OF THE TIME"
         3 "3 SOME OF THE TIME"
         4 "4 LITTLE OF THE TIME"
         5 "5 NONE OF THE TIME" ;

label define H1380058X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380059X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380060X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380061X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE OF THE TIME"
         1 "1 LITTLE OF THE TIME"
         2 "2 SOME OF THE TIME"
         3 "3 MOST OF THE TIME"
         4 "4 ALL OF THE TIME" ;

label define H1380062X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 AFDC"
         2 "2 NOT AFDC" ;

label define H1380063X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 VERY DIFFICULT"
         2 "2 SOMEWHAT DIFFICULT"
         3 "3 NOT TOO DIFFICULT"
         4 "4 NOT AT ALL DIFFICULT" ;

label define H1380064X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380065X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380066X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380067X
         0 "0.00"
         137 "$1 - $137" ;

label define H1380068X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380069X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380070X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380071X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM"
         95 "95 NO VISITS IN LAST 12 MONTHS" ;

label define H1380072X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM"
         95 "95 NO VISITS IN LAST 12 MONTHS" ;

label define H1380073X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380074X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380075X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380076X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380077X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 RHEUMATOID ARTHRITIS"
         2 "2 OSTEOARTHRITIS"
         3 "3 NOT SPECIFIED" ;

label define H1380078X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380079X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380080X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380081X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380082X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380083X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380084X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380085X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380086X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380087X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380088X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380089X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380090X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380091X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380092X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST 2 YEARS"
         2 "2 WITHIN PAST 3 YEARS"
         3 "3 WITHIN PAST 5 YEARS"
         4 "4 MORE THAN 5 YEARS"
         5 "5 NEVER" ;

label define H1380093X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9  NOT ASCERTAINED"
         1 "1 WITHIN PAST 2 YEARS"
         2 "2 WITHIN PAST 3 YEARS"
         3 "3 WITHIN PAST 5 YEARS"
         4 "4 MORE THAN 5 YEARS"
         5 "5 NEVER" ;

label define H1380094X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN LAST 7 DAYS"
         2 "2 MORE THAN 7, BUT WITHIN LAST 30 DAYS"
         3 "3 MORE THAN 30 DAYS AGO" ;

label define H1380095X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380096X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380097X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380098X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380099X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380100X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380101X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2009 "2009 YEAR"
         2010 "2010 YEAR" ;

label define H1380102X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR" ;

label define H1380103X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR"
         2011 "2011 YEAR" ;

label define H1380104X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380105X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380106X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380107X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380108X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380109X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380110X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380111X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380112X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380113X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380114X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380115X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380116X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380117X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380118X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380119X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380120X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380121X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380122X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 INCORPORATED"
         2 "2 PROPRIETORSHIP"
         3 "3 PARTNERSHIP" ;

label define H1380123X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 INCORPORATED"
         2 "2 PROPRIETORSHIP"
         3 "3 PARTNERSHIP" ;

label define H1380124X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 INCORPORATED"
         2 "2 PROPRIETORSHIP"
         3 "3 PARTNERSHIP" ;

label define H1380125X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PART OF A ROUTINE EXAM"
         2 "2 BECAUSE OF A PROBLEM"
         3 "3 SOME OTHER REASON" ;

label define H1380126X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 WITHIN PAST 10 YEARS"
         6 "6 MORE THAN 10 YEARS"
         7 "7 NEVER" ;

label define H1380127X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380128X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380129X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380130X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380131X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380132X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380133X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380134X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380135X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380136X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380137X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380138X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380139X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380140X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380141X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380142X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380143X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380144X
         -1 "-1  INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380145X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380146X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380147X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380148X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380149X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380150X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380151X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380152X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380153X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380154X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380155X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380156X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380157X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380158X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380159X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380160X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NONE"
         1 "1 1"
         2 "2 2"
         3 "3 3"
         4 "4 4"
         5 "5 5 TO 9"
         6 "6 10 OR MORE" ;

label define H1380161X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380162X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380163X
         -1 "-1  INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380164X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380165X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380166X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380167X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380168X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380169X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380170X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380171X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380172X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LEFT PREVIOUS CMJ/HAS CMJ"
         2 "2 CHANGED CURRENT MAIN JOB"
         3 "3 LEFT PREVIOUS CMJ/DOES NOT HAVE CMJ"
         4 "4 PREVIOUS CMJ CONTINUES; NO JOB CHANGE" ;

label define H1380173X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LEFT PREVIOUS CMJ/HAS CMJ"
         2 "2 CHANGED CURRENT MAIN JOB"
         3 "3 LEFT PREVIOUS CMJ/DOES NOT HAVE CMJ"
         4 "4 PREVIOUS CMJ CONTINUES; NO JOB CHANGE" ;

label define H1380174X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 WORST HEALTH CARE POSSIBLE"
         10 "10 BEST HEALTH CARE POSSIBLE" ;

label define H1380175X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380176X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380177X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380178X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380179X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380180X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380181X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380182X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380183X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380184X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380185X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380186X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380187X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380188X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380189X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380190X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380191X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380192X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380193X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380194X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380195X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380196X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380197X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380198X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380199X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380200X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380201X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380202X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380203X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380204X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380205X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO"
         3 "3 NOT APPLICABLE" ;

label define H1380206X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PART OF A ROUTINE EXAM"
         2 "2 BECAUSE OF A PROBLEM"
         3 "3 SOME OTHER REASON" ;

label define H1380207X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 WITHIN PAST 10 YEARS"
         6 "6 MORE THAN 10 YEARS"
         7 "7 NEVER" ;

label define H1380208X
         -1 "-1 INAPPLICABLE"
         -8 "-8 DK"
         1 "1 YES"
         2 "2 NO" ;

label define H1380209X
         -1 "-1 INAPPLICABLE"
         -8 "-8 DK"
         1 "1 YES"
         2 "2 NO" ;

label define H1380210X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380211X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380212X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380213X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380214X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO"
         3 "3 UNKNOWN" ;

label define H1380215X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380216X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380217X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380218X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380219X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380220X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380221X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380222X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380223X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380224X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380225X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380226X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380227X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380228X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380229X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1380230X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ITEMIZED DEDUCTIONS"
         2 "2 STANDARD DEDUCTIONS" ;

label define H1380231X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380232X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 TWICE A YEAR OR MORE"
         2 "2 ONCE A YEAR"
         3 "3 LESS THAN ONCE A YEAR"
         4 "4 NEVER GO TO DENTIST" ;

label define H1380233X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380234X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380235X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380236X
         -1 "-1 INAPPLICABLE"
         1 "1 YES" ;

label define H1380237X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 VERY DIFFICULT"
         2 "2 SOMEWHAT DIFFICULT"
         3 "3 NOT TOO DIFFICULT"
         4 "4 NOT AT ALL DIFFICULT" ;

label define H1380238X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380239X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380240X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380241X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES [WAGE AMOUNT CHANGED]"
         2 "2 NO [WAGE AMOUNT DID NOT CHANGE]" ;

label define H1380242X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES [WAGE AMOUNT CHANGED]"
         2 "2 NO [WAGE AMOUNT DID NOT CHANGE]" ;

label define H1380243X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES [WAGE AMOUNT CHANGED]"
         2 "2 NO [WAGE AMOUNT DID NOT CHANGE]" ;

label define H1380244X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAVOWS INSURANCE THROUGH CMJ"
         2 "2 DOES NOT DISAVOW INSURANCE THROUGH CMJ" ;

label define H1380245X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAVOWS INSURANCE THROUGH CMJ"
         2 "2 DOES NOT DISAVOW INSURANCE THROUGH CMJ" ;

label define H1380246X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISAVOWS INSURANCE THROUGH CMJ"
         2 "2 DOES NOT DISAVOW INSURANCE THROUGH CMJ" ;

label define H1380247X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380248X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380249X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380250X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380251X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380252X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380253X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380254X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380255X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380256X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380257X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380258X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380259X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380260X
         -1 "-1 INAPPLICABLE"
         1 "1 DEPS IN RU"
         2 "2 DEPS IN AND OUT OF RU"
         3 "3 DEPS OUT OF RU" ;

label define H1380261X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NO DEPENDENTS OUTSIDE RU"
         1 "1 ONE DEPENDENT OUTSIDE RU"
         2 "2 TWO DEPENDENTS OUTSIDE RU"
         3 "3 THREE DEPENDENTS OUTSIDE RU" ;

label define H1380262X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NUMBER OF TIMES"
         95 "95 95 TIMES OR MORE"
         96 "96 DID NOT HAVE A1C BLOOD TEST" ;

label define H1380263X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380264X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380265X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380266X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380267X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380268X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380269X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380270X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380271X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NOT CONFIDENT AT ALL"
         2 "2 SOMEWHAT CONFIDENT"
         3 "3 CONFIDENT"
         4 "4 VERY CONFIDENT" ;

label define H1380272X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380273X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380274X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380275X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380276X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380277X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380278X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380279X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380280X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380281X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380282X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380283X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380284X
         -1 "-1  INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8  DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380285X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380286X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380287X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380288X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380289X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380290X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380291X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380292X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380293X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380294X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380295X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380296X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380297X
         0 "0.00"
         5500 "$1 - $5,500" ;

label define H1380298X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380299X
         0 "0.00"
         305 "$1 - $305" ;

label define H1380300X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380301X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380302X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 NO SCHOOL/KINDERGARTEN ONLY"
         12 "12 GRADE 12"
         13 "13 1 YEAR COLLEGE"
         14 "14 2 YEARS COLLEGE"
         15 "15 3 YEARS COLLEGE"
         16 "16 4 YEARS COLLEGE"
         17 "17 5+ YEARS COLLEGE" ;

label define H1380303X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO"
         3 "3 NOT APPLICABLE" ;

label define H1380304X
         1 "1 PERSON IS ELIGIBLE"
         2 "2 PERSON IS IN NON-RESPONDING RU"
         3 "3 PERSON IS NOT ELIGIBLE"
         4 "4 PERSON IS NOT IN AN RU" ;

label define H1380305X
         1 "1 PERSON IS ELIGIBLE"
         2 "2 PERSON IS IN NON-RESPONDING RU"
         3 "3 PERSON IS NOT ELIGIBLE"
         4 "4 PERSON IS NOT IN AN RU" ;

label define H1380306X
         1 "1 PERSON IS ELIGIBLE"
         2 "2 PERSON IS IN NON-RESPONDING RU"
         3 "3 PERSON IS NOT ELIGIBLE"
         4 "4 PERSON IS NOT IN AN RU" ;

label define H1380307X
         1 "1 PERSON IS ELIGIBLE"
         2 "2 PERSON IS IN NON-RESPONDING RU"
         3 "3 PERSON IS NOT ELIGIBLE"
         4 "4 PERSON IS NOT IN AN RU" ;

label define H1380308X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380309X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380310X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EMPLOYED AT RD 3/1 INT DATE"
         2 "2 JOB TO RETURN TO AT RD 3/1 INT DATE"
         3 "3 JOB DURING RD 3/1 REF PERIOD"
         4 "4 NOT EMPLOYED DURING RD 3/1" ;

label define H1380311X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EMPLOYED AT RD 4/2 INT DATE"
         2 "2 JOB TO RETURN TO AT RD 4/2 INT DATE"
         3 "3 JOB DURING RD 4/2 REF PERIOD"
         4 "4 NOT EMPLOYED DURING RD 4/2" ;

label define H1380312X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EMPLOYED AT RD 5/3 INT DATE"
         2 "2 JOB TO RETURN TO AT RD 5/3 INT DATE"
         3 "3 JOB DURING RD 5/3 REF PERIOD"
         4 "4 NOT EMPLOYED DURING RD 5/3" ;

label define H1380313X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380314X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380315X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380316X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380317X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380318X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380319X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380320X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1380321X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR" ;

label define H1380322X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR" ;

label define H1380323X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR" ;

label define H1380324X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         2010 "2010 YEAR"
         2011 "2011 YEAR" ;

label define H1380325X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380326X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380327X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380328X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380329X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380330X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380331X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380332X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380333X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380334X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380335X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380336X
         -1 "-1 INAPPLICABLE"
         0 "0 NOT A REFERENCE PERSON"
         1 "1 REFERENCE PERSON" ;

label define H1380337X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON"
         10 "10 PERSONS"
         11 "11 PERSONS"
         12 "12 PERSONS"
         13 "13 PERSONS"
         14 "14 PERSONS"
         15 "15 PERSONS"
         16 "16 PERSONS"
         17 "17 PERSONS"
         18 "18 PERSONS"
         2 "2 PERSONS"
         3 "3 PERSONS"
         4 "4 PERSONS"
         5 "5 PERSONS"
         6 "6 PERSONS"
         7 "7 PERSONS"
         8 "8 PERSONS"
         9 "9 PERSONS" ;

label define H1380338X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON"
         10 "10 PERSONS"
         11 "11 PERSONS"
         12 "12 PERSONS"
         13 "13 PERSONS"
         14 "14 PERSONS"
         15 "15 PERSONS"
         16 "16 PERSONS"
         17 "17 PERSONS"
         18 "18 PERSONS"
         2 "2 PERSONS"
         3 "3 PERSONS"
         4 "4 PERSONS"
         5 "5 PERSONS"
         6 "6 PERSONS"
         7 "7 PERSONS"
         8 "8 PERSONS"
         9 "9 PERSONS" ;

label define H1380339X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON"
         10 "10 PERSONS"
         11 "11 PERSONS"
         12 "12 PERSONS"
         13 "13 PERSONS"
         14 "14 PERSONS"
         15 "15 PERSONS"
         16 "16 PERSONS"
         17 "17 PERSONS"
         18 "18 PERSONS"
         2 "2 PERSONS"
         3 "3 PERSONS"
         4 "4 PERSONS"
         5 "5 PERSONS"
         6 "6 PERSONS"
         7 "7 PERSONS"
         8 "8 PERSONS"
         9 "9 PERSONS" ;

label define H1380340X
         -1 "-1 INAPP, NOT MEM OF 12/31 FAMILY"
         0 "0 NOT A REFERENCE PERSON"
         1 "1 REFERENCE PERSON" ;

label define H1380341X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380342X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIMARY FILER"
         2 "2 SECONDARY FILER" ;

label define H1380343X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SINGLE"
         2 "2 MARRIED FILING JOINT RETURN"
         3 "3 MARRIED FILING SEPARATELY"
         4 "4 HEAD OF HOUSEHOLD W/ QUALIFYING PERSON"
         5 "5 QUALIFYING WIDOWER W/ DEPENDENT" ;

label define H1380344X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380345X
         -1 "-1 INAPPLICABLE"
         0 "0 NONRESPONDING 12/31 FAMILY"
         1 "1 RESPONDING 12/31 FAMILY" ;

label define H1380346X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380347X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380348X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380349X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380350X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0.00" ;

label define H1380351X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 FULL-TIME"
         2 "2 PART-TIME"
         3 "3 NOT A STUDENT" ;

label define H1380352X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 FULL-TIME"
         2 "2 PART-TIME"
         3 "3 NOT A STUDENT" ;

label define H1380353X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 FULL-TIME"
         2 "2 PART-TIME"
         3 "3 NOT A STUDENT" ;

label define H1380354X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 FULL-TIME"
         2 "2 PART-TIME"
         3 "3 NOT A STUDENT" ;

label define H1380355X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM"
         95 "95 DO NOT HAVE PERSONAL DOCTOR OR NURSE" ;

label define H1380356X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM"
         95 "95 DO NOT HAVE PERSONAL DOCTOR OR NURSE" ;

label define H1380357X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MALE"
         2 "2 FEMALE" ;

label define H1380358X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DRIVE"
         2 "2 IS DRIVEN"
         3 "3 TAXI, BUS, TRAIN, OTHER PUBLIC TRANSPO"
         4 "4 WALKS"
         5 "5 SOME OTHER WAY" ;

label define H1380359X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380360X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380361X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380362X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380363X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380364X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 MODERATE IMPAIRMENT"
         4 "4 MAJOR IMPAIRMENT"
         5 "5 DEAF" ;

label define H1380365X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380366X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380367X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380368X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380369X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380370X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380371X
         0 "0.00"
         63646 "$1 - $63,646" ;

label define H1380372X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380373X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380374X
         0 "0.00"
         160 "$1 - $160" ;

label define H1380375X
         0 "0.00"
         53 "$1 - $53" ;

label define H1380376X
         0 "0.00"
         631 "$1 - $631" ;

label define H1380377X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380378X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380379X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380380X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DEGREE"
         2 "2 GED"
         3 "3 HIGH SCHOOL DIPLOMA"
         4 "4 BACHELOR'S DEGREE"
         5 "5 MASTER'S DEGREE"
         6 "6 DOCTORATE DEGREE"
         7 "7 OTHER DEGREE"
         8 "8 UNDER 16-INAPPLICABLE" ;

label define H1380381X
         1 "1 HISPANIC"
         2 "2 NOT HISPANIC" ;

label define H1380382X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PUERTO RICAN"
         2 "2 CUBAN/CUBAN AMERICAN"
         3 "3 DOMINICAN"
         4 "4 MEXICAN/MEXICAN AMERICAN"
         5 "5 CENTRAL OR SOUTH AMERICAN"
         6 "6 NON-HISPANIC"
         91 "91 OTHER LATIN AMERICAN"
         92 "92 OTHER HISPANIC/LATINO" ;

label define H1380383X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DEFINITELY TRUE"
         2 "2 MOSTLY TRUE"
         3 "3 DON'T KNOW"
         4 "4 MOSTLY FALSE"
         5 "5 DEFINITELY FALSE" ;

label define H1380384X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380385X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - HONORABLY DISCHARGED"
         2 "2 NO - NOT HONORABLY DISCHARGED"
         3 "3 16 OR YOUNGER - INAPPLICABLE"
         4 "4 NOW ACTIVE DUTY" ;

label define H1380386X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - HONORABLY DISCHARGED"
         2 "2 NO - NOT HONORABLY DISCHARGED"
         3 "3 16 OR YOUNGER - INAPPLICABLE"
         4 "4 NOW ACTIVE DUTY" ;

label define H1380387X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES - HONORABLY DISCHARGED"
         2 "2 NO - NOT HONORABLY DISCHARGED"
         3 "3 16 OR YOUNGER - INAPPLICABLE"
         4 "4 NOW ACTIVE DUTY" ;

label define H1380388X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380389X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380390X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380391X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380392X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380393X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380394X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380395X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380396X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380397X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380398X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380399X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380400X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380401X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380402X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380403X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380404X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380405X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380406X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380407X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380408X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380409X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380410X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380411X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380412X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380413X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380414X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380415X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380416X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380417X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380418X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380419X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380420X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380421X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380422X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380423X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380424X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380425X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380426X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380427X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380428X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380429X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380430X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380431X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380432X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380433X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380434X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380435X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380436X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380437X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380438X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380439X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380440X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380441X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380442X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380443X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380444X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380445X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380446X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380447X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380448X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380449X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380450X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380451X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380452X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380453X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380454X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380455X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380456X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380457X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380458X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380459X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380460X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380461X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380462X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380463X
         -1 "-1 INAPPLICABLE"
         -9 "-9 UNKNOWN (NOT IMPUTED)"
         1 "1 IMPUTED USING RANGE ESTIMATE"
         2 "2 IMPUTED WITHOUT RANGE ESTIMATE"
         3 "3 NO CALCULATION: HOURLY WAGE PROVIDED"
         4 "4 CALCULATED FROM SALARY"
         5 "5 CALCULATED FROM PAID BY DAY"
         6 "6 CALCULATED FROM PIECEWORK/JOB/MILE"
         7 "7 CALCULATED FROM COMMISSIONS"
         8 "8 CALCULATED FROM BONUS" ;

label define H1380464X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 UNKNOWN (NOT IMPUTED)"
         1 "1 IMPUTED USING RANGE ESTIMATE"
         2 "2 IMPUTED WITHOUT RANGE ESTIMATE"
         3 "3 NO CALCULATION: HOURLY WAGE PROVIDED"
         4 "4 CALCULATED FROM SALARY"
         5 "5 CALCULATED FROM PAID BY DAY"
         6 "6 CALCULATED FROM PIECEWORK/JOB/MILE"
         7 "7 CALCULATED FROM COMMISSIONS"
         8 "8 CALCULATED FROM BONUS" ;

label define H1380465X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 UNKNOWN (NOT IMPUTED)"
         1 "1 IMPUTED USING RANGE ESTIMATE"
         2 "2 IMPUTED WITHOUT RANGE ESTIMATE"
         3 "3 NO CALCULATION: HOURLY WAGE PROVIDED"
         4 "4 CALCULATED FROM SALARY"
         5 "5 CALCULATED FROM PAID BY DAY"
         6 "6 CALCULATED FROM PIECEWORK/JOB/MILE"
         7 "7 CALCULATED FROM COMMISSIONS"
         8 "8 CALCULATED FROM BONUS" ;

label define H1380466X
         -1 "-1 INAPPLICABLE"
         -10 "-10 HOURLY WAGE >= $74.52"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380467X
         -1 "-1 INAPPLICABLE"
         -10 "-10 HOURLY WAGE >= $74.52"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380468X
         -1 "-1 INAPPLICABLE"
         -10 "-10 HOURLY WAGE >= $74.52"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380469X
         0 "0 NO"
         1 "1 YES" ;

label define H1380470X
         0 "0 NO"
         1 "1 YES" ;

label define H1380471X
         0 "0 NO"
         1 "1 YES" ;

label define H1380472X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380473X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380474X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380475X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380476X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380477X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380478X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380479X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380480X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380481X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380482X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NATURAL RESOURCES"
         10 "10 EDUCATION, HEALTH, AND SOCIAL SERVICES"
         11 "11 LEISURE AND HOSPITALITY"
         12 "12 OTHER SERVICES"
         13 "13 PUBLIC ADMINISTRATION"
         14 "14 MILITARY"
         15 "15 UNCLASSIFIABLE INDUSTRY"
         2 "2 MINING"
         3 "3 CONSTRUCTION"
         4 "4 MANUFACTURING"
         5 "5 WHOLESALE AND RETAIL TRADE"
         6 "6 TRANSPORTATION AND UTILITIES"
         7 "7 INFORMATION"
         8 "8 FINANCIAL ACTIVITIES"
         9 "9 PROFESSIONAL AND BUSINESS SERVICES" ;

label define H1380483X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NATURAL RESOURCES"
         10 "10 EDUCATION, HEALTH, AND SOCIAL SERVICES"
         11 "11 LEISURE AND HOSPITALITY"
         12 "12 OTHER SERVICES"
         13 "13 PUBLIC ADMINISTRATION"
         14 "14 MILITARY"
         15 "15 UNCLASSIFIABLE INDUSTRY"
         2 "2 MINING"
         3 "3 CONSTRUCTION"
         4 "4 MANUFACTURING"
         5 "5 WHOLESALE AND RETAIL TRADE"
         6 "6 TRANSPORTATION AND UTILITIES"
         7 "7 INFORMATION"
         8 "8 FINANCIAL ACTIVITIES"
         9 "9 PROFESSIONAL AND BUSINESS SERVICES" ;

label define H1380484X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NATURAL RESOURCES"
         10 "10 EDUCATION, HEALTH, AND SOCIAL SERVICES"
         11 "11 LEISURE AND HOSPITALITY"
         12 "12 OTHER SERVICES"
         13 "13 PUBLIC ADMINISTRATION"
         14 "14 MILITARY"
         15 "15 UNCLASSIFIABLE INDUSTRY"
         2 "2 MINING"
         3 "3 CONSTRUCTION"
         4 "4 MANUFACTURING"
         5 "5 WHOLESALE AND RETAIL TRADE"
         6 "6 TRANSPORTATION AND UTILITIES"
         7 "7 INFORMATION"
         8 "8 FINANCIAL ACTIVITIES"
         9 "9 PROFESSIONAL AND BUSINESS SERVICES" ;

label define H1380485X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380486X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380487X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380488X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380489X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380490X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380491X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380492X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380493X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380494X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380495X
         1 "1 IN-SCOPE ON 12/31/2010"
         2 "2 NOT IN-SCOPE ON 12/31/2010" ;

label define H1380496X
         0 "0 INCOR LISTED/OUT-OF-SCOPE PRIOR 1/1/10"
         1 "1 INSCOPE FOR WHOLE REFERENCE PERIOD"
         2 "2 INSCOPE AT START OF REF PER, NOT END"
         3 "3 NOT INSCOPE STRT REF PER, INSCOPE END"
         4 "4 INSCOPE REF PER, BUT NOT START NOR END"
         5 "5 MEM OF RU BUT OUT-OF-SCOPE ALL REF PER"
         6 "6 OUT-OF-SCOPE IN RU DURING THIS ROUND"
         7 "7 NOT IN RU, JOINED IN LATER ROUND"
         8 "8 RU NON-RESPONSE"
         9 "9 NOT IN MEPS RU NOW, PREVIOUSLY A MEMBER" ;

label define H1380497X
         0 "0 INCOR LISTED/OUT-OF-SCOPE PRIOR 1/1/10"
         1 "1 INSCOPE FOR WHOLE REFERENCE PERIOD"
         2 "2 INSCOPE AT START OF REF PER, NOT END"
         3 "3 NOT INSCOPE STRT REF PER, INSCOPE END"
         4 "4 INSCOPE REF PER, BUT NOT START NOR END"
         5 "5 MEM OF RU BUT OUT-OF-SCOPE ALL REF PER"
         6 "6 OUT-OF-SCOPE IN RU DURING THIS ROUND"
         7 "7 NOT IN RU, JOINED IN LATER ROUND"
         8 "8 RU NON-RESPONSE"
         9 "9 NOT IN MEPS RU NOW, PREVIOUSLY A MEMBER" ;

label define H1380498X
         0 "0 INCOR LISTED/OUT-OF-SCOPE PRIOR 1/1/10"
         1 "1 INSCOPE FOR WHOLE REFERENCE PERIOD"
         2 "2 INSCOPE AT START OF REF PER, NOT END"
         3 "3 NOT INSCOPE STRT REF PER, INSCOPE END"
         4 "4 INSCOPE REF PER, BUT NOT START NOR END"
         5 "5 MEM OF RU BUT OUT-OF-SCOPE ALL REF PER"
         6 "6 OUT-OF-SCOPE IN RU DURING THIS ROUND"
         7 "7 NOT IN RU, JOINED IN LATER ROUND"
         8 "8 RU NON-RESPONSE"
         9 "9 NOT IN MEPS RU NOW, PREVIOUSLY A MEMBER" ;

label define H1380499X
         0 "0 INCOR LISTED/OUT-OF-SCOPE PRIOR 1/1/10"
         1 "1 INSCOPE FOR WHOLE REFERENCE PERIOD"
         2 "2 INSCOPE AT START OF REF PER, NOT END"
         3 "3 NOT INSCOPE STRT REF PER, INSCOPE END"
         4 "4 INSCOPE REF PER, BUT NOT START NOR END"
         5 "5 MEM OF RU BUT OUT-OF-SCOPE ALL REF PER"
         6 "6 OUT-OF-SCOPE IN RU DURING THIS ROUND"
         7 "7 NOT IN RU, JOINED IN LATER ROUND"
         8 "8 RU NON-RESPONSE"
         9 "9 NOT IN MEPS RU NOW, PREVIOUSLY A MEMBER" ;

label define H1380500X
         0 "0 NOT RECORDED AS BEING INSCOPE"
         1 "1 INSCOPE AT SOME TIME DURING 2010"
         2 "2 OUT-OF-SCOPE FOR ALL OF 2010" ;

label define H1380501X
         1 "1 ANY PRIVATE"
         2 "2 PUBLIC ONLY"
         3 "3 UNINSURED" ;

label define H1380502X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380503X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380504X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380505X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380506X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380507X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380508X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380509X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380510X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380511X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380512X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380513X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380514X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380515X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380516X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ENGLISH"
         2 "2 SPANISH"
         3 "3 ENGLISH & SPANISH"
         91 "91 OTHER" ;

label define H1380517X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380518X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380519X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380520X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380521X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE COMPANY OR FOREIGN GOVT"
         2 "2 FEDERAL GOVT OR ARMED FORCES"
         3 "3 STATE OR LOCAL GOVT" ;

label define H1380522X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE COMPANY OR FOREIGN GOVT"
         2 "2 FEDERAL GOVT OR ARMED FORCES"
         3 "3 STATE OR LOCAL GOVT" ;

label define H1380523X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE COMPANY OR FOREIGN GOVT"
         2 "2 FEDERAL GOVT OR ARMED FORCES"
         3 "3 STATE OR LOCAL GOVT" ;

label define H1380524X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380525X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380526X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380527X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380528X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380529X
         -1 "-1 INAPPLICABLE"
         1 "1 KEY"
         2 "2 NOT KEY" ;

label define H1380530X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380531X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380532X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380533X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380534X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ENGLISH"
         2 "2 SPANISH"
         3 "3 ANOTHER LANGUAGE" ;

label define H1380535X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380536X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380537X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380538X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380539X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 COMPLETELY UNABLE TO DO IT" ;

label define H1380540X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 COMPLETELY UNABLE TO DO IT" ;

label define H1380541X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380542X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380543X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380544X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380545X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 OFFICE"
         2 "2 HOSPITAL, NOT ER"
         3 "3 HOSPITAL, ER" ;

label define H1380546X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380547X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380548X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DEFINITELY TRUE"
         2 "2 MOSTLY TRUE"
         3 "3 DON'T KNOW"
         4 "4 MOSTLY FALSE"
         5 "5 DEFINITELY FALSE" ;

label define H1380549X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380550X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380551X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380552X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380553X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380554X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380555X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MARRIED"
         2 "2 WIDOWED"
         3 "3 DIVORCED"
         4 "4 SEPARATED"
         5 "5 NEVER MARRIED"
         6 "6 UNDER 16 - INAPPLICABLE" ;

label define H1380556X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MARRIED"
         10 "10 SEPARATED IN ROUND"
         2 "2 WIDOWED"
         3 "3 DIVORCED"
         4 "4 SEPARATED"
         5 "5 NEVER MARRIED"
         6 "6 UNDER 16 - INAPPLICABLE"
         7 "7 MARRIED IN ROUND"
         8 "8 WIDOWED IN ROUND"
         9 "9 DIVORCED IN ROUND" ;

label define H1380557X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MARRIED"
         10 "10 SEPARATED IN ROUND"
         2 "2 WIDOWED"
         3 "3 DIVORCED"
         4 "4 SEPARATED"
         5 "5 NEVER MARRIED"
         6 "6 UNDER 16 - INAPPLICABLE"
         7 "7 MARRIED IN ROUND"
         8 "8 WIDOWED IN ROUND"
         9 "9 DIVORCED IN ROUND" ;

label define H1380558X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MARRIED"
         10 "10 SEPARATED IN ROUND"
         2 "2 WIDOWED"
         3 "3 DIVORCED"
         4 "4 SEPARATED"
         5 "5 NEVER MARRIED"
         6 "6 UNDER 16 - INAPPLICABLE"
         7 "7 MARRIED IN ROUND"
         8 "8 WIDOWED IN ROUND"
         9 "9 DIVORCED IN ROUND" ;

label define H1380559X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380560X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380561X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380562X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380563X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380564X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380565X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380566X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380567X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380568X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380569X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380570X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380571X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380572X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380573X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380574X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380575X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380576X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380577X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380578X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380579X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380580X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380581X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380582X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380583X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380584X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380585X
         1 "1 YES"
         2 "2 NO" ;

label define H1380586X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380587X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380588X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP - HMO NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP HMO"
         2 "2 COV BY MEDICAID/SCHIP - NOT HMO"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380589X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP - HMO NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP HMO"
         2 "2 COV BY MEDICAID/SCHIP - NOT HMO"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380590X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP - HMO NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP HMO"
         2 "2 COV BY MEDICAID/SCHIP - NOT HMO"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380591X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380592X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380593X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380594X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380595X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380596X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380597X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380598X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380599X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP-GTKPR NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP GATEKEEPER PLAN"
         2 "2 COV BY MEDICAID/SCHIP - NOT GATEKEEPER"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380600X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP-GTKPR NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP GATEKEEPER PLAN"
         2 "2 COV BY MEDICAID/SCHIP - NOT GATEKEEPER"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380601X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MCAID/SCHIP-GTKPR NOT ASCERTAINED"
         1 "1 COV BY MEDICAID/SCHIP GATEKEEPER PLAN"
         2 "2 COV BY MEDICAID/SCHIP - NOT GATEKEEPER"
         3 "3 NOT COV BY MEDICAID/SCHIP" ;

label define H1380602X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380603X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380604X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380605X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380606X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380607X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380608X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380609X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380610X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380611X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380612X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380613X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380614X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380615X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380616X
         1 "1 YES"
         2 "2 NO" ;

label define H1380617X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380618X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380619X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380620X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380621X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380622X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380623X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380624X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380625X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380626X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380627X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380628X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380629X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380630X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380631X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380632X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380633X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PART B NOT ASC"
         1 "1 COV BY MEDICARE PART B"
         2 "2 COV BY MEDICARE - NOT PART B"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380634X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PART B NOT ASC"
         1 "1 COV BY MEDICARE PART B"
         2 "2 COV BY MEDICARE - NOT PART B"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380635X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PART B NOT ASC"
         1 "1 COV BY MEDICARE PART B"
         2 "2 COV BY MEDICARE - NOT PART B"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380636X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380637X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380638X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380639X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380640X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380641X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - PMED BENEFIT NOT ASC"
         1 "1 COV BY MEDICARE PMED BENEFIT"
         2 "2 COV BY MEDICARE - NOT PMED BENEFIT"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380642X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - MANAGED CARE NOT ASC"
         1 "1 COV BY MEDICARE MANAGED CARE"
         2 "2 COV BY MEDICARE - NOT MANAGED CARE"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380643X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - MANAGED CARE NOT ASC"
         1 "1 COV BY MEDICARE MANAGED CARE"
         2 "2 COV BY MEDICARE - NOT MANAGED CARE"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380644X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY MEDICARE - MANAGED CARE NOT ASC"
         1 "1 COV BY MEDICARE MANAGED CARE"
         2 "2 COV BY MEDICARE - NOT MANAGED CARE"
         3 "3 NOT COV BY MEDICARE" ;

label define H1380645X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380646X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380647X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380648X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380649X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380650X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380651X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380652X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380653X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380654X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380655X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380656X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO"
         3 "3 TRIED, BUT PERSON WAS UNCOOPERATIVE" ;

label define H1380657X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380658X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO"
         3 "3 TRIED, BUT PERSON WAS UNCOOPERATIVE" ;

label define H1380659X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380660X
         -1 "-1 INAPPLICALBE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380661X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380662X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380663X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1380664X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380665X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1380666X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1380667X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1380668X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380669X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380670X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380671X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380672X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380673X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MORE THAN ONE CURRENT JOB"
         2 "2 NOT MORE THAN ONE CURRENT JOB" ;

label define H1380674X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MORE THAN ONE CURRENT JOB"
         2 "2 NOT MORE THAN ONE CURRENT JOB" ;

label define H1380675X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MORE THAN ONE CURRENT JOB"
         2 "2 NOT MORE THAN ONE CURRENT JOB" ;

label define H1380676X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380677X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380678X
         -1 "-1 INAPPLICABLE"
         0 "0 NON-MSA"
         1 "1 MSA" ;

label define H1380679X
         -1 "-1 INAPPLICABLE"
         0 "0 NON-MSA"
         1 "1 MSA" ;

label define H1380680X
         -1 "-1 INAPPLICABLE"
         0 "0 NON-MSA"
         1 "1 MSA" ;

label define H1380681X
         -1 "-1 INAPPLICABLE"
         0 "0 NON-MSA"
         1 "1 MSA" ;

label define H1380682X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380683X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380684X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380685X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380686X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1380687X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DEFINITELY TRUE"
         2 "2 MOSTLY TRUE"
         3 "3 DON'T KNOW"
         4 "4 MOSTLY FALSE"
         5 "5 DEFINITELY FALSE" ;

label define H1380688X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380689X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380690X
         -1 "-1 INAPPLICABLE"
         -10 "-10 UPDATED HOURLY WAGE >=$74.52"
         -13 "-13 INITIAL WAGE IMPUTED"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380691X
         -1 "-1 INAPPLICABLE"
         -10 "-10 UPDATED HOURLY WAGE >=$74.52"
         -13 "-13 INITIAL WAGE IMPUTED"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380692X
         -1 "-1 INAPPLICABLE"
         -10 "-10 UPDATED HOURLY WAGE >=$74.52"
         -13 "-13 INITIAL WAGE IMPUTED"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380693X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380694X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380695X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380696X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380697X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380698X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380699X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WEEKS"
         2 "2 MONTHS" ;

label define H1380700X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380701X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380702X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380703X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380704X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380705X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380706X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT FIND WORK"
         2 "2 RETIRED"
         3 "3 UNABLE TO WORK BECAUSE ILL/DISABLED"
         4 "4 ON TEMPORARY LAYOFF"
         5 "5 MATERNITY/PATERNITY LEAVE"
         6 "6 GOING TO SCHOOL"
         7 "7 TAKING CARE OF HOME OR FAMILY"
         8 "8 WANTED SOME TIME OFF"
         9 "9 WAITING TO START NEW JOB"
         91 "91 OTHER" ;

label define H1380707X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT FIND WORK"
         2 "2 RETIRED"
         3 "3 UNABLE TO WORK BECAUSE ILL/DISABLED"
         4 "4 ON TEMPORARY LAYOFF"
         5 "5 MATERNITY/PATERNITY LEAVE"
         6 "6 GOING TO SCHOOL"
         7 "7 TAKING CARE OF HOME OR FAMILY"
         8 "8 WANTED SOME TIME OFF"
         9 "9 WAITING TO START NEW JOB"
         91 "91 OTHER" ;

label define H1380708X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT FIND WORK"
         2 "2 RETIRED"
         3 "3 UNABLE TO WORK BECAUSE ILL/DISABLED"
         4 "4 ON TEMPORARY LAYOFF"
         5 "5 MATERNITY/PATERNITY LEAVE"
         6 "6 GOING TO SCHOOL"
         7 "7 TAKING CARE OF HOME OR FAMILY"
         8 "8 WANTED SOME TIME OFF"
         9 "9 WAITING TO START NEW JOB"
         91 "91 OTHER" ;

label define H1380709X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380710X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380711X
         0 "0.00"
         137 "$1 - $137" ;

label define H1380712X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380713X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380714X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380715X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380716X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380717X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380718X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MANAGEMENT, BUSINESS, AND FINANCIAL OPER"
         10 "10 NOT IN LABOR FORCE"
         11 "11 UNCLASSIFIABLE OCCUPATION"
         2 "2 PROFESSIONAL AND RELATED OCCUPATIONS"
         3 "3 SERVICE OCCUPATIONS"
         4 "4 SALES AND RELATED OCCUPATIONS"
         5 "5 OFFICE AND ADMINISTRATIVE SUPPORT"
         6 "6 FARMING, FISHING, AND FORESTRY"
         7 "7 CONSTRUCTION, EXTRACTION, AND MAINTENANC"
         8 "8 PRODUCTION, TRNSPORTATION, MATRL MOVING"
         9 "9 MILITARY SPECIFIC OCCUPATIONS" ;

label define H1380719X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MANAGEMENT, BUSINESS, AND FINANCIAL OPER"
         10 "10 NOT IN LABOR FORCE"
         11 "11 UNCLASSIFIABLE OCCUPATION"
         2 "2 PROFESSIONAL AND RELATED OCCUPATIONS"
         3 "3 SERVICE OCCUPATIONS"
         4 "4 SALES AND RELATED OCCUPATIONS"
         5 "5 OFFICE AND ADMINISTRATIVE SUPPORT"
         6 "6 FARMING, FISHING, AND FORESTRY"
         7 "7 CONSTRUCTION, EXTRACTION, AND MAINTENANC"
         8 "8 PRODUCTION, TRNSPORTATION, MATRL MOVING"
         9 "9 MILITARY SPECIFIC OCCUPATIONS" ;

label define H1380720X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MANAGEMENT, BUSINESS, AND FINANCIAL OPER"
         10 "10 NOT IN LABOR FORCE"
         11 "11 UNCLASSIFIABLE OCCUPATION"
         2 "2 PROFESSIONAL AND RELATED OCCUPATIONS"
         3 "3 SERVICE OCCUPATIONS"
         4 "4 SALES AND RELATED OCCUPATIONS"
         5 "5 OFFICE AND ADMINISTRATIVE SUPPORT"
         6 "6 FARMING, FISHING, AND FORESTRY"
         7 "7 CONSTRUCTION, EXTRACTION, AND MAINTENANC"
         8 "8 PRODUCTION, TRNSPORTATION, MATRL MOVING"
         9 "9 MILITARY SPECIFIC OCCUPATIONS" ;

label define H1380721X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380722X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380723X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380724X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380725X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380726X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380727X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380728X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380729X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380730X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380731X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380732X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380733X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380734X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380735X
         1 "1 YES"
         2 "2 NO" ;

label define H1380736X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380737X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380738X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380739X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380740X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380741X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380742X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380743X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380744X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380745X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380746X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380747X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380748X
         1 "1 YES"
         2 "2 NO" ;

label define H1380749X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380750X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380751X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380752X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380753X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380754X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380755X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380756X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380757X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380758X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380759X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380760X
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380761X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380762X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380763X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380764X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380765X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380766X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380767X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380768X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380769X
         0 "0.00"
         2500 "$1 - $2,500" ;

label define H1380770X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380771X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380772X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380773X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380774X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380775X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380776X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380777X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380778X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380779X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380780X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380781X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380782X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380783X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380784X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380785X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380786X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380787X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380788X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380789X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380790X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380791X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380792X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380793X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380794X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380795X
         14 "14 PANEL 14"
         15 "15 PANEL 15" ;

label define H1380796X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380797X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380798X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380799X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380800X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380801X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380802X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380803X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380804X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380805X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380806X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380807X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380808X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380809X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380810X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380811X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380812X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380813X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380814X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380815X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380816X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380817X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380818X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380819X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380820X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380821X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380822X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380823X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380824X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380825X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380826X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380827X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380828X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380829X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380830X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380831X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380832X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380833X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380834X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1380835X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380836X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY HMO-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY HMO - NON-PLAN DRS COVERED"
         2 "2 COV BY HMO - NON-PLAN DRS NOT COVERED" ;

label define H1380837X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY HMO-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY HMO - NON-PLAN DRS COVERED"
         2 "2 COV BY HMO - NON-PLAN DRS NOT COVERED" ;

label define H1380838X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY HMO-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY HMO - NON-PLAN DRS COVERED"
         2 "2 COV BY HMO - NON-PLAN DRS NOT COVERED" ;

label define H1380839X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 VERY DIFFICULT"
         2 "2 SOMEWHAT DIFFICULT"
         3 "3 NOT TOO DIFFICULT"
         4 "4 NOT AT ALL DIFFICULT" ;

label define H1380840X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380841X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT APPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380842X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380843X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 HOSPITAL CLINIC/OUTPATIENT DEPT"
         2 "2 HOSPITAL EMERGENCY ROOM"
         3 "3 NON-HOSPITAL PLACE" ;

label define H1380844X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380845X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380846X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380847X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380848X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380849X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380850X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380851X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380852X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380853X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380854X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1380855X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE INSURANCE"
         2 "2 MEDICARE"
         3 "3 MEDICAID"
         4 "4 VA/CHAMPVA"
         5 "5 TRICARE"
         6 "6 STATE/LOCAL GOVERNMENT"
         7 "7 OTHER" ;

label define H1380856X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE INSURANCE"
         2 "2 MEDICARE"
         3 "3 MEDICAID"
         4 "4 VA/CHAMPVA"
         5 "5 TRICARE"
         6 "6 STATE/LOCAL GOVERNMENT"
         7 "7 OTHER" ;

label define H1380857X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PRIVATE INSURANCE"
         2 "2 MEDICARE"
         3 "3 MEDICAID"
         4 "4 VA/CHAMPVA"
         5 "5 TRICARE"
         6 "6 STATE/LOCAL GOVERNMENT"
         7 "7 OTHER" ;

label define H1380858X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380859X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380860X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380861X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV GATEKPR-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY GATEKPR - NON-PLAN DRS COVERED"
         2 "2 COV BY GATEKPR-NON-PLAN DRS NOT COVERED" ;

label define H1380862X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV GATEKPR-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY GATEKPR - NON-PLAN DRS COVERED"
         2 "2 COV BY GATEKPR-NON-PLAN DRS NOT COVERED" ;

label define H1380863X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV GATEKPR-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY GATEKPR - NON-PLAN DRS COVERED"
         2 "2 COV BY GATEKPR-NON-PLAN DRS NOT COVERED" ;

label define H1380864X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380865X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 A BIG PROBLEM"
         2 "2 A SMALL PROBLEM"
         3 "3 NOT A PROBLEM" ;

label define H1380866X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 COULD NOT AFFORD CARE"
         10 "10 DID NOT HAVE TIME OR TOOK TOO LONG"
         2 "2 INS CO WOULD NOT APPROVE/COVER/PAY"
         3 "3 DOCTOR REFUSED FAMILY INS PLAN"
         4 "4 PROBLEMS GETTING TO DOCTOR'S OFFICE"
         5 "5 DIFFERENT LANGUAGE"
         6 "6 COULD NOT GET TIME OFF WORK"
         7 "7 DK WHERE TO GO TO GET CARE"
         8 "8 WAS REFUSED SERVICES"
         9 "9 COULD NOT GET CHILD CARE"
         91 "91 OTHER" ;

label define H1380867X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380868X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380869X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380870X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380871X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380872X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380873X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380874X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380875X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380876X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380877X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380878X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380879X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380880X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380881X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380882X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380883X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380884X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380885X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380886X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380887X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380888X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380889X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380890X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380891X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380892X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380893X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380894X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380895X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380896X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380897X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380898X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380899X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380900X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380901X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380902X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380903X
         1 "1 POOR/NEGATIVE"
         2 "2 NEAR POOR"
         3 "3 LOW INCOME"
         4 "4 MIDDLE INCOME"
         5 "5 HIGH INCOME" ;

label define H1380904X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380905X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380906X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV DR LIST-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY DR LIST-NON-PLAN DRS COVERED"
         2 "2 COV BY DR LIST-NON-PLAN DRS NOT COVERED" ;

label define H1380907X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV DR LIST-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY DR LIST - NON-PLAN DRS COVERED"
         2 "2 COV BY DR LIST-NON-PLAN DRS NOT COVERED" ;

label define H1380908X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV DR LIST-NON-PLAN DRS NOT ASCERTAINED"
         1 "1 COV BY DR LIST - NON-PLAN DRS COVERED"
         2 "2 COV BY DR LIST-NON-PLAN DRS NOT COVERED" ;

label define H1380909X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380910X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380911X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380912X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380913X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380914X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380915X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380916X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380917X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380918X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380919X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380920X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380921X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380922X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380923X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380924X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380925X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380926X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380927X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380928X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380929X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380930X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380931X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380932X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380933X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380934X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380935X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380936X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380937X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380938X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380939X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380940X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380941X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380942X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380943X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380944X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380945X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380946X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380947X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380948X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380949X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380950X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380951X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380952X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380953X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380954X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380955X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380956X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380957X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380958X
         -1 "-1 INAPPLICABLE"
         1 "1 FACILITY"
         2 "2 PERSON"
         3 "3 PERSON IN FACILITY PROVIDER" ;

label define H1380959X
         -1 "-1 NON-RESPONSE"
         1 "1 RESPONDENT IS RU MEMBER"
         2 "2 RESPONDENT IS A PROXY" ;

label define H1380960X
         -1 "-1 NON-RESPONSE"
         1 "1 RESPONDENT IS RU MEMBER"
         2 "2 RESPONDENT IS A PROXY" ;

label define H1380961X
         -1 "-1 NON-RESPONSE"
         1 "1 RESPONDENT IS RU MEMBER"
         2 "2 RESPONDENT IS A PROXY" ;

label define H1380962X
         -1 "-1 NON-RESPONSE"
         1 "1 RESPONDENT IS RU MEMBER"
         2 "2 RESPONDENT IS A PROXY" ;

label define H1380963X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380964X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380965X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380966X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380967X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380968X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380969X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380970X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380971X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380972X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380973X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380974X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380975X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1380976X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1380977X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-DR LIST NOT ASCERTAINED"
         1 "1 COV BY PRIVATE PLAN W/DOCTOR LIST"
         2 "2 COV BY PRIV PLAN WITHOUT DR LIST"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380978X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-DR LIST NOT ASCERTAINED"
         1 "1 COV BY PRIVATE PLAN W/DOCTOR LIST"
         2 "2 COV BY PRIV PLAN WITHOUT DR LIST"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380979X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-DR LIST NOT ASCERTAINED"
         1 "1 COV BY PRIVATE PLAN W/DOCTOR LIST"
         2 "2 COV BY PRIV PLAN WITHOUT DR LIST"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380980X
         1 "1 YES"
         2 "2 NO" ;

label define H1380981X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE - HMO NOT ASCERTAINED"
         1 "1 COV BY PRIVATE HMO"
         2 "2 COV BY PRIVATE INS - NOT HMO"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380982X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE - HMO NOT ASCERTAINED"
         1 "1 COV BY PRIVATE HMO"
         2 "2 COV BY PRIVATE INS - NOT HMO"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380983X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE - HMO NOT ASCERTAINED"
         1 "1 COV BY PRIVATE HMO"
         2 "2 COV BY PRIVATE INS - NOT HMO"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380984X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-GATEKPR NOT ASCERTAINED"
         1 "1 COV BY PRIVATE GATEKEEPER PLAN"
         2 "2 COV BY PRIVATE INS - NOT GATEKEEPER"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380985X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-GATEKPR NOT ASCERTAINED"
         1 "1 COV BY PRIVATE GATEKEEPER PLAN"
         2 "2 COV BY PRIVATE INS - NOT GATEKEEPER"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380986X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY PRIVATE-GATEKPR NOT ASCERTAINED"
         1 "1 COV BY PRIVATE GATEKEEPER PLAN"
         2 "2 COV BY PRIVATE INS - NOT GATEKEEPER"
         3 "3 NOT COV BY PRIVATE INS" ;

label define H1380987X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 MORE THAN 5 YEARS"
         6 "6 NEVER" ;

label define H1380988X
         -1 "-1 NOT FIELDED/NON-RESPONSE RU"
         0 "0 INCORRECTLY LISTED IN RU AT NHIS-R1 ONLY"
         11 "11 PERSON IN HOUSEHLD, NOT FT ACTIVE MIL"
         12 "12 IN HOUSEHLD, FT MIL DUTY-OUT-SCOPE"
         13 "13 FT STUD LIVING AWAY FROM HOME"
         14 "14 IN ORIG HH, FT ACTIVE DUTY-INSCOPE"
         21 "21 INSTITUTIONALIZED WHOLE RD: 4/2, 5/3"
         22 "22 LEAVE INSTITUTION ROUND: 4/2, 5/3"
         23 "23 LEAVES INSTITUTION & DIES RD: 4/2, 5/3"
         24 "24 DIES IN INST DURING ROUND: 4/2, 5/3"
         31 "31 DECEASED"
         32 "32 INSTITUTIONALIZED IN HEALTH CARE FAC"
         33 "33 INSTITUTIONALIZED NON-HEALTH CARE FAC"
         34 "34 MOVED OUTSIDE U.S., NOT AS STUDENT"
         35 "35 MOVED, FT ACTIVE DUTY"
         36 "36 INSTITUTIONALIZED (TYPE UNKNOWN)"
         41 "41 MOVED WITHIN U.S."
         42 "42 PERSON WHO JOINED RU"
         43 "43 REASON UNK OR MOVED TO UNK LOCATION"
         44 "44 JOINS ANOTHER RU, & IS INSCOPE"
         51 "51 NEWBORN IN REF PERIOD"
         61 "61 DECEASED PRIOR TO REF PERIOD-R3/1"
         62 "62 INSTITUT PRIOR TO REF PER-R3/1"
         63 "63 LEFT U.S. PRIOR TO REF PER-R3/1"
         64 "64 FT MIL, MIL FAC MOVE PRIOR REF PER-R3/1"
         71 "71 LIVING AWAY GRADES 1-12 NONKEY"
         72 "72 INELIG NON-KEY/RESIDENCY SCHL YR ONLY"
         73 "73 NONKEY, NOT FT MIL, MOVED W/OUT KEY"
         74 "74 MOVED AS FT MIL, NOT TO FAC, W/O KEY"
         81 "81 MOVED, FT STUD, NO RESP, DATA IMPUTED" ;

label define H1380989X
         -1 "-1 NOT FIELDED/NON-RESPONSE RU"
         0 "0 INCORRECTLY LISTED IN RU AT NHIS-R1 ONLY"
         11 "11 PERSON IN HOUSEHLD, NOT FT ACTIVE MIL"
         12 "12 IN HOUSEHLD, FT MIL DUTY-OUT-SCOPE"
         13 "13 FT STUD LIVING AWAY FROM HOME"
         14 "14 IN ORIG HH, FT ACTIVE DUTY-INSCOPE"
         21 "21 INSTITUTIONALIZED WHOLE RD: 4/2, 5/3"
         22 "22 LEAVE INSTITUTION ROUND: 4/2, 5/3"
         23 "23 LEAVES INSTITUTION & DIES RD: 4/2, 5/3"
         24 "24 DIES IN INST DURING ROUND: 4/2, 5/3"
         31 "31 DECEASED"
         32 "32 INSTITUTIONALIZED IN HEALTH CARE FAC"
         33 "33 INSTITUTIONALIZED NON-HEALTH CARE FAC"
         34 "34 MOVED OUTSIDE U.S., NOT AS STUDENT"
         35 "35 MOVED, FT ACTIVE DUTY"
         36 "36 INSTITUTIONALIZED (TYPE UNKNOWN)"
         41 "41 MOVED WITHIN U.S."
         42 "42 PERSON WHO JOINED RU"
         43 "43 REASON UNK OR MOVED TO UNK LOCATION"
         44 "44 JOINS ANOTHER RU, & IS INSCOPE"
         51 "51 NEWBORN IN REF PERIOD"
         61 "61 DECEASED PRIOR TO REF PERIOD-R3/1"
         62 "62 INSTITUT PRIOR TO REF PER-R3/1"
         63 "63 LEFT U.S. PRIOR TO REF PER-R3/1"
         64 "64 FT MIL, MIL FAC MOVE PRIOR REF PER-R3/1"
         71 "71 LIVING AWAY GRADES 1-12 NONKEY"
         72 "72 INELIG NON-KEY/RESIDENCY SCHL YR ONLY"
         73 "73 NONKEY, NOT FT MIL, MOVED W/OUT KEY"
         74 "74 MOVED AS FT MIL, NOT TO FAC, W/O KEY"
         81 "81 MOVED, FT STUD, NO RESP, DATA IMPUTED" ;

label define H1380990X
         -1 "-1 NOT FIELDED/NON-RESPONSE RU"
         0 "0 INCORRECTLY LISTED IN RU AT NHIS-R1 ONLY"
         11 "11 PERSON IN HOUSEHLD, NOT FT ACTIVE MIL"
         12 "12 IN HOUSEHLD, FT MIL DUTY-OUT-SCOPE"
         13 "13 FT STUD LIVING AWAY FROM HOME"
         14 "14 IN ORIG HH, FT ACTIVE DUTY-INSCOPE"
         21 "21 INSTITUTIONALIZED WHOLE RD: 4/2, 5/3"
         22 "22 LEAVE INSTITUTION ROUND: 4/2, 5/3"
         23 "23 LEAVES INSTITUTION & DIES RD: 4/2, 5/3"
         24 "24 DIES IN INST DURING ROUND: 4/2, 5/3"
         31 "31 DECEASED"
         32 "32 INSTITUTIONALIZED IN HEALTH CARE FAC"
         33 "33 INSTITUTIONALIZED NON-HEALTH CARE FAC"
         34 "34 MOVED OUTSIDE U.S., NOT AS STUDENT"
         35 "35 MOVED, FT ACTIVE DUTY"
         36 "36 INSTITUTIONALIZED (TYPE UNKNOWN)"
         41 "41 MOVED WITHIN U.S."
         42 "42 PERSON WHO JOINED RU"
         43 "43 REASON UNK OR MOVED TO UNK LOCATION"
         44 "44 JOINS ANOTHER RU, & IS INSCOPE"
         51 "51 NEWBORN IN REF PERIOD"
         61 "61 DECEASED PRIOR TO REF PERIOD-R3/1"
         62 "62 INSTITUT PRIOR TO REF PER-R3/1"
         63 "63 LEFT U.S. PRIOR TO REF PER-R3/1"
         64 "64 FT MIL, MIL FAC MOVE PRIOR REF PER-R3/1"
         71 "71 LIVING AWAY GRADES 1-12 NONKEY"
         72 "72 INELIG NON-KEY/RESIDENCY SCHL YR ONLY"
         73 "73 NONKEY, NOT FT MIL, MOVED W/OUT KEY"
         74 "74 MOVED AS FT MIL, NOT TO FAC, W/O KEY"
         81 "81 MOVED, FT STUD, NO RESP, DATA IMPUTED" ;

label define H1380991X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380992X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380993X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380994X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380995X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380996X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380997X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380998X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1380999X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381000X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381001X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381002X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381003X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381004X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381005X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381006X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381007X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381008X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381009X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381010X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381011X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381012X
         -1 "-1 INAPPLICABLE"
         1 "1 ASIAN - NO OTHER RACE REPORTED"
         2 "2 ASIAN - OTHER RACE(S) REPORTED"
         3 "3 ALL OTHER RACE ASSIGNMENTS" ;

label define H1381013X
         -1 "-1 INAPPLICABLE"
         1 "1 BLACK - NO OTHER RACE REPORTED"
         2 "2 BLACK - OTHER RACE(S) REPORTED"
         3 "3 ALL OTHER RACE ASSIGNMENTS" ;

label define H1381014X
         1 "1 PERSON IS HISPANIC"
         2 "2 PERSON IS BLACK-NO OTH RACE/NOT HISPANIC"
         3 "3 PERSON IS ASIAN-NO OTH RACE/NOT HISPANIC"
         4 "4 OTHER RACE/NOT HISPANIC" ;

label define H1381015X
         -1 "-1 INAPPLICABLE"
         1 "1 WHITE - NO OTHER RACE REPORTED"
         2 "2 WHITE - OTHER RACE(S) REPORTED"
         3 "3 ALL OTHER RACE ASSIGNMENTS" ;

label define H1381016X
         -1 "-1 INAPPLICABLE"
         1 "1 WHITE - NO OTHER RACE REPORTED"
         2 "2 BLACK - NO OTHER RACE REPORTED"
         3 "3 AMER INDIAN/ALASKA NATIVE - NO OTH RAC"
         4 "4 ASIAN - NO OTHER RACE REPORTED"
         5 "5 NATIVE HAWAIIAN/PACIFIC ISLANDER-NO OTHR"
         6 "6 MULTIPLE RACES REPORTED" ;

label define H1381017X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381018X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381019X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381020X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381021X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381022X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381023X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381024X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381025X
         -1 "-1 INAPPLICABLE"
         1 "1 NORTHEAST"
         2 "2 MIDWEST"
         3 "3 SOUTH"
         4 "4 WEST" ;

label define H1381026X
         -1 "-1 INAPPLICABLE"
         1 "1 NORTHEAST"
         2 "2 MIDWEST"
         3 "3 SOUTH"
         4 "4 WEST" ;

label define H1381027X
         -1 "-1 INAPPLICABLE"
         1 "1 NORTHEAST"
         2 "2 MIDWEST"
         3 "3 SOUTH"
         4 "4 WEST" ;

label define H1381028X
         -1 "-1 INAPPLICABLE"
         1 "1 NORTHEAST"
         2 "2 MIDWEST"
         3 "3 SOUTH"
         4 "4 WEST" ;

label define H1381029X
         0 "0 NON-RESPONSE"
         1 "1 YES, FIRST RESPONDENT"
         2 "2 NO, NOT FIRST RESPONDENT"
         3 "3 NOT DETERMINED" ;

label define H1381030X
         0 "0 NON-RESPONSE"
         1 "1 YES, FIRST RESPONDENT"
         2 "2 NO, NOT FIRST RESPONDENT"
         3 "3 NOT DETERMINED" ;

label define H1381031X
         0 "0 NON-RESPONSE"
         1 "1 YES, FIRST RESPONDENT"
         2 "2 NO, NOT FIRST RESPONDENT"
         3 "3 NOT DETERMINED" ;

label define H1381032X
         0 "0 NON-RESPONSE"
         1 "1 YES, FIRST RESPONDENT"
         2 "2 NO, NOT FIRST RESPONDENT"
         3 "3 NOT DETERMINED" ;

label define H1381033X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NEVER"
         2 "2 SOMETIMES"
         3 "3 USUALLY"
         4 "4 ALWAYS" ;

label define H1381034X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381035X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381036X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381037X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 SELF"
         1 "1 MOTHER"
         10 "10 FATHER-IN-LAW"
         11 "11 SISTER-IN-LAW"
         12 "12 BROTHER-IN-LAW"
         13 "13 DAUGHTER-IN-LAW"
         14 "14 SON-IN-LAW"
         15 "15 STEPMOTHER"
         16 "16 STEPFATHER"
         17 "17 STEPDAUGHTER"
         18 "18 STEPSON"
         19 "19 GRANDMOTHER"
         2 "2 FATHER"
         20 "20 GRANDFATHER"
         21 "21 AUNT"
         22 "22 UNCLE"
         23 "23 NIECE"
         24 "24 NEPHEW"
         25 "25 COUSIN"
         26 "26 GRANDSON"
         27 "27 GRANDDAUGHTER"
         28 "28 FEMALE PARTNER"
         29 "29 MALE PARTNER"
         3 "3 SISTER/STEP/HALF"
         30 "30 MOTHER'S PARTNER"
         31 "31 FATHER'S PARTNER"
         32 "32 DAUGHTER OF PARTNER"
         33 "33 SON OF PARTNER"
         34 "34 FOSTER CHILD"
         35 "35 GREAT GRANDMOTHER"
         36 "36 GREAT GRANDFATHER"
         37 "37 GREAT GRANDDAUGHTER"
         38 "38 GREAT GRANDSON"
         39 "39 GREAT AUNT"
         4 "4 BROTHER/STEP/HALF"
         40 "40 GREAT UNCLE"
         41 "41 GREAT NIECE"
         42 "42 GREAT NEPHEW"
         43 "43 FOSTER MOTHER"
         44 "44 FOSTER FATHER"
         45 "45 FOSTER DAUGHTER"
         46 "46 FOSTER SON"
         47 "47 FOSTER SISTER"
         48 "48 FOSTER BROTHER"
         5 "5 DAUGHTER/ADOPTED DAUGHTER"
         6 "6 SON/ADOPTED SON"
         7 "7 WIFE/SPOUSE"
         8 "8 HUSBAND/SPOUSE"
         9 "9 MOTHER-IN-LAW"
         91 "91 OTHER RELATED, SPECIFY"
         99 "99 NOT RELATED" ;

label define H1381038X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 SELF"
         1 "1 MOTHER"
         10 "10 FATHER-IN-LAW"
         11 "11 SISTER-IN-LAW"
         12 "12 BROTHER-IN-LAW"
         13 "13 DAUGHTER-IN-LAW"
         14 "14 SON-IN-LAW"
         15 "15 STEPMOTHER"
         16 "16 STEPFATHER"
         17 "17 STEPDAUGHTER"
         18 "18 STEPSON"
         19 "19 GRANDMOTHER"
         2 "2 FATHER"
         20 "20 GRANDFATHER"
         21 "21 AUNT"
         22 "22 UNCLE"
         23 "23 NIECE"
         24 "24 NEPHEW"
         25 "25 COUSIN"
         26 "26 GRANDSON"
         27 "27 GRANDDAUGHTER"
         28 "28 FEMALE PARTNER"
         29 "29 MALE PARTNER"
         3 "3 SISTER/STEP/HALF"
         30 "30 MOTHER'S PARTNER"
         31 "31 FATHER'S PARTNER"
         32 "32 DAUGHTER OF PARTNER"
         33 "33 SON OF PARTNER"
         34 "34 FOSTER CHILD"
         35 "35 GREAT GRANDMOTHER"
         36 "36 GREAT GRANDFATHER"
         37 "37 GREAT GRANDDAUGHTER"
         38 "38 GREAT GRANDSON"
         39 "39 GREAT AUNT"
         4 "4 BROTHER/STEP/HALF"
         40 "40 GREAT UNCLE"
         41 "41 GREAT NIECE"
         42 "42 GREAT NEPHEW"
         43 "43 FOSTER MOTHER"
         44 "44 FOSTER FATHER"
         45 "45 FOSTER DAUGHTER"
         46 "46 FOSTER SON"
         47 "47 FOSTER SISTER"
         48 "48 FOSTER BROTHER"
         5 "5 DAUGHTER/ADOPTED DAUGHTER"
         6 "6 SON/ADOPTED SON"
         7 "7 WIFE/SPOUSE"
         8 "8 HUSBAND/SPOUSE"
         9 "9 MOTHER-IN-LAW"
         91 "91 OTHER RELATED, SPECIFY"
         99 "99 NOT RELATED" ;

label define H1381039X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 SELF"
         1 "1 MOTHER"
         10 "10 FATHER-IN-LAW"
         11 "11 SISTER-IN-LAW"
         12 "12 BROTHER-IN-LAW"
         13 "13 DAUGHTER-IN-LAW"
         14 "14 SON-IN-LAW"
         15 "15 STEPMOTHER"
         16 "16 STEPFATHER"
         17 "17 STEPDAUGHTER"
         18 "18 STEPSON"
         19 "19 GRANDMOTHER"
         2 "2 FATHER"
         20 "20 GRANDFATHER"
         21 "21 AUNT"
         22 "22 UNCLE"
         23 "23 NIECE"
         24 "24 NEPHEW"
         25 "25 COUSIN"
         26 "26 GRANDSON"
         27 "27 GRANDDAUGHTER"
         28 "28 FEMALE PARTNER"
         29 "29 MALE PARTNER"
         3 "3 SISTER/STEP/HALF"
         30 "30 MOTHER'S PARTNER"
         31 "31 FATHER'S PARTNER"
         32 "32 DAUGHTER OF PARTNER"
         33 "33 SON OF PARTNER"
         34 "34 FOSTER CHILD"
         35 "35 GREAT GRANDMOTHER"
         36 "36 GREAT GRANDFATHER"
         37 "37 GREAT GRANDDAUGHTER"
         38 "38 GREAT GRANDSON"
         39 "39 GREAT AUNT"
         4 "4 BROTHER/STEP/HALF"
         40 "40 GREAT UNCLE"
         41 "41 GREAT NIECE"
         42 "42 GREAT NEPHEW"
         43 "43 FOSTER MOTHER"
         44 "44 FOSTER FATHER"
         45 "45 FOSTER DAUGHTER"
         46 "46 FOSTER SON"
         47 "47 FOSTER SISTER"
         48 "48 FOSTER BROTHER"
         5 "5 DAUGHTER/ADOPTED DAUGHTER"
         6 "6 SON/ADOPTED SON"
         7 "7 WIFE/SPOUSE"
         8 "8 HUSBAND/SPOUSE"
         9 "9 MOTHER-IN-LAW"
         91 "91 OTHER RELATED, SPECIFY"
         99 "99 NOT RELATED" ;

label define H1381040X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0 SELF"
         1 "1 MOTHER"
         10 "10 FATHER-IN-LAW"
         11 "11 SISTER-IN-LAW"
         12 "12 BROTHER-IN-LAW"
         13 "13 DAUGHTER-IN-LAW"
         14 "14 SON-IN-LAW"
         15 "15 STEPMOTHER"
         16 "16 STEPFATHER"
         17 "17 STEPDAUGHTER"
         18 "18 STEPSON"
         19 "19 GRANDMOTHER"
         2 "2 FATHER"
         20 "20 GRANDFATHER"
         21 "21 AUNT"
         22 "22 UNCLE"
         23 "23 NIECE"
         24 "24 NEPHEW"
         25 "25 COUSIN"
         26 "26 GRANDSON"
         27 "27 GRANDDAUGHTER"
         28 "28 FEMALE PARTNER"
         29 "29 MALE PARTNER"
         3 "3 SISTER/STEP/HALF"
         30 "30 MOTHER'S PARTNER"
         31 "31 FATHER'S PARTNER"
         32 "32 DAUGHTER OF PARTNER"
         33 "33 SON OF PARTNER"
         34 "34 FOSTER CHILD"
         35 "35 GREAT GRANDMOTHER"
         36 "36 GREAT GRANDFATHER"
         37 "37 GREAT GRANDDAUGHTER"
         38 "38 GREAT GRANDSON"
         39 "39 GREAT AUNT"
         4 "4 BROTHER/STEP/HALF"
         40 "40 GREAT UNCLE"
         41 "41 GREAT NIECE"
         42 "42 GREAT NEPHEW"
         43 "43 FOSTER MOTHER"
         44 "44 FOSTER FATHER"
         45 "45 FOSTER DAUGHTER"
         46 "46 FOSTER SON"
         47 "47 FOSTER SISTER"
         48 "48 FOSTER BROTHER"
         5 "5 DAUGHTER/ADOPTED DAUGHTER"
         6 "6 SON/ADOPTED SON"
         7 "7 WIFE/SPOUSE"
         8 "8 HUSBAND/SPOUSE"
         9 "9 MOTHER-IN-LAW"
         91 "91 OTHER RELATED, SPECIFY"
         99 "99 NOT RELATED" ;

label define H1381041X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ROUND 1"
         2 "2 ROUND 2"
         3 "3 ROUND 3" ;

label define H1381042X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1381043X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1381044X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 EXCELLENT"
         2 "2 VERY GOOD"
         3 "3 GOOD"
         4 "4 FAIR"
         5 "5 POOR" ;

label define H1381045X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381046X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381047X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 STANDARD RU"
         2 "2 NEW RU"
         3 "3 STUDENT RU" ;

label define H1381048X
         -1 "-1 INAPPLICABLE"
         1 "1 STANDARD RU"
         2 "2 NEW RU"
         3 "3 STUDENT RU" ;

label define H1381049X
         -1 "-1 INAPPLICABLE"
         1 "1 STANDARD RU"
         2 "2 NEW RU"
         3 "3 STUDENT RU" ;

label define H1381050X
         -1 "-1 INAPPLICABLE"
         1 "1 STANDARD RU"
         2 "2 NEW RU"
         3 "3 STUDENT RU" ;

label define H1381051X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON IN RU"
         10 "10 PERSONS IN RU"
         11 "11 PERSONS IN RU"
         12 "12 PERSONS IN RU"
         13 "13 PERSONS IN RU"
         14 "14 PERSONS IN RU"
         15 "15 PERSONS IN RU"
         16 "16 PERSONS IN RU"
         17 "17 PERSONS IN RU"
         18 "18 PERSONS IN RU"
         2 "2 PERSONS IN RU"
         3 "3 PERSONS IN RU"
         4 "4 PERSONS IN RU"
         5 "5 PERSONS IN RU"
         6 "6 PERSONS IN RU"
         7 "7 PERSONS IN RU"
         8 "8 PERSONS IN RU"
         9 "9 PERSONS IN RU" ;

label define H1381052X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON IN RU"
         10 "10 PERSONS IN RU"
         11 "11 PERSONS IN RU"
         12 "12 PERSONS IN RU"
         13 "13 PERSONS IN RU"
         14 "14 PERSONS IN RU"
         15 "15 PERSONS IN RU"
         16 "16 PERSONS IN RU"
         17 "17 PERSONS IN RU"
         18 "18 PERSONS IN RU"
         2 "2 PERSONS IN RU"
         3 "3 PERSONS IN RU"
         4 "4 PERSONS IN RU"
         5 "5 PERSONS IN RU"
         6 "6 PERSONS IN RU"
         7 "7 PERSONS IN RU"
         8 "8 PERSONS IN RU"
         9 "9 PERSONS IN RU" ;

label define H1381053X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON IN RU"
         10 "10 PERSONS IN RU"
         11 "11 PERSONS IN RU"
         12 "12 PERSONS IN RU"
         13 "13 PERSONS IN RU"
         14 "14 PERSONS IN RU"
         15 "15 PERSONS IN RU"
         16 "16 PERSONS IN RU"
         17 "17 PERSONS IN RU"
         18 "18 PERSONS IN RU"
         2 "2 PERSONS IN RU"
         3 "3 PERSONS IN RU"
         4 "4 PERSONS IN RU"
         5 "5 PERSONS IN RU"
         6 "6 PERSONS IN RU"
         7 "7 PERSONS IN RU"
         8 "8 PERSONS IN RU"
         9 "9 PERSONS IN RU" ;

label define H1381054X
         -1 "-1 INAPPLICABLE"
         1 "1 PERSON IN RU"
         10 "10 PERSONS IN RU"
         11 "11 PERSONS IN RU"
         12 "12 PERSONS IN RU"
         13 "13 PERSONS IN RU"
         14 "14 PERSONS IN RU"
         15 "15 PERSONS IN RU"
         16 "16 PERSONS IN RU"
         17 "17 PERSONS IN RU"
         18 "18 PERSONS IN RU"
         2 "2 PERSONS IN RU"
         3 "3 PERSONS IN RU"
         4 "4 PERSONS IN RU"
         5 "5 PERSONS IN RU"
         6 "6 PERSONS IN RU"
         7 "7 PERSONS IN RU"
         8 "8 PERSONS IN RU"
         9 "9 PERSONS IN RU" ;

label define H1381055X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381056X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381057X
         0 "0 NOT ELIGIBLE FOR SAQ"
         1 "1 ELIGIBLE FOR SAQ - HAS SAQ DATA"
         2 "2 ELIGIBLE FOR SAQ - NO SAQ DATA" ;

label define H1381058X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381059X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381060X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381061X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381062X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381063X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381064X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381065X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 ALWAYS"
         2 "2 NEARLY ALWAYS"
         3 "3 SOMETIMES"
         4 "4 SELDOM"
         5 "5 NEVER"
         6 "6 NEVER DRIVES/RIDES IN A CAR" ;

label define H1381066X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381067X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381068X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381069X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381070X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381071X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 MALE"
         2 "2 FEMALE" ;

label define H1381072X
         -1 "-1 INAPPLICABLE"
         0 "0 NO"
         1 "1 YES" ;

label define H1381073X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 PART OF A ROUTINE EXAM"
         2 "2 BECAUSE OF A PROBLEM"
         3 "3 SOME OTHER REASON" ;

label define H1381074X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 WITHIN PAST 3 YEARS"
         4 "4 WITHIN PAST 5 YEARS"
         5 "5 WITHIN PAST 10 YEARS"
         6 "6 MORE THAN 10 YEARS"
         7 "7 NEVER" ;

label define H1381075X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381076X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DEFINITELY TRUE"
         2 "2 MOSTLY TRUE"
         3 "3 DON'T KNOW"
         4 "4 MOSTLY FALSE"
         5 "5 DEFINITELY FALSE" ;

label define H1381077X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381078X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381079X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381080X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381081X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381082X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381083X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381084X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381085X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381086X
         -1 "-1 INAPPLICABLE"
         995 "995 NO SPOUSE IN HOUSE"
         996 "996 MARITAL STATUS UNKNOWN"
         997 "997 LESS THAN 16 YRS OLD" ;

label define H1381087X
         -1 "-1 INAPPLICABLE"
         995 "995 NO SPOUSE IN HOUSE"
         996 "996 MARITAL STATUS UNKNOWN"
         997 "997 LESS THAN 16 YRS OLD" ;

label define H1381088X
         -1 "-1 INAPPLICABLE"
         995 "995 NO SPOUSE IN HOUSE"
         996 "996 MARITAL STATUS UNKNOWN"
         997 "997 LESS THAN 16 YRS OLD" ;

label define H1381089X
         -1 "-1 INAPPLICABLE"
         995 "995 NO SPOUSE IN HOUSE"
         996 "996 MARITAL STATUS UNKNOWN"
         997 "997 LESS THAN 16 YRS OLD" ;

label define H1381090X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SPOUSE IN THE HOUSE"
         2 "2 NOT MARRIED/NO SPOUSE"
         3 "3 UNDER 16 - INAPPLICABLE" ;

label define H1381091X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SPOUSE IN THE HOUSE"
         2 "2 NOT MARRIED/NO SPOUSE"
         3 "3 UNDER 16 - INAPPLICABLE" ;

label define H1381092X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SPOUSE IN THE HOUSE"
         2 "2 NOT MARRIED/NO SPOUSE"
         3 "3 UNDER 16 - INAPPLICABLE" ;

label define H1381093X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SPOUSE IN THE HOUSE"
         2 "2 NOT MARRIED/NO SPOUSE"
         3 "3 UNDER 16 - INAPPLICABLE" ;

label define H1381094X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381095X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381096X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DISABILITY"
         2 "2 SOME OTHER REASON" ;

label define H1381097X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381098X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS SEASONAL, NOT YEAR ROUND"
         2 "2 CMJ IS NOT SEASONAL, YEAR ROUND" ;

label define H1381099X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS SEASONAL, NOT YEAR ROUND"
         2 "2 CMJ IS NOT SEASONAL, YEAR ROUND" ;

label define H1381100X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS SEASONAL, NOT YEAR ROUND"
         2 "2 CMJ IS NOT SEASONAL, YEAR ROUND" ;

label define H1381101X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381102X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381103X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381104X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381105X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381106X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381107X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381108X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381109X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381110X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381111X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381112X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381113X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381114X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381115X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381116X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381117X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381118X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381119X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381120X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1381121X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1381122X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JANUARY"
         10 "10 OCTOBER"
         11 "11 NOVEMBER"
         12 "12 DECEMBER"
         2 "2 FEBRUARY"
         3 "3 MARCH"
         4 "4 APRIL"
         5 "5 MAY"
         6 "6 JUNE"
         7 "7 JULY"
         8 "8 AUGUST"
         9 "9 SEPTEMBER" ;

label define H1381123X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381124X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381125X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381126X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381127X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381128X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381129X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381130X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381131X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 COMPLETELY UNABLE TO DO IT"
         5 "5 COMPLETELY UNABLE TO WALK" ;

label define H1381132X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 COMPLETELY UNABLE TO DO IT"
         5 "5 COMPLETELY UNABLE TO WALK" ;

label define H1381133X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381134X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381135X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381136X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381137X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381138X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381139X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LONG FORM 1040"
         2 "2 SHORT FORM 1040A"
         3 "3 SHORT FORM 1040EZ"
         91 "91 OTHER" ;

label define H1381140X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS TEMPORARY"
         2 "2 CMJ IS NOT TEMPORARY" ;

label define H1381141X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS TEMPORARY"
         2 "2 CMJ IS NOT TEMPORARY" ;

label define H1381142X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 CMJ IS TEMPORARY"
         2 "2 CMJ IS NOT TEMPORARY" ;

label define H1381143X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381144X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381145X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381146X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381147X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381148X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 LESS THAN 15 MINUTES"
         2 "2 15 TO 30 MINUTES"
         3 "3 31 TO 60 MINUTES (1 HOUR)"
         4 "4 61 TO 90 MINUTES"
         5 "5 91 MINUTES TO 120 MINUTES (2 HOURS)"
         6 "6 MORE THAN 120 MINUTES (2 HOURS)" ;

label define H1381149X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0.00" ;

label define H1381150X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381151X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381152X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381153X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381154X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381155X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381156X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381157X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381158X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381159X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-CHAMPVA NOT ASC"
         1 "1 COV BY CHAMPVA"
         2 "2 COV BY TRICR/CHAMV-NOT CHAMPVA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381160X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-CHAMPVA NOT ASC"
         1 "1 COV BY CHAMPVA"
         2 "2 COV BY TRICR/CHAMV-NOT CHAMPVA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381161X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-CHAMPVA NOT ASC"
         1 "1 COV BY CHAMPVA"
         2 "2 COV BY TRICR/CHAMV-NOT CHAMPVA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381162X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381163X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381164X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381165X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381166X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381167X
         1 "1 YES"
         2 "2 NO" ;

label define H1381168X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI EXTRA NOT ASC"
         1 "1 COV BY TRICARE EXTRA"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE EXTRA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381169X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI EXTRA NOT ASC"
         1 "1 COV BY TRICARE EXTRA"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE EXTRA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381170X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI EXTRA NOT ASC"
         1 "1 COV BY TRICARE EXTRA"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE EXTRA"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381171X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381172X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381173X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381174X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381175X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI FOR LIFE NOT ASC"
         1 "1 COV BY TRICARE FOR LIFE"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE FOR LIFE"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381176X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI FOR LIFE NOT ASC"
         1 "1 COV BY TRICARE FOR LIFE"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE FOR LIFE"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381177X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI FOR LIFE NOT ASC"
         1 "1 COV BY TRICARE FOR LIFE"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE FOR LIFE"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381178X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381179X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381180X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381181X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381182X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI PRIME NOT ASC"
         1 "1 COV BY TRICARE PRIME"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE PRIME"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381183X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI PRIME NOT ASC"
         1 "1 COV BY TRICARE PRIME"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE PRIME"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381184X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI PRIME NOT ASC"
         1 "1 COV BY TRICARE PRIME"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE PRIME"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381185X
         -1 "-1 INAPPLICABLE"
         1 "1 YES"
         2 "2 NO" ;

label define H1381186X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI STANDARD NOT ASC"
         1 "1 COV BY TRICARE STANDARD"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE STANDARD"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381187X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI STANDARD NOT ASC"
         1 "1 COV BY TRICARE STANDARD"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE STANDARD"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381188X
         -1 "-1 INAPPLICABLE"
         -9 "-9 COV BY TRICR/CHAMV-TRI STANDARD NOT ASC"
         1 "1 COV BY TRICARE STANDARD"
         2 "2 COV BY TRICR/CHAMV-NOT TRICARE STANDARD"
         3 "3 NOT COV BY TRICARE/CHAMPVA" ;

label define H1381189X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381190X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381191X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381192X
         -1 "-1 INAPPLICABLE"
         1 "1 MD - GENERAL/FAMILY PRACTICE"
         10 "10 PHYSICIAN'S ASSISTANT"
         11 "11 OTHER NON-MD PROVIDER"
         12 "12 UNKNOWN"
         13 "13 MD - CARDIOLOGIST"
         14 "14 DOCTOR OF OSTEOPATHY"
         15 "15 MD - ENDOCRINOLOGIST"
         16 "16 MD - GASTROENTEROLOGIST"
         17 "17 MD - GERIATRICIAN"
         18 "18 MD - NEPHROLOGIST"
         19 "19 MD - ONCOLOGIST"
         2 "2 MD - INTERNAL MEDICINE"
         20 "20 MD - PULMONOLOGIST"
         21 "21 MD - RHEUMATOLOGIST"
         22 "22 PSYCHIATRIST/PSYCHOLOGIST"
         23 "23 MD - NEUROLOGIST"
         24 "24 ALTERNATIVE CARE PROVIDER"
         3 "3 MD - PEDIATRICS"
         4 "4 MD - OB/GYN"
         5 "5 MD - SURGERY"
         6 "6 MD - OTHER"
         7 "7 CHIROPRACTOR"
         8 "8 NURSE"
         9 "9 NURSE PRACTITIONER" ;

label define H1381193X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381194X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381195X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381196X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         99 "99 ASKED, BUT INAPPLICABLE" ;

label define H1381197X
         1 "1 YES"
         2 "2 NO" ;

label define H1381198X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381199X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381200X
         -1 "-1 INAPPLICABLE"
         -2 "-2 DETERMINED IN PREVIOUS ROUND"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381201X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381202X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381203X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381204X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED" ;

label define H1381205X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381206X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381207X
         -1 "-1 INAPPLICABLE"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 IMPAIRED NEAR, BUT NOT FAR"
         4 "4 IMPAIRED BOTH NEAR AND FAR"
         5 "5 BLIND" ;

label define H1381208X
         0 "0.00"
         394 "$1 - $394" ;

label define H1381209X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         4 "4 WEEKS WORKED/EARNINGS USED"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381210X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381211X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381212X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381213X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381214X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381215X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381216X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381217X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381218X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381219X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381220X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381221X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381222X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381223X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381224X
         1 "1 ORIGINAL RESPONSE USED"
         2 "2 BRACKET CONVERTED"
         3 "3 MISSING VALUES SET TO 0"
         4 "4 WEEKS WORKED/EARNINGS USED"
         5 "5 CONDITIONAL HOTDECK"
         6 "6 UNCONDITIONAL HOTDECK" ;

label define H1381225X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381226X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381227X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381228X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381229X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381230X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381231X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381232X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381233X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381234X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381235X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381236X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 WITHIN PAST YEAR"
         2 "2 WITHIN PAST 2 YEARS"
         3 "3 MORE THAN 2 YEARS" ;

label define H1381237X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381238X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381239X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381240X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         0 "0" ;

label define H1381241X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381242X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381243X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381244X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 NO DIFFICULTY"
         2 "2 SOME DIFFICULTY"
         3 "3 A LOT OF DIFFICULTY"
         4 "4 UNABLE TO DO" ;

label define H1381245X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381246X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381247X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381248X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -9 "-9 NOT ASCERTAINED"
         1 "1 DEFINITELY TRUE"
         2 "2 MOSTLY TRUE"
         3 "3 DON'T KNOW"
         4 "4 MOSTLY FALSE"
         5 "5 DEFINITELY FALSE" ;

label define H1381249X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381250X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 YES"
         2 "2 NO" ;

label define H1381251X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JOB ENDED"
         10 "10 QUIT TO TAKE ANOTHER JOB"
         11 "11 UNPAID LEAVE"
         2 "2 BUSINESS DISSOLVED OR SOLD"
         3 "3 RETIRED"
         4 "4 ILLNESS OR INJURY"
         5 "5 LAID OFF"
         6 "6 QUIT TO HAVE A BABY"
         7 "7 QUIT TO GO TO SCHOOL"
         8 "8 QUIT TO TAKE CARE OF HOME OR FAMILY"
         9 "9 QUIT BECAUSE WANTED TIME OFF"
         91 "91 OTHER" ;

label define H1381252X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 JOB ENDED"
         10 "10 QUIT TO TAKE OTHER JOB"
         11 "11 UNPAID LEAVE"
         2 "2 BUSINESS DISSOLVED OR SOLD"
         3 "3 RETIRED"
         4 "4 ILLNESS OR INJURY"
         5 "5 LAID OFF"
         6 "6 QUIT TO HAVE A BABY"
         7 "7 QUIT TO GO TO SCHOOL"
         8 "8 QUIT TO TAKE CARE OF HOME OR FAMILY"
         9 "9 QUIT BECAUSE WANTED TIME OFF"
         91 "91 OTHER" ;

label define H1381253X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 HASN'T WORKED LONG ENOUGH"
         2 "2 DOESN'T WORK ENOUGH HOURS"
         3 "3 ON CALL"
         4 "4 MEDICAL PROBLEM"
         91 "91 SOME OTHER REASON" ;

label define H1381254X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 HASN'T WORKED LONG ENOUGH"
         2 "2 DOESN'T WORK ENOUGH HOURS"
         3 "3 ON CALL"
         4 "4 MEDICAL PROBLEM"
         91 "91 SOME OTHER REASON" ;

label define H1381255X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 HASN'T WORKED LONG ENOUGH"
         2 "2 DOESN'T WORK ENOUGH HOURS"
         3 "3 ON CALL"
         4 "4 MEDICAL PROBLEMS"
         91 "91 SOME OTHER REASON" ;

label define H1381256X
         -1 "-1 INAPPLICABLE"
         -7 "-7 REFUSED"
         -8 "-8 DK"
         -9 "-9 NOT ASCERTAINED"
         1 "1 SELDOM OR NEVER SICK"
         10 "10 NO HEALTH INSURANCE"
         11 "11 JOB-RELATED REASONS"
         12 "12 LOOKING FOR A NEW DOCTOR/NO DOCTOR YET"
         13 "13 USC DOCTOR IS SOMEWHERE ELSE"
         14 "14 DON'T LIKE/DON'T TRUST DOCTORS"
         15 "15 HEALTH-RELATED REASONS"
         16 "16 NEWBORN - NO DOCTOR YET"
         17 "17 SELF, RELATIVE, OR FRIEND IS A DOCTOR"
         19 "19 CARE AVAILABLE ON JOB"
         2 "2 RECENTLY MOVED TO AREA"
         20 "20 WILL NOT GO TO THE DOCTOR"
         21 "21 PROBLEMS WITH TIME AND TRANSPORTATION"
         22 "22 GOES TO HOSPITAL/EMERGENCY ROOM/CLINIC"
         23 "23 USES ALTERNATIVE CARE"
         24 "24 INSURANCE-RELATED REASONS"
         3 "3 DON'T KNOW WHERE TO GO"
         4 "4 USC IN AREA NOT AVAILABLE"
         5 "5 CAN'T FIND PROVIDER WHO SPEAKS LANGUAGE"
         6 "6 GOES DIFFERENT PLACES FOR DIFF NEEDS"
         7 "7 JUST CHANGED INSURANCE PLANS"
         8 "8 DON'T USE DOCS/TREAT SELF"
         9 "9 COST OF MEDICAL CARE"
         91 "91 OTHER REASON" ;

label define H1381257X
         0 "0.00"
         441 "$1 - $441" ;

* ASSOCIATE VARIABLES WITH VALUE LABEL DEFINITIONS;
label value ACCELI42 H1380001X;
label value ACTDTY31 H1380002X;
label value ACTDTY42 H1380003X;
label value ACTDTY53 H1380004X;
label value ACTLIM31 H1380005X;
label value ACTLIM53 H1380006X;
label value ADAPPT42 H1380007X;
label value ADCAPE42 H1380008X;
label value ADCLIM42 H1380009X;
label value ADCMPD42 H1380010X;
label value ADCMPM42 H1380011X;
label value ADCMPY42 H1380012X;
label value ADDAYA42 H1380013X;
label value ADDOWN42 H1380014X;
label value ADDPRS42 H1380015X;
label value ADDRBP42 H1380016X;
label value ADEFRT42 H1380017X;
label value ADEGMC42 H1380018X;
label value ADEXPL42 H1380019X;
label value ADGENH42 H1380020X;
label value ADHDADDX H1380021X;
label value ADHDAGED H1380022X;
label value ADHECR42 H1380023X;
label value ADHOPE42 H1380024X;
label value ADILCR42 H1380025X;
label value ADILWW42 H1380026X;
label value ADINSA42 H1380027X;
label value ADINSB42 H1380028X;
label value ADINTR42 H1380029X;
label value ADL3MO31 H1380030X;
label value ADL3MO42 H1380031X;
label value ADL3MO53 H1380032X;
label value ADLANG42 H1380033X;
label value ADLHLP31 H1380034X;
label value ADLHLP42 H1380035X;
label value ADLHLP53 H1380036X;
label value ADLIST42 H1380037X;
label value ADMALS42 H1380038X;
label value ADMWLM42 H1380039X;
label value ADNDCR42 H1380040X;
label value ADNERV42 H1380041X;
label value ADNRGY42 H1380042X;
label value ADNSMK42 H1380043X;
label value ADOVER42 H1380044X;
label value ADPAIN42 H1380045X;
label value ADPALS42 H1380046X;
label value ADPRTM42 H1380047X;
label value ADPRX42 H1380048X;
label value ADPWLM42 H1380049X;
label value ADRESP42 H1380050X;
label value ADREST42 H1380051X;
label value ADRISK42 H1380052X;
label value ADRTCR42 H1380053X;
label value ADRTWW42 H1380054X;
label value ADSAD42 H1380055X;
label value ADSMOK42 H1380056X;
label value ADSOCA42 H1380057X;
label value ADSPEC42 H1380058X;
label value ADSPRF42 H1380059X;
label value ADUPRO42 H1380060X;
label value ADWRTH42 H1380061X;
label value AFDC10 H1380062X;
label value AFTHOU42 H1380063X;
label value AIDHLP31 H1380064X;
label value AIDHLP53 H1380065X;
label value ALIIMP10 H1380066X;
label value AMCOFD10 H1380067X;
label value ANGIAGED H1380068X;
label value ANGIDX H1380069X;
label value ANYLIM10 H1380070X;
label value APRDLM42 H1380071X;
label value APRDLT42 H1380072X;
label value APRTRM42 H1380073X;
label value APRTRT42 H1380074X;
label value ARTHAGED H1380075X;
label value ARTHDX H1380076X;
label value ARTHTYPE H1380077X;
label value ASACUT53 H1380078X;
label value ASATAK31 H1380079X;
label value ASATAK53 H1380080X;
label value ASDALY53 H1380081X;
label value ASEVFL53 H1380082X;
label value ASIANP42 H1380083X;
label value ASMRCN53 H1380084X;
label value ASPKFL53 H1380085X;
label value ASPREV53 H1380086X;
label value ASPRIN53 H1380087X;
label value ASSTIL31 H1380088X;
label value ASSTIL53 H1380089X;
label value ASTHAGED H1380090X;
label value ASTHDX H1380091X;
label value ASTHEP31 H1380092X;
label value ASTHEP53 H1380093X;
label value ASWNFL53 H1380094X;
label value BEGRFD31 H1380095X;
label value BEGRFD42 H1380096X;
label value BEGRFD53 H1380097X;
label value BEGRFM31 H1380098X;
label value BEGRFM42 H1380099X;
label value BEGRFM53 H1380100X;
label value BEGRFY31 H1380101X;
label value BEGRFY42 H1380102X;
label value BEGRFY53 H1380103X;
label value BENDIF31 H1380104X;
label value BENDIF53 H1380105X;
label value BLCKPR42 H1380106X;
label value BLDRAGED H1380107X;
label value BLDRREMS H1380108X;
label value BLIND42 H1380109X;
label value BMINDX53 H1380110X;
label value BONEAGED H1380111X;
label value BONEREMS H1380112X;
label value BOOST42 H1380113X;
label value BPCHEK53 H1380114X;
label value BPMLDX H1380115X;
label value BPMONT53 H1380116X;
label value BRAIAGED H1380117X;
label value BRAIREMS H1380118X;
label value BRSTAGED H1380119X;
label value BRSTEX53 H1380120X;
label value BRSTREMS H1380121X;
label value BSNTY31 H1380122X;
label value BSNTY42 H1380123X;
label value BSNTY53 H1380124X;
label value BSTSRE53 H1380125X;
label value BSTST53 H1380126X;
label value BUSIMP10 H1380127X;
label value CABLADDR H1380128X;
label value CABONE H1380129X;
label value CABRAIN H1380130X;
label value CABREAST H1380131X;
label value CACERVIX H1380132X;
label value CACOLON H1380133X;
label value CAESOPH H1380134X;
label value CAKIDNEY H1380135X;
label value CALARYNX H1380136X;
label value CALEUKEM H1380137X;
label value CALIVER H1380138X;
label value CALUNG H1380139X;
label value CALYMPH H1380140X;
label value CAMELANO H1380141X;
label value CAMOUTH H1380142X;
label value CAMUSCLE H1380143X;
label value CANCERDX H1380144X;
label value CAOTHER H1380145X;
label value CAOVARY H1380146X;
label value CAPANCRS H1380147X;
label value CAPROSTA H1380148X;
label value CARECO42 H1380149X;
label value CARECTUM H1380150X;
label value CASKINDK H1380151X;
label value CASKINNM H1380152X;
label value CASTOMCH H1380153X;
label value CATESTIS H1380154X;
label value CATHROAT H1380155X;
label value CATHYROD H1380156X;
label value CAUTERUS H1380157X;
label value CERVAGED H1380158X;
label value CERVREMS H1380159X;
label value CHAPPT42 H1380160X;
label value CHBMIX42 H1380161X;
label value CHBRON31 H1380162X;
label value CHBRON53 H1380163X;
label value CHCOUN42 H1380164X;
label value CHDAGED H1380165X;
label value CHDDX H1380166X;
label value CHECK53 H1380167X;
label value CHEMPB42 H1380168X;
label value CHENEC42 H1380169X;
label value CHEXPL42 H1380170X;
label value CHEYRE42 H1380171X;
label value CHGJ3142 H1380172X;
label value CHGJ4253 H1380173X;
label value CHHECR42 H1380174X;
label value CHILCR42 H1380175X;
label value CHILWW42 H1380176X;
label value CHLICO42 H1380177X;
label value CHLIHB42 H1380178X;
label value CHLIMI42 H1380179X;
label value CHLIMP10 H1380180X;
label value CHLIST42 H1380181X;
label value CHNDCR42 H1380182X;
label value CHOIC31 H1380183X;
label value CHOIC42 H1380184X;
label value CHOIC53 H1380185X;
label value CHOLAGED H1380186X;
label value CHOLCK53 H1380187X;
label value CHOLDX H1380188X;
label value CHPMCN42 H1380189X;
label value CHPMED42 H1380190X;
label value CHPMHB42 H1380191X;
label value CHPRTM42 H1380192X;
label value CHRESP42 H1380193X;
label value CHRTCR42 H1380194X;
label value CHRTWW42 H1380195X;
label value CHSERV42 H1380196X;
label value CHSPEC42 H1380197X;
label value CHSRCN42 H1380198X;
label value CHSRHB42 H1380199X;
label value CHTHCO42 H1380200X;
label value CHTHER42 H1380201X;
label value CHTHHB42 H1380202X;
label value CLINIC42 H1380203X;
label value CLMDEP10 H1380204X;
label value CLMHIP10 H1380205X;
label value CLNTRE53 H1380206X;
label value CLNTST53 H1380207X;
label value COGLIM31 H1380208X;
label value COGLIM53 H1380209X;
label value COLOAGED H1380210X;
label value COLOREMS H1380211X;
label value COVRMM H1380212X;
label value COVRYY H1380213X;
label value CSHCN42 H1380214X;
label value CSHIMP10 H1380215X;
label value CSTSVM42 H1380216X;
label value CSTSVT42 H1380217X;
label value DADPRO42 H1380218X;
label value DDBDYS31 H1380219X;
label value DDBDYS42 H1380220X;
label value DDBDYS53 H1380221X;
label value DDNSCL31 H1380222X;
label value DDNSCL42 H1380223X;
label value DDNSCL53 H1380224X;
label value DDNWRK31 H1380225X;
label value DDNWRK42 H1380226X;
label value DDNWRK53 H1380227X;
label value DEAF42 H1380228X;
label value DECIDE42 H1380229X;
label value DEDUCT10 H1380230X;
label value DENTAL42 H1380231X;
label value DENTCK53 H1380232X;
label value DENTIN31 H1380233X;
label value DENTIN42 H1380234X;
label value DENTIN53 H1380235X;
label value DEPDNT10 H1380236X;
label value DFTOUS42 H1380237X;
label value DIABAGED H1380238X;
label value DIABDX H1380239X;
label value DIFFPL42 H1380240X;
label value DIFFWG31 H1380241X;
label value DIFFWG42 H1380242X;
label value DIFFWG53 H1380243X;
label value DISVW31X H1380244X;
label value DISVW42X H1380245X;
label value DISVW53X H1380246X;
label value DIVIMP10 H1380247X;
label value DKWHRU42 H1380248X;
label value DNDLAY42 H1380249X;
label value DNDLPR42 H1380250X;
label value DNDLRS42 H1380251X;
label value DNTINS10 H1380252X;
label value DNTINS31 H1380253X;
label value DNUNAB42 H1380254X;
label value DNUNPR42 H1380255X;
label value DNUNRS42 H1380256X;
label value DOBMM H1380257X;
label value DOBYY H1380258X;
label value DOCELS42 H1380259X;
label value DPINRU10 H1380260X;
label value DPOTSD10 H1380261X;
label value DSA1C53 H1380262X;
label value DSCB0953 H1380263X;
label value DSCGRP53 H1380264X;
label value DSCH0953 H1380265X;
label value DSCH1053 H1380266X;
label value DSCH1153 H1380267X;
label value DSCHNV53 H1380268X;
label value DSCINT53 H1380269X;
label value DSCNPC53 H1380270X;
label value DSCONF53 H1380271X;
label value DSCPCP53 H1380272X;
label value DSCPHN53 H1380273X;
label value DSDIA53 H1380274X;
label value DSDIET53 H1380275X;
label value DSEB0953 H1380276X;
label value DSEY0953 H1380277X;
label value DSEY1053 H1380278X;
label value DSEY1153 H1380279X;
label value DSEYNV53 H1380280X;
label value DSEYPR53 H1380281X;
label value DSFB0953 H1380282X;
label value DSFL0953 H1380283X;
label value DSFL1053 H1380284X;
label value DSFL1153 H1380285X;
label value DSFLNV53 H1380286X;
label value DSFT0953 H1380287X;
label value DSFT1053 H1380288X;
label value DSFT1153 H1380289X;
label value DSFTNV53 H1380290X;
label value DSINSU53 H1380291X;
label value DSKIDN53 H1380292X;
label value DSMED53 H1380293X;
label value DSPRX53 H1380294X;
label value DSVB0953 H1380295X;
label value DVGEN10 H1380296X;
label value DVOMCR10 H1380297X;
label value DVORTH10 H1380298X;
label value DVOVA10 H1380299X;
label value DVTOT10 H1380300X;
label value EATHLT42 H1380301X;
label value EDUCYR H1380302X;
label value EICRDT10 H1380303X;
label value ELGRND10 H1380304X;
label value ELGRND31 H1380305X;
label value ELGRND42 H1380306X;
label value ELGRND53 H1380307X;
label value EMPHAGED H1380308X;
label value EMPHDX H1380309X;
label value EMPST31 H1380310X;
label value EMPST42 H1380311X;
label value EMPST53 H1380312X;
label value ENDRFD10 H1380313X;
label value ENDRFD31 H1380314X;
label value ENDRFD42 H1380315X;
label value ENDRFD53 H1380316X;
label value ENDRFM10 H1380317X;
label value ENDRFM31 H1380318X;
label value ENDRFM42 H1380319X;
label value ENDRFM53 H1380320X;
label value ENDRFY10 H1380321X;
label value ENDRFY31 H1380322X;
label value ENDRFY42 H1380323X;
label value ENDRFY53 H1380324X;
label value ENGCMF42 H1380325X;
label value ENGSPK42 H1380326X;
label value ERTOT10 H1380327X;
label value ESPHAGED H1380328X;
label value ESPHREMS H1380329X;
label value EVRETIRE H1380330X;
label value EVRUNAT H1380331X;
label value EVRUNINS H1380332X;
label value EVRWRK H1380333X;
label value EXPLOP42 H1380334X;
label value EXRCIS53 H1380335X;
label value FAMRFPYR H1380336X;
label value FAMSZE31 H1380337X;
label value FAMSZE42 H1380338X;
label value FAMSZE53 H1380339X;
label value FCRP1231 H1380340X;
label value FILEDR10 H1380341X;
label value FILER10 H1380342X;
label value FLSTAT10 H1380343X;
label value FLUSHT53 H1380344X;
label value FMRS1231 H1380345X;
label value FNGRDF31 H1380346X;
label value FNGRDF53 H1380347X;
label value FOODMN10 H1380348X;
label value FOODST10 H1380349X;
label value FOODVL10 H1380350X;
label value FTSTU10X H1380351X;
label value FTSTU31X H1380352X;
label value FTSTU42X H1380353X;
label value FTSTU53X H1380354X;
label value GDCPBM42 H1380355X;
label value GDCPBT42 H1380356X;
label value GENDRP42 H1380357X;
label value GOTOUS42 H1380358X;
label value HAVEUS42 H1380359X;
label value HAVFUN42 H1380360X;
label value HEARAD42 H1380361X;
label value HEARDI42 H1380362X;
label value HEARMO42 H1380363X;
label value HEARNG42 H1380364X;
label value HEARSM42 H1380365X;
label value HELD31X H1380366X;
label value HELD42X H1380367X;
label value HELD53X H1380368X;
label value HELMET42 H1380369X;
label value HHAGD10 H1380370X;
label value HHAWCP10 H1380371X;
label value HHINDD10 H1380372X;
label value HHINFD10 H1380373X;
label value HHNOPR10 H1380374X;
label value HHNOPU10 H1380375X;
label value HHNSTL10 H1380376X;
label value HHTOTD10 H1380377X;
label value HIBPAGED H1380378X;
label value HIBPDX H1380379X;
label value HIDEG H1380380X;
label value HISPANX H1380381X;
label value HISPCAT H1380382X;
label value HLTHLF42 H1380383X;
label value HOMEBH42 H1380384X;
label value HONRDC31 H1380385X;
label value HONRDC42 H1380386X;
label value HONRDC53 H1380387X;
label value HOUR31 H1380388X;
label value HOUR42 H1380389X;
label value HOUR53 H1380390X;
label value HPDAP10 H1380391X;
label value HPDAU10 H1380392X;
label value HPDDE10 H1380393X;
label value HPDFE10 H1380394X;
label value HPDJA10 H1380395X;
label value HPDJL10 H1380396X;
label value HPDJU10 H1380397X;
label value HPDMA10 H1380398X;
label value HPDMY10 H1380399X;
label value HPDNO10 H1380400X;
label value HPDOC10 H1380401X;
label value HPDSE10 H1380402X;
label value HPEAP10 H1380403X;
label value HPEAU10 H1380404X;
label value HPEDE10 H1380405X;
label value HPEFE10 H1380406X;
label value HPEJA10 H1380407X;
label value HPEJL10 H1380408X;
label value HPEJU10 H1380409X;
label value HPEMA10 H1380410X;
label value HPEMY10 H1380411X;
label value HPENO10 H1380412X;
label value HPEOC10 H1380413X;
label value HPESE10 H1380414X;
label value HPNAP10 H1380415X;
label value HPNAU10 H1380416X;
label value HPNDE10 H1380417X;
label value HPNFE10 H1380418X;
label value HPNJA10 H1380419X;
label value HPNJL10 H1380420X;
label value HPNJU10 H1380421X;
label value HPNMA10 H1380422X;
label value HPNMY10 H1380423X;
label value HPNNO10 H1380424X;
label value HPNOC10 H1380425X;
label value HPNSE10 H1380426X;
label value HPOAP10 H1380427X;
label value HPOAU10 H1380428X;
label value HPODE10 H1380429X;
label value HPOFE10 H1380430X;
label value HPOJA10 H1380431X;
label value HPOJL10 H1380432X;
label value HPOJU10 H1380433X;
label value HPOMA10 H1380434X;
label value HPOMY10 H1380435X;
label value HPONO10 H1380436X;
label value HPOOC10 H1380437X;
label value HPOSE10 H1380438X;
label value HPRAP10 H1380439X;
label value HPRAU10 H1380440X;
label value HPRDE10 H1380441X;
label value HPRFE10 H1380442X;
label value HPRJA10 H1380443X;
label value HPRJL10 H1380444X;
label value HPRJU10 H1380445X;
label value HPRMA10 H1380446X;
label value HPRMY10 H1380447X;
label value HPRNO10 H1380448X;
label value HPROC10 H1380449X;
label value HPRSE10 H1380450X;
label value HPSAP10 H1380451X;
label value HPSAU10 H1380452X;
label value HPSDE10 H1380453X;
label value HPSFE10 H1380454X;
label value HPSJA10 H1380455X;
label value HPSJL10 H1380456X;
label value HPSJU10 H1380457X;
label value HPSMA10 H1380458X;
label value HPSMY10 H1380459X;
label value HPSNO10 H1380460X;
label value HPSOC10 H1380461X;
label value HPSSE10 H1380462X;
label value HRHOW31 H1380463X;
label value HRHOW42 H1380464X;
label value HRHOW53 H1380465X;
label value HRWG31X H1380466X;
label value HRWG42X H1380467X;
label value HRWG53X H1380468X;
label value HRWGIM31 H1380469X;
label value HRWGIM42 H1380470X;
label value HRWGIM53 H1380471X;
label value HSELIM31 H1380472X;
label value HSELIM53 H1380473X;
label value HSPLAP42 H1380474X;
label value HYSTER53 H1380475X;
label value IADL3M31 H1380476X;
label value IADL3M42 H1380477X;
label value IADL3M53 H1380478X;
label value IADLHP31 H1380479X;
label value IADLHP42 H1380480X;
label value IADLHP53 H1380481X;
label value INDCAT31 H1380482X;
label value INDCAT42 H1380483X;
label value INDCAT53 H1380484X;
label value INS10X H1380485X;
label value INS31X H1380486X;
label value INS42X H1380487X;
label value INS53X H1380488X;
label value INSAP10X H1380489X;
label value INSAT10X H1380490X;
label value INSAT31X H1380491X;
label value INSAT42X H1380492X;
label value INSAT53X H1380493X;
label value INSAU10X H1380494X;
label value INSC1231 H1380495X;
label value INSCOP10 H1380496X;
label value INSCOP31 H1380497X;
label value INSCOP42 H1380498X;
label value INSCOP53 H1380499X;
label value INSCOPE H1380500X;
label value INSCOV10 H1380501X;
label value INSDE10X H1380502X;
label value INSENDMM H1380503X;
label value INSENDYY H1380504X;
label value INSFE10X H1380505X;
label value INSJA10X H1380506X;
label value INSJL10X H1380507X;
label value INSJU10X H1380508X;
label value INSMA10X H1380509X;
label value INSMY10X H1380510X;
label value INSNO10X H1380511X;
label value INSOC10X H1380512X;
label value INSRPL42 H1380513X;
label value INSSE10X H1380514X;
label value INTIMP10 H1380515X;
label value INTVLANG H1380516X;
label value IPDIS10 H1380517X;
label value IPZERO10 H1380518X;
label value IRAIMP10 H1380519X;
label value JNTPID10 H1380520X;
label value JOBORG31 H1380521X;
label value JOBORG42 H1380522X;
label value JOBORG53 H1380523X;
label value JOBRSN42 H1380524X;
label value JTINRU10 H1380525X;
label value JTPAIN31 H1380526X;
label value JTPAIN53 H1380527X;
label value K6SUM42 H1380528X;
label value KEYNESS H1380529X;
label value KIDNAGED H1380530X;
label value KIDNREMS H1380531X;
label value KIDPRO42 H1380532X;
label value KNOWDR42 H1380533X;
label value LANGHM42 H1380534X;
label value LANGPR42 H1380535X;
label value LAPBLT42 H1380536X;
label value LEUKAGED H1380537X;
label value LEUKREMS H1380538X;
label value LFTDIF31 H1380539X;
label value LFTDIF53 H1380540X;
label value LIVRAGED H1380541X;
label value LIVRREMS H1380542X;
label value LKINFM42 H1380543X;
label value LKINFT42 H1380544X;
label value LOCATN42 H1380545X;
label value LRNXAGED H1380546X;
label value LRNXREMS H1380547X;
label value LSHLTH42 H1380548X;
label value LSTETH53 H1380549X;
label value LUNGAGED H1380550X;
label value LUNGREMS H1380551X;
label value LYMPAGED H1380552X;
label value LYMPREMS H1380553X;
label value MAMOGR53 H1380554X;
label value MARRY10X H1380555X;
label value MARRY31X H1380556X;
label value MARRY42X H1380557X;
label value MARRY53X H1380558X;
label value MCAID10 H1380559X;
label value MCAID10X H1380560X;
label value MCAID31 H1380561X;
label value MCAID31X H1380562X;
label value MCAID42 H1380563X;
label value MCAID42X H1380564X;
label value MCAID53 H1380565X;
label value MCAID53X H1380566X;
label value MCARE10 H1380567X;
label value MCARE10X H1380568X;
label value MCARE31 H1380569X;
label value MCARE31X H1380570X;
label value MCARE42 H1380571X;
label value MCARE42X H1380572X;
label value MCARE53 H1380573X;
label value MCARE53X H1380574X;
label value MCDAP10 H1380575X;
label value MCDAP10X H1380576X;
label value MCDAT10X H1380577X;
label value MCDAT31X H1380578X;
label value MCDAT42X H1380579X;
label value MCDAT53X H1380580X;
label value MCDAU10 H1380581X;
label value MCDAU10X H1380582X;
label value MCDDE10 H1380583X;
label value MCDDE10X H1380584X;
label value MCDEV10 H1380585X;
label value MCDFE10 H1380586X;
label value MCDFE10X H1380587X;
label value MCDHMO10 H1380588X;
label value MCDHMO31 H1380589X;
label value MCDHMO42 H1380590X;
label value MCDJA10 H1380591X;
label value MCDJA10X H1380592X;
label value MCDJL10 H1380593X;
label value MCDJL10X H1380594X;
label value MCDJU10 H1380595X;
label value MCDJU10X H1380596X;
label value MCDMA10 H1380597X;
label value MCDMA10X H1380598X;
label value MCDMC10 H1380599X;
label value MCDMC31 H1380600X;
label value MCDMC42 H1380601X;
label value MCDMY10 H1380602X;
label value MCDMY10X H1380603X;
label value MCDNO10 H1380604X;
label value MCDNO10X H1380605X;
label value MCDOC10 H1380606X;
label value MCDOC10X H1380607X;
label value MCDSE10 H1380608X;
label value MCDSE10X H1380609X;
label value MCRAP10 H1380610X;
label value MCRAP10X H1380611X;
label value MCRAU10 H1380612X;
label value MCRAU10X H1380613X;
label value MCRDE10 H1380614X;
label value MCRDE10X H1380615X;
label value MCREV10 H1380616X;
label value MCRFE10 H1380617X;
label value MCRFE10X H1380618X;
label value MCRJA10 H1380619X;
label value MCRJA10X H1380620X;
label value MCRJL10 H1380621X;
label value MCRJL10X H1380622X;
label value MCRJU10 H1380623X;
label value MCRJU10X H1380624X;
label value MCRMA10 H1380625X;
label value MCRMA10X H1380626X;
label value MCRMY10 H1380627X;
label value MCRMY10X H1380628X;
label value MCRNO10 H1380629X;
label value MCRNO10X H1380630X;
label value MCROC10 H1380631X;
label value MCROC10X H1380632X;
label value MCRPB10 H1380633X;
label value MCRPB31 H1380634X;
label value MCRPB42 H1380635X;
label value MCRPD10 H1380636X;
label value MCRPD10X H1380637X;
label value MCRPD31 H1380638X;
label value MCRPD31X H1380639X;
label value MCRPD42 H1380640X;
label value MCRPD42X H1380641X;
label value MCRPHO10 H1380642X;
label value MCRPHO31 H1380643X;
label value MCRPHO42 H1380644X;
label value MCRSE10 H1380645X;
label value MCRSE10X H1380646X;
label value MCS42 H1380647X;
label value MDDLAY42 H1380648X;
label value MDDLPR42 H1380649X;
label value MDDLRS42 H1380650X;
label value MDUNAB42 H1380651X;
label value MDUNPR42 H1380652X;
label value MDUNRS42 H1380653X;
label value MELAAGED H1380654X;
label value MELAREMS H1380655X;
label value MESBPR42 H1380656X;
label value MESHGT42 H1380657X;
label value MESVIS42 H1380658X;
label value MESWGT42 H1380659X;
label value MIAGED H1380660X;
label value MIDX H1380661X;
label value MILDIF31 H1380662X;
label value MILDIF53 H1380663X;
label value MINORP42 H1380664X;
label value MNHLTH31 H1380665X;
label value MNHLTH42 H1380666X;
label value MNHLTH53 H1380667X;
label value MOMPRO42 H1380668X;
label value MORE31 H1380669X;
label value MORE42 H1380670X;
label value MORE53 H1380671X;
label value MORECOVR H1380672X;
label value MORJOB31 H1380673X;
label value MORJOB42 H1380674X;
label value MORJOB53 H1380675X;
label value MOUTAGED H1380676X;
label value MOUTREMS H1380677X;
label value MSA10 H1380678X;
label value MSA31 H1380679X;
label value MSA42 H1380680X;
label value MSA53 H1380681X;
label value MUSCAGED H1380682X;
label value MUSCREMS H1380683X;
label value MYSELF42 H1380684X;
label value NATAMP42 H1380685X;
label value NERVAF42 H1380686X;
label value NEVILL42 H1380687X;
label value NEWARE42 H1380688X;
label value NEWDOC42 H1380689X;
label value NHRWG31 H1380690X;
label value NHRWG42 H1380691X;
label value NHRWG53 H1380692X;
label value NOASPR53 H1380693X;
label value NOFAT53 H1380694X;
label value NOGODR42 H1380695X;
label value NOHINS42 H1380696X;
label value NOINSBEF H1380697X;
label value NOINSTM H1380698X;
label value NOINUNIT H1380699X;
label value NOLIKE42 H1380700X;
label value NOREAS42 H1380701X;
label value NOSMOK42 H1380702X;
label value NUMEMP31 H1380703X;
label value NUMEMP42 H1380704X;
label value NUMEMP53 H1380705X;
label value NWK31 H1380706X;
label value NWK42 H1380707X;
label value NWK53 H1380708X;
label value OBASST10 H1380709X;
label value OBCHIR10 H1380710X;
label value OBCOFD10 H1380711X;
label value OBDRV10 H1380712X;
label value OBNURS10 H1380713X;
label value OBOPTO10 H1380714X;
label value OBOTHV10 H1380715X;
label value OBTHER10 H1380716X;
label value OBTOTV10 H1380717X;
label value OCCCAT31 H1380718X;
label value OCCCAT42 H1380719X;
label value OCCCAT53 H1380720X;
label value OFFER31X H1380721X;
label value OFFER42X H1380722X;
label value OFFER53X H1380723X;
label value OFFHOU42 H1380724X;
label value OFREMP31 H1380725X;
label value OFREMP42 H1380726X;
label value OFREMP53 H1380727X;
label value OHRTAGED H1380728X;
label value OHRTDX H1380729X;
label value ONGONG42 H1380730X;
label value ONJOB42 H1380731X;
label value OPAAP10 H1380732X;
label value OPAAU10 H1380733X;
label value OPADE10 H1380734X;
label value OPAEV10 H1380735X;
label value OPAFE10 H1380736X;
label value OPAJA10 H1380737X;
label value OPAJL10 H1380738X;
label value OPAJU10 H1380739X;
label value OPAMA10 H1380740X;
label value OPAMY10 H1380741X;
label value OPANO10 H1380742X;
label value OPAOC10 H1380743X;
label value OPASE10 H1380744X;
label value OPBAP10 H1380745X;
label value OPBAU10 H1380746X;
label value OPBDE10 H1380747X;
label value OPBEV10 H1380748X;
label value OPBFE10 H1380749X;
label value OPBJA10 H1380750X;
label value OPBJL10 H1380751X;
label value OPBJU10 H1380752X;
label value OPBMA10 H1380753X;
label value OPBMY10 H1380754X;
label value OPBNO10 H1380755X;
label value OPBOC10 H1380756X;
label value OPBSE10 H1380757X;
label value OPDRV10 H1380758X;
label value OPOTHV10 H1380759X;
label value OPTOTV10 H1380760X;
label value OTHDYS31 H1380761X;
label value OTHDYS42 H1380762X;
label value OTHDYS53 H1380763X;
label value OTHIMP10 H1380764X;
label value OTHINS42 H1380765X;
label value OTHNDD31 H1380766X;
label value OTHNDD42 H1380767X;
label value OTHNDD53 H1380768X;
label value OTHOFD10 H1380769X;
label value OTHRAGED H1380770X;
label value OTHRCP42 H1380771X;
label value OTHREA42 H1380772X;
label value OTHRREMS H1380773X;
label value OTPAAT10 H1380774X;
label value OTPAAT31 H1380775X;
label value OTPAAT42 H1380776X;
label value OTPAAT53 H1380777X;
label value OTPBAT10 H1380778X;
label value OTPBAT31 H1380779X;
label value OTPBAT42 H1380780X;
label value OTPBAT53 H1380781X;
label value OTPUBA10 H1380782X;
label value OTPUBA31 H1380783X;
label value OTPUBA42 H1380784X;
label value OTPUBA53 H1380785X;
label value OTPUBB10 H1380786X;
label value OTPUBB31 H1380787X;
label value OTPUBB42 H1380788X;
label value OTPUBB53 H1380789X;
label value OVRYAGED H1380790X;
label value OVRYREMS H1380791X;
label value PACISP42 H1380792X;
label value PANCAGED H1380793X;
label value PANCREMS H1380794X;
label value PANEL H1380795X;
label value PAPSMR53 H1380796X;
label value PAYDR31 H1380797X;
label value PAYDR42 H1380798X;
label value PAYDR53 H1380799X;
label value PAYVAC31 H1380800X;
label value PAYVAC42 H1380801X;
label value PAYVAC53 H1380802X;
label value PBINFM42 H1380803X;
label value PBINFT42 H1380804X;
label value PBPWKM42 H1380805X;
label value PBPWKT42 H1380806X;
label value PBSVCM42 H1380807X;
label value PBSVCT42 H1380808X;
label value PCS42 H1380809X;
label value PDKAP10 H1380810X;
label value PDKAU10 H1380811X;
label value PDKDE10 H1380812X;
label value PDKFE10 H1380813X;
label value PDKJA10 H1380814X;
label value PDKJL10 H1380815X;
label value PDKJU10 H1380816X;
label value PDKMA10 H1380817X;
label value PDKMY10 H1380818X;
label value PDKNO10 H1380819X;
label value PDKOC10 H1380820X;
label value PDKSE10 H1380821X;
label value PEGAP10 H1380822X;
label value PEGAU10 H1380823X;
label value PEGDE10 H1380824X;
label value PEGFE10 H1380825X;
label value PEGJA10 H1380826X;
label value PEGJL10 H1380827X;
label value PEGJU10 H1380828X;
label value PEGMA10 H1380829X;
label value PEGMY10 H1380830X;
label value PEGNO10 H1380831X;
label value PEGOC10 H1380832X;
label value PEGSE10 H1380833X;
label value PENIMP10 H1380834X;
label value PERSLA42 H1380835X;
label value PHMONP10 H1380836X;
label value PHMONP31 H1380837X;
label value PHMONP42 H1380838X;
label value PHNREG42 H1380839X;
label value PHQ242 H1380840X;
label value PHYACT53 H1380841X;
label value PHYSCL42 H1380842X;
label value PLCTYP42 H1380843X;
label value PMDINS10 H1380844X;
label value PMDINS31 H1380845X;
label value PMDLAY42 H1380846X;
label value PMDLPR42 H1380847X;
label value PMDLRS42 H1380848X;
label value PMEDIN31 H1380849X;
label value PMEDIN42 H1380850X;
label value PMEDIN53 H1380851X;
label value PMEDPP31 H1380852X;
label value PMEDPP42 H1380853X;
label value PMEDPP53 H1380854X;
label value PMEDPY31 H1380855X;
label value PMEDPY42 H1380856X;
label value PMEDPY53 H1380857X;
label value PMEDUP31 H1380858X;
label value PMEDUP42 H1380859X;
label value PMEDUP53 H1380860X;
label value PMNCNP10 H1380861X;
label value PMNCNP31 H1380862X;
label value PMNCNP42 H1380863X;
label value PMUNAB42 H1380864X;
label value PMUNPR42 H1380865X;
label value PMUNRS42 H1380866X;
label value PNGAP10 H1380867X;
label value PNGAU10 H1380868X;
label value PNGDE10 H1380869X;
label value PNGFE10 H1380870X;
label value PNGJA10 H1380871X;
label value PNGJL10 H1380872X;
label value PNGJU10 H1380873X;
label value PNGMA10 H1380874X;
label value PNGMY10 H1380875X;
label value PNGNO10 H1380876X;
label value PNGOC10 H1380877X;
label value PNGSE10 H1380878X;
label value POGAP10 H1380879X;
label value POGAU10 H1380880X;
label value POGDE10 H1380881X;
label value POGFE10 H1380882X;
label value POGJA10 H1380883X;
label value POGJL10 H1380884X;
label value POGJU10 H1380885X;
label value POGMA10 H1380886X;
label value POGMY10 H1380887X;
label value POGNO10 H1380888X;
label value POGOC10 H1380889X;
label value POGSE10 H1380890X;
label value POUAP10 H1380891X;
label value POUAU10 H1380892X;
label value POUDE10 H1380893X;
label value POUFE10 H1380894X;
label value POUJA10 H1380895X;
label value POUJL10 H1380896X;
label value POUJU10 H1380897X;
label value POUMA10 H1380898X;
label value POUMY10 H1380899X;
label value POUNO10 H1380900X;
label value POUOC10 H1380901X;
label value POUSE10 H1380902X;
label value POVCAT10 H1380903X;
label value PPRWKM42 H1380904X;
label value PPRWKT42 H1380905X;
label value PRDRNP10 H1380906X;
label value PRDRNP31 H1380907X;
label value PRDRNP42 H1380908X;
label value PREGNT31 H1380909X;
label value PREGNT42 H1380910X;
label value PREGNT53 H1380911X;
label value PREVCOVR H1380912X;
label value PREVEN42 H1380913X;
label value PRIAP10 H1380914X;
label value PRIAU10 H1380915X;
label value PRIDE10 H1380916X;
label value PRIDK10 H1380917X;
label value PRIDK31 H1380918X;
label value PRIDK42 H1380919X;
label value PRIDK53 H1380920X;
label value PRIEU10 H1380921X;
label value PRIEU31 H1380922X;
label value PRIEU42 H1380923X;
label value PRIEU53 H1380924X;
label value PRIFE10 H1380925X;
label value PRIJA10 H1380926X;
label value PRIJL10 H1380927X;
label value PRIJU10 H1380928X;
label value PRIMA10 H1380929X;
label value PRIMY10 H1380930X;
label value PRING10 H1380931X;
label value PRING31 H1380932X;
label value PRING42 H1380933X;
label value PRING53 H1380934X;
label value PRINO10 H1380935X;
label value PRIOC10 H1380936X;
label value PRIOG10 H1380937X;
label value PRIOG31 H1380938X;
label value PRIOG42 H1380939X;
label value PRIOG53 H1380940X;
label value PRIS10 H1380941X;
label value PRIS31 H1380942X;
label value PRIS42 H1380943X;
label value PRIS53 H1380944X;
label value PRISE10 H1380945X;
label value PRIV10 H1380946X;
label value PRIV31 H1380947X;
label value PRIV42 H1380948X;
label value PRIV53 H1380949X;
label value PRIVAT10 H1380950X;
label value PRIVAT31 H1380951X;
label value PRIVAT42 H1380952X;
label value PRIVAT53 H1380953X;
label value PROUT10 H1380954X;
label value PROUT31 H1380955X;
label value PROUT42 H1380956X;
label value PROUT53 H1380957X;
label value PROVTY42 H1380958X;
label value PROXY10 H1380959X;
label value PROXY31 H1380960X;
label value PROXY42 H1380961X;
label value PROXY53 H1380962X;
label value PRSAP10 H1380963X;
label value PRSAU10 H1380964X;
label value PRSDE10 H1380965X;
label value PRSFE10 H1380966X;
label value PRSJA10 H1380967X;
label value PRSJL10 H1380968X;
label value PRSJU10 H1380969X;
label value PRSMA10 H1380970X;
label value PRSMY10 H1380971X;
label value PRSNO10 H1380972X;
label value PRSOC10 H1380973X;
label value PRSSE10 H1380974X;
label value PRSTAGED H1380975X;
label value PRSTREMS H1380976X;
label value PRVDRL10 H1380977X;
label value PRVDRL31 H1380978X;
label value PRVDRL42 H1380979X;
label value PRVEV10 H1380980X;
label value PRVHMO10 H1380981X;
label value PRVHMO31 H1380982X;
label value PRVHMO42 H1380983X;
label value PRVMNC10 H1380984X;
label value PRVMNC31 H1380985X;
label value PRVMNC42 H1380986X;
label value PSA53 H1380987X;
label value PSTATS31 H1380988X;
label value PSTATS42 H1380989X;
label value PSTATS53 H1380990X;
label value PUB10X H1380991X;
label value PUB31X H1380992X;
label value PUB42X H1380993X;
label value PUB53X H1380994X;
label value PUBAP10X H1380995X;
label value PUBAT10X H1380996X;
label value PUBAT31X H1380997X;
label value PUBAT42X H1380998X;
label value PUBAT53X H1380999X;
label value PUBAU10X H1381000X;
label value PUBDE10X H1381001X;
label value PUBFE10X H1381002X;
label value PUBIMP10 H1381003X;
label value PUBJA10X H1381004X;
label value PUBJL10X H1381005X;
label value PUBJU10X H1381006X;
label value PUBMA10X H1381007X;
label value PUBMY10X H1381008X;
label value PUBNO10X H1381009X;
label value PUBOC10X H1381010X;
label value PUBSE10X H1381011X;
label value RACEAX H1381012X;
label value RACEBX H1381013X;
label value RACETHNX H1381014X;
label value RACEWX H1381015X;
label value RACEX H1381016X;
label value RCHDIF31 H1381017X;
label value RCHDIF53 H1381018X;
label value READNW42 H1381019X;
label value RECPEP42 H1381020X;
label value RECTAGED H1381021X;
label value RECTREMS H1381022X;
label value REFFRL42 H1381023X;
label value REFIMP10 H1381024X;
label value REGION10 H1381025X;
label value REGION31 H1381026X;
label value REGION42 H1381027X;
label value REGION53 H1381028X;
label value RESP10 H1381029X;
label value RESP31 H1381030X;
label value RESP42 H1381031X;
label value RESP53 H1381032X;
label value RESPCT42 H1381033X;
label value RETPLN31 H1381034X;
label value RETPLN42 H1381035X;
label value RETPLN53 H1381036X;
label value RFREL10X H1381037X;
label value RFREL31X H1381038X;
label value RFREL42X H1381039X;
label value RFREL53X H1381040X;
label value RNDFLG31 H1381041X;
label value RTHLTH31 H1381042X;
label value RTHLTH42 H1381043X;
label value RTHLTH53 H1381044X;
label value RTPLNM42 H1381045X;
label value RTPLNT42 H1381046X;
label value RUCLAS10 H1381047X;
label value RUCLAS31 H1381048X;
label value RUCLAS42 H1381049X;
label value RUCLAS53 H1381050X;
label value RUSIZE10 H1381051X;
label value RUSIZE31 H1381052X;
label value RUSIZE42 H1381053X;
label value RUSIZE53 H1381054X;
label value SAFEST42 H1381055X;
label value SALIMP10 H1381056X;
label value SAQELIG H1381057X;
label value SCHLBH42 H1381058X;
label value SCHLIM31 H1381059X;
label value SCHLIM53 H1381060X;
label value SCHPRO42 H1381061X;
label value SCLNBD31 H1381062X;
label value SCLNBD42 H1381063X;
label value SCLNBD53 H1381064X;
label value SEATBE53 H1381065X;
label value SEEDIF42 H1381066X;
label value SELDSI42 H1381067X;
label value SELFCM31 H1381068X;
label value SELFCM42 H1381069X;
label value SELFCM53 H1381070X;
label value SEX H1381071X;
label value SFFLAG42 H1381072X;
label value SGMTRE53 H1381073X;
label value SGMTST53 H1381074X;
label value SIBPRO42 H1381075X;
label value SICEAS42 H1381076X;
label value SICPAY31 H1381077X;
label value SICPAY42 H1381078X;
label value SICPAY53 H1381079X;
label value SKDKAGED H1381080X;
label value SKDKREMS H1381081X;
label value SKNMAGED H1381082X;
label value SKNMREMS H1381083X;
label value SOCLIM31 H1381084X;
label value SOCLIM53 H1381085X;
label value SPOUID10 H1381086X;
label value SPOUID31 H1381087X;
label value SPOUID42 H1381088X;
label value SPOUID53 H1381089X;
label value SPOUIN10 H1381090X;
label value SPOUIN31 H1381091X;
label value SPOUIN42 H1381092X;
label value SPOUIN53 H1381093X;
label value SPRPRO42 H1381094X;
label value SSCIMP10 H1381095X;
label value SSIDIS10 H1381096X;
label value SSIIMP10 H1381097X;
label value SSNLJB31 H1381098X;
label value SSNLJB42 H1381099X;
label value SSNLJB53 H1381100X;
label value STAAP10 H1381101X;
label value STAAU10 H1381102X;
label value STADE10 H1381103X;
label value STAFE10 H1381104X;
label value STAJA10 H1381105X;
label value STAJL10 H1381106X;
label value STAJU10 H1381107X;
label value STAMA10 H1381108X;
label value STAMY10 H1381109X;
label value STANO10 H1381110X;
label value STAOC10 H1381111X;
label value STAPR10 H1381112X;
label value STAPR31 H1381113X;
label value STAPR42 H1381114X;
label value STAPR53 H1381115X;
label value STASE10 H1381116X;
label value STJBDD31 H1381117X;
label value STJBDD42 H1381118X;
label value STJBDD53 H1381119X;
label value STJBMM31 H1381120X;
label value STJBMM42 H1381121X;
label value STJBMM53 H1381122X;
label value STJBYY31 H1381123X;
label value STJBYY42 H1381124X;
label value STJBYY53 H1381125X;
label value STNDIF31 H1381126X;
label value STNDIF53 H1381127X;
label value STOMAGED H1381128X;
label value STOMCH53 H1381129X;
label value STOMREMS H1381130X;
label value STPDIF31 H1381131X;
label value STPDIF53 H1381132X;
label value STPRAT10 H1381133X;
label value STPRAT31 H1381134X;
label value STPRAT42 H1381135X;
label value STPRAT53 H1381136X;
label value STRKAGED H1381137X;
label value STRKDX H1381138X;
label value TAXFRM10 H1381139X;
label value TEMPJB31 H1381140X;
label value TEMPJB42 H1381141X;
label value TEMPJB53 H1381142X;
label value THRTAGED H1381143X;
label value THRTREMS H1381144X;
label value THYRAGED H1381145X;
label value THYRREMS H1381146X;
label value TIMALN42 H1381147X;
label value TMTKUS42 H1381148X;
label value TOTDED10 H1381149X;
label value TRANS42 H1381150X;
label value TRBLE42 H1381151X;
label value TREATM42 H1381152X;
label value TRIAP10X H1381153X;
label value TRIAT10X H1381154X;
label value TRIAT31X H1381155X;
label value TRIAT42X H1381156X;
label value TRIAT53X H1381157X;
label value TRIAU10X H1381158X;
label value TRICH10X H1381159X;
label value TRICH31X H1381160X;
label value TRICH42X H1381161X;
label value TRICR10X H1381162X;
label value TRICR31X H1381163X;
label value TRICR42X H1381164X;
label value TRICR53X H1381165X;
label value TRIDE10X H1381166X;
label value TRIEV10 H1381167X;
label value TRIEX10X H1381168X;
label value TRIEX31X H1381169X;
label value TRIEX42X H1381170X;
label value TRIFE10X H1381171X;
label value TRIJA10X H1381172X;
label value TRIJL10X H1381173X;
label value TRIJU10X H1381174X;
label value TRILI10X H1381175X;
label value TRILI31X H1381176X;
label value TRILI42X H1381177X;
label value TRIMA10X H1381178X;
label value TRIMY10X H1381179X;
label value TRINO10X H1381180X;
label value TRIOC10X H1381181X;
label value TRIPR10X H1381182X;
label value TRIPR31X H1381183X;
label value TRIPR42X H1381184X;
label value TRISE10X H1381185X;
label value TRIST10X H1381186X;
label value TRIST31X H1381187X;
label value TRIST42X H1381188X;
label value TRTIMP10 H1381189X;
label value TSTSAGED H1381190X;
label value TSTSREMS H1381191X;
label value TYPEPE42 H1381192X;
label value UNABLE31 H1381193X;
label value UNABLE53 H1381194X;
label value UNEIMP10 H1381195X;
label value UNHAP42 H1381196X;
label value UNINS10 H1381197X;
label value UNION31 H1381198X;
label value UNION42 H1381199X;
label value UNION53 H1381200X;
label value USBORN42 H1381201X;
label value USCNOT42 H1381202X;
label value USLIVE42 H1381203X;
label value UTERAGED H1381204X;
label value UTERREMS H1381205X;
label value VETIMP10 H1381206X;
label value VISION42 H1381207X;
label value VISWCP10 H1381208X;
label value WAGIMP10 H1381209X;
label value WASAFDC H1381210X;
label value WASCHAMP H1381211X;
label value WASESTB H1381212X;
label value WASMCAID H1381213X;
label value WASMCARE H1381214X;
label value WASOTGOV H1381215X;
label value WASOTHER H1381216X;
label value WASPRIV H1381217X;
label value WASSSI H1381218X;
label value WASSTAT1 H1381219X;
label value WASSTAT2 H1381220X;
label value WASSTAT3 H1381221X;
label value WASSTAT4 H1381222X;
label value WASVA H1381223X;
label value WCPIMP10 H1381224X;
label value WHITPR42 H1381225X;
label value WHNBPR42 H1381226X;
label value WHNBST42 H1381227X;
label value WHNDEN42 H1381228X;
label value WHNEAT42 H1381229X;
label value WHNHEL42 H1381230X;
label value WHNHGT42 H1381231X;
label value WHNLAP42 H1381232X;
label value WHNPHY42 H1381233X;
label value WHNSAF42 H1381234X;
label value WHNSMK42 H1381235X;
label value WHNWGT42 H1381236X;
label value WILFIL10 H1381237X;
label value WKINBD31 H1381238X;
label value WKINBD42 H1381239X;
label value WKINBD53 H1381240X;
label value WLK3MO31 H1381241X;
label value WLK3MO53 H1381242X;
label value WLKDIF31 H1381243X;
label value WLKDIF53 H1381244X;
label value WLKLIM31 H1381245X;
label value WLKLIM53 H1381246X;
label value WRGLAS42 H1381247X;
label value WRHLTH42 H1381248X;
label value WRKLIM31 H1381249X;
label value WRKLIM53 H1381250X;
label value YCHJ3142 H1381251X;
label value YCHJ4253 H1381252X;
label value YNOINS31 H1381253X;
label value YNOINS42 H1381254X;
label value YNOINS53 H1381255X;
label value YNOUSC42 H1381256X;
label value ZIFVA10 H1381257X;

*DISPLAY A DESCRIPTION OF STATA FILE;
describe;

*LIST FIRST 2 OBSERVATIONS IN THE FILE;
list in 1/2;

rename PERWT10F WEIGHT;
save raw2010.dta, replace;

#delimit cr

* data file is stored in H138.dta
* log  file is stored in H138.log

* log close

/************************************************************************************************
 NOTES:

 1. This program has been tested on Stata Version 10 (for Windows).

 2. This program will create a permanent Stata dataset.  All additional analyses
    can be run using this dataset.  In addition to the dataset, this program creates
    a log file named H138.LOG and a data file named H138.DTA.  If these files (H138.DTA and H138.LOG)
    already exist in the working directory, they will be replaced when this program is executed.

 3. If the program ends prematurely, the log file will remain open.  Before running this
    program again, the user should enter the following Stata command: log close

 4. The cd command assigns C:\MEPS\DATA as the working directory and location of the input
    ASCII and output .DTA and .LOG files and can be modified by the user as necessary.

 5. Stata commands end with a carriage return by default. The command
    #delimit ;
    temporarily changes the command ending delimiter from a carriage return to a semicolon.

 6. The infix command assumes that the input variables are numeric unless the variable name
    is prefaced by str.  For example, DUPERSID is the a string (or character) variable.

************************************************************************************************/

