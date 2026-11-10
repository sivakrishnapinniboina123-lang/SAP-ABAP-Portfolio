*&---------------------------------------------------------------------*
*& Report ZALV_STOCK_OVERVIEW - ALV Grid
*& Author: Sivakrishna Pinniboina - SAP ABAP
*&---------------------------------------------------------------------*
REPORT ZALV_STOCK_OVERVIEW.

TABLES: MARA.
DATA: IT_MARA TYPE TABLE OF MARA.

START-OF-SELECTION.
  SELECT * FROM MARA INTO TABLE IT_MARA UP TO 50 ROWS.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      I_STRUCTURE_NAME = 'MARA'
      I_GRID_TITLE     = 'Stock Overview - ABAP Portfolio'
    TABLES
      T_OUTTAB         = IT_MARA
    EXCEPTIONS
      PROGRAM_ERROR    = 1
      OTHERS           = 2.

  IF SY-SUBRC <> 0.
    WRITE: 'ALV Error'.
  ENDIF.
