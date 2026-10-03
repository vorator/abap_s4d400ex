**********************************************************************
* This class explores the concept of object creation with:
* + attributes
* + encapsulation
* + constructor
* + select data for attributes from a CDS view
* + structured data object

CLASS zcl_vorator_selectv3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vorator_selectv3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* 1st instance (using method set_atributes - ex10.)
    TRY.
        connection = new #(
            i_carrier_id = 'LH'
            i_connection_id = '0400'
        ).

        APPEND connection TO connections.

    CATCH cx_abap_invalid_value.
        out->write( |Method call failed| ).
    ENDTRY.

* 2nd instance
    TRY.
        connection = new #(
            i_carrier_id = 'AA'
            i_connection_id = '0017'
        ).

        APPEND connection TO connections.

    CATCH cx_abap_invalid_value.
        out->write( |Method call failed| ).
    ENDTRY.

* 3rd instance
   TRY.
        connection = new #(
            i_carrier_id = 'SQ'
            i_connection_id = '0001'
        ).

        APPEND connection TO connections.

    CATCH cx_abap_invalid_value.
        out->write( |Method call failed| ).
    ENDTRY.

* 4th, 5th and 5th instances in a loop (same carrier)
*    DO 3 TIMES.
*        TRY.
*            connection = new #(
*                i_carrier_id = 'TP'
*                i_connection_id = |{ sy-index + 1 WIDTH = 4 ALIGN = RIGHT PAD = '0' }|
*            ).
*
*            APPEND connection TO connections.
*
*        CATCH cx_abap_invalid_value.
*        out->write( |Method call failed| ).
*    ENDTRY.
*    ENDDO.

* 7th, 8th and 9th instances in a loop (same carrier) using the set_attributes method
*    DO 3 TIMES.
*        TRY.
*            connection = new #(
*                i_carrier_id = 'TP'
*                i_connection_id = |{ sy-index + 3 WIDTH = 4 ALIGN = RIGHT PAD = '0' }|
*            ).
*
*            APPEND connection TO connections.
*
*        CATCH cx_abap_invalid_value.
*            out->write( 'Method call failed' ).
*        ENDTRY.
*
*    ENDDO.
*
    LOOP AT connections INTO connection.
        out->write( connection->get_output(  ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
