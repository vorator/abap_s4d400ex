class zcl_vorator_compute definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_vorator_compute implementation.


  method if_oo_adt_classrun~main.

**********************************************************************
* INTEGER DIVISION

    data number1 type i.
    data number2 type i.

    number1 = -8.
    number2 = 3.

    out->write( |Value of the dividend: { number1 }| ).
    out->write( |Value of the divisor: { number2 }| ).

    data(result1) = number1 / number2.

    data(output1) = |Integer division: { number1 } / { number2 } = { result1 }|.
    out->write( ' ' ).
    out->write( '* * *INTEGER DIVISION* * *' ).
    out->write( output1 ).


**********************************************************************
* ROUNDED DIVISION (2 decimals)

    data result2 type p length 8 decimals 2.

    result2 = number1 / number2.

    data(output2) = |Rounded division: { number1 } / { number2 } = { result2 }|.
    out->write( ' ' ).
    out->write( '* * *ROUNDED DIVISION* * *' ).
    out->write( output2 ).


**********************************************************************
* CONDITIONAL BRANCHING ON UNDEFINED OPERATION

    data op type c length 1.
    data result3 type p length 8 decimals 2.

    number1 = 123.
    number2 = 0.
    op = '/'.

    data input_error type string.
    input_error = |'{ op }' is an invalid operator|.

    data output3 type string.

    case op.
      when '+'.
        result3 = number1 + number2.
      when '-'.
        result3 = number1 - number2.
      when '*'.
        result3 = number1 * number2.
      when '/'.
        try.
            result3 = number1 / number2.
          catch cx_sy_zerodivide.
            output3 = |Division by zero is not defined|.
        endtry.
    endcase.

    if output3 is initial.
      output3 = |{ number1 } { op } { number2 } = { result3 }|.
    endif.

    out->write( ' ' ).
    out->write( '* * *CONDITIONAL BRANCHING* * *' ).
    out->write( output3 ).

  endmethod.
endclass.
