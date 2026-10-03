class zcl_vorator_iterate definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_vorator_iterate implementation.


  method if_oo_adt_classrun~main.

    constants max_count type i value 20.
    data fibo_numbers type table of i.

* solution with 50 numbers
*    CONSTANTS max_count TYPE i VALUE 50.
*    DATA fibo_numbers TYPE TABLE OF int8.

    data output type table of string.

    do max_count times.
      case sy-index.
        when 1.
          append 0 to fibo_numbers.
        when 2.
          append 1 to fibo_numbers.
        when others.
          append fibo_numbers[ sy-index - 2 ] + fibo_numbers[ sy-index - 1 ] to fibo_numbers.
      endcase.
    enddo.

    data(counter) = 0.

    loop at fibo_numbers into data(number).
      counter = counter + 1.
      append |{ counter width = 4 align = left } : { number width = 10 align = right }| to output.
    endloop.

    out->write( data = output
                name = |The first { max_count } Fibonacci Numbers| ).

  endmethod.
endclass.
