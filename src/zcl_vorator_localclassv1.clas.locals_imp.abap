class lcl_connection definition.

  public section.

    data carrier_id type /dmo/carrier_id.
    data connection_id type /dmo/connection_id.

    class-data conn_cunter type i.

    methods set_atributes
      importing
        i_carrier_id    type /dmo/carrier_id
        i_connection_id type /dmo/connection_id
      raising
        cx_abap_invalid_value.

    methods get_output
      returning value(r_output) type string_table.

  protected section.
  private section.

endclass.

class lcl_connection implementation.

  method set_atributes.
    if i_carrier_id is initial or i_connection_id is initial.
      raise exception type cx_abap_invalid_value.
    endif.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.

  endmethod.


  method get_output.
    append |-------------------------------| to r_output.
    append |Carrier:      { carrier_id }   | to r_output.
    append |Connection:   { connection_id }| to r_output.
  endmethod.



endclass.

