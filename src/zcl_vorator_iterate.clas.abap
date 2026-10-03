CLASS zcl_vorator_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vorator_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS max_count TYPE i VALUE 50.

    DATA fibo_numbers TYPE TABLE OF int8.

    DATA output TYPE TABLE OF string.

    DO max_count TIMES.
        CASE sy-index.
            WHEN 1.
                APPEND 0 TO fibo_numbers.
            WHEN 2.
                APPEND 1 TO fibo_numbers.
            WHEN OTHERS.
                APPEND fibo_numbers[ sy-index - 2 ] + fibo_numbers[ sy-index - 1 ] TO fibo_numbers.
        ENDCASE.
    ENDDO.

    DATA(counter) = 0.

    LOOP AT fibo_numbers INTO DATA(number).
        counter = counter + 1.
        APPEND |{ counter WIDTH = 4 ALIGN = LEFT } : { number WIDTH = 10 ALIGN = RIGHT }| TO output.
    ENDLOOP.

    out->write( data = output
                name = |The first { max_count } Fibonacci Numbers| ).

  ENDMETHOD.
ENDCLASS.
