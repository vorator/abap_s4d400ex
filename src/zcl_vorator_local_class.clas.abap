CLASS zcl_vorator_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vorator_local_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* 1st instance (using method set_atributes - ex10.)
    connection = new #(  ).
    TRY.
        connection->set_atributes(
            i_carrier_id = 'LH'
            i_connection_id = '0400'
             ).

        APPEND connection TO connections.

    CATCH cx_abap_invalid_value.
        out->write( 'Method call failed' ).
    ENDTRY.



* 2nd instance
    connection = new #(  ).

    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection TO connections.

* 3rd instance
    connection = new #(  ).

    connection->carrier_id = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.

* 4th, 5th and 5th instances in a loop (same carrier)
    DO 3 TIMES.
        connection = new #(  ).
        connection->carrier_id = 'LP'.
        DATA(next_id) = sy-index + 1.
        connection->connection_id = |{ next_id WIDTH = 4 ALIGN = RIGHT PAD = '0' } |.
        APPEND connection TO connections.
    ENDDO.

* 7th, 8th and 9th instances in a loop (same carrier) using the set_attributes method

    DO 3 TIMES.
        connection = new #(  ).

        TRY.
        connection->set_atributes(
            i_carrier_id = 'LP'
            i_connection_id = |{ sy-index + 3 WIDTH = 4 ALIGN = RIGHT PAD = '0' }|
             ).

        APPEND connection TO connections.

        CATCH cx_abap_invalid_value.
            out->write( 'Method call failed' ).
        ENDTRY.

    ENDDO.

    LOOP AT connections INTO connection.
        out->write( connection->get_output(  ) ).
    ENDLOOP.

* test

  ENDMETHOD.
ENDCLASS.
