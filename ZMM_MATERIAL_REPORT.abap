*&---------------------------------------------------------------------*
*& Report ZMM_MATERIAL_REPORT - Material Master Report
*& Author: Sivakrishna Pinniboina - SAP ABAP Fresher
*& Tables: MARA, MAKT
*&---------------------------------------------------------------------*
REPORT ZMM_MATERIAL_REPORT.

TABLES: MARA.

SELECT-OPTIONS: S_MATNR FOR MARA-MATNR.
SELECT-OPTIONS: S_MTART FOR MARA-MTART.

DATA: IT_MARA TYPE TABLE OF MARA,
      WA_MARA TYPE MARA.

START-OF-SELECTION.
  SELECT * FROM MARA INTO TABLE IT_MARA 
  WHERE MATNR IN S_MATNR 
  AND MTART IN S_MTART 
  UP TO 100 ROWS.

  IF IT_MARA IS INITIAL.
    WRITE: 'No data found for given selection'.
  ELSE.
    WRITE: / 'Material | Type | Industry'.
    ULINE.
    LOOP AT IT_MARA INTO WA_MARA.
      WRITE: / WA_MARA-MATNR, 15 WA_MARA-MTART, 25 WA_MARA-MBRSH.
    ENDLOOP.
  ENDIF.
