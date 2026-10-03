class lcl_connection definition.

  public section.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_cunter TYPE i.

    METHODS set_atributes
        IMPORTING
            i_carrier_id TYPE /dmo/carrier_id
            i_connection_id TYPE /dmo/connection_id
        RAISING
            cx_abap_invalid_value.

    METHODS get_output
        RETURNING VALUE(r_output) TYPE string_table.

  protected section.
  private section.

endclass.

class lcl_connection implementation.

  method set_atributes.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.

  endmethod.


  method get_output.
    APPEND |-------------------------------| TO r_output.
    APPEND |Carrier:      { carrier_id }   | TO r_output.
    APPEND |Connection:   { connection_id }| TO r_output.
  endmethod.



endclass.

