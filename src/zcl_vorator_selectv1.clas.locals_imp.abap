class lcl_connection definition.

  public section.

    class-data conn_counter type i read-only.

    methods constructor
      importing
        i_carrier_id    type /dmo/carrier_id
        i_connection_id type /dmo/connection_id
      raising
        cx_abap_invalid_value.

    methods get_output
      returning value(r_output) type string_table.

  protected section.

  private section.

    data carrier_id type /dmo/carrier_id.
    data connection_id type /dmo/connection_id.
    data airport_from_id type /dmo/airport_from_id.
    data airport_to_id type /dmo/airport_to_id.


endclass.

class lcl_connection implementation.

  method constructor.

    if i_carrier_id is initial or i_connection_id is initial.
      raise exception type cx_abap_invalid_value.
    endif.

    select single
      from /dmo/connection
      fields airport_from_id, airport_to_id
      where carrier_id = @i_carrier_id and connection_id = @i_connection_id
      into ( @airport_from_id, @airport_to_id ).

    if sy-subrc <> 0.
      raise exception type cx_abap_invalid_value.
    endif.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  endmethod.


  method get_output.
    append |---------------------------------| to r_output.
    append |Carrier:      { carrier_id }     | to r_output.
    append |Connection:   { connection_id }  | to r_output.
    append |Departure :   { airport_from_id }| to r_output.
    append |Destination:  { airport_to_id }  | to r_output.
  endmethod..



endclass.

