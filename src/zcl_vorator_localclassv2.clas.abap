**********************************************************************
* This class explores the concept of object creation with:
* + attributes
* + encapsulation
* + constructor

class zcl_vorator_localclassv2 definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_vorator_localclassv2 implementation.


  method if_oo_adt_classrun~main.

    data connection type ref to lcl_connection.
    data connections type table of ref to lcl_connection.

* 1st instance (using method set_atributes - ex10.)
    try.
        connection = new #(
            i_carrier_id = 'LH'
            i_connection_id = '0400'
        ).

        append connection to connections.

      catch cx_abap_invalid_value.
        out->write( |Method call failed| ).
    endtry.

* 2nd instance
    try.
        connection = new #(
            i_carrier_id = 'AA'
            i_connection_id = '0017'
        ).

        append connection to connections.

      catch cx_abap_invalid_value.
        out->write( |Method call failed| ).
    endtry.

* 3rd instance
    try.
        connection = new #(
            i_carrier_id = 'SQ'
            i_connection_id = '0001'
        ).

        append connection to connections.

      catch cx_abap_invalid_value.
        out->write( |Method call failed| ).
    endtry.

* 4th, 5th and 5th instances in a loop (same carrier)
    do 3 times.
      try.
          connection = new #(
              i_carrier_id = 'LP'
              i_connection_id = |{ sy-index + 1 width = 4 align = right pad = '0' } |
          ).

          append connection to connections.

        catch cx_abap_invalid_value.
          out->write( |Method call failed| ).
      endtry.
    enddo.

* 7th, 8th and 9th instances in a loop (same carrier) using the set_attributes method

    do 3 times.
      try.
          connection = new #(
              i_carrier_id = 'LP'
              i_connection_id = |{ sy-index + 3 width = 4 align = right pad = '0' }|
          ).

          append connection to connections.

        catch cx_abap_invalid_value.
          out->write( 'Method call failed' ).
      endtry.

    enddo.

    loop at connections into connection.
      out->write( connection->get_output(  ) ).
    endloop.

  endmethod.
endclass.
