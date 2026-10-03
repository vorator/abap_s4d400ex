class lcl_connection definition.

  public section.

    class-data conn_counter type i read-only.

    methods constructor
      importing
        i_carrier_id    type /dmo/carrier_id
        i_connection_id type /dmo/connection_id
      raising
        cx_abap_invalid_value.

*    METHODS set_atributes
*        IMPORTING
*            i_carrier_id TYPE /dmo/carrier_id
*            i_connection_id TYPE /dmo/connection_id
*        RAISING
*            cx_abap_invalid_value.

    methods get_output
      returning value(r_output) type string_table.

  protected section.

  private section.

    data carrier_id type /dmo/carrier_id.
    data connection_id type /dmo/connection_id.

endclass.

class lcl_connection implementation.

  method constructor.

    if i_carrier_id is initial or i_connection_id is initial.
      raise exception type cx_abap_invalid_value.
    endif.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  endmethod.

*  method set_atributes.
*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*        RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.
*
*    carrier_id = i_carrier_id.
*    connection_id = i_connection_id.
*
*  endmethod.


  method get_output.
    append |-------------------------------| to r_output.
    append |Carrier:      { carrier_id }   | to r_output.
    append |Connection:   { connection_id }| to r_output.
  endmethod.



endclass.

