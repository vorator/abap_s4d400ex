CLASS zcl_vorator_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vorator_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* INTEGER DIVISION

    DATA number1 TYPE i.
    DATA number2 TYPE i.

    number1 = -8.
    number2 = 3.

    out->write( |Value of the dividend: { number1 }| ).
    out->write( |Value of the divisor: { number2 }| ).

    DATA(result1) = number1 / number2.

    DATA(output1) = |Integer division: { number1 } / { number2 } = { result1 }|.
    out->write( ' ' ).
    out->write( '* * *INTEGER DIVISION* * *' ).
    out->write( output1 ).


**********************************************************************
* ROUNDED DIVISION (2 decimals)

    DATA result2 TYPE p LENGTH 8 DECIMALS 2.

    result2 = number1 / number2.

    DATA(output2) = |Rounded division: { number1 } / { number2 } = { result2 }|.
    out->write( ' ' ).
    out->write( '* * *ROUNDED DIVISION* * *' ).
    out->write( output2 ).


**********************************************************************
* CONDITIONAL BRANCHING ON UNDEFINED OPERATION

    DATA op TYPE c LENGTH 1.
    DATA result3 TYPE p LENGTH 8 DECIMALS 2.

    number1 = 123.
    number2 = 0.
    op = '/'.

    DATA input_error TYPE string.
    input_error = |'{ op }' is an invalid operator|.

    DATA output3 TYPE string.

    CASE op.
        WHEN '+'.
            result3 = number1 + number2.
        WHEN '-'.
            result3 = number1 - number2.
        WHEN '*'.
            result3 = number1 * number2.
        WHEN '/'.
            TRY.
                result3 = number1 / number2.
            CATCH cx_sy_zerodivide.
                output3 = |Division by zero is not defined|.
            ENDTRY.
    ENDCASE.

    IF output3 IS INITIAL.
        output3 = |{ number1 } { op } { number2 } = { result3 }|.
    ENDIF.

    out->write( ' ' ).
    out->write( '* * *CONDITIONAL BRANCHING* * *' ).
    out->write( output3 ).

  ENDMETHOD.
ENDCLASS.
