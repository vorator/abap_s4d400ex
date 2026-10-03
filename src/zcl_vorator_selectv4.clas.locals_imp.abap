class lcl_connection definition.

  public section.

    class-data conn_counter type i read-only.

    class-methods class_constructor.

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

    types:
      begin of st_details,
        DepartureAirport type /dmo/airport_from_id,
        DestinationAirport type /dmo/airport_to_id,
        AirlineName type /dmo/carrier_name,
      end of st_details.

    types:
      begin of st_airport,
        AirportID type /dmo/airport_id,
        Name type /dmo/airport_name,
      end of st_airport.

    types tt_airports type standard table of st_airport
      with non-unique default key.

    data carrier_id type /dmo/carrier_id.
    data connection_id type /dmo/connection_id.
    data details type st_details.

    class-data airports type tt_airports.




endclass.

class lcl_connection implementation.

  method class_constructor.

    select from /DMO/I_Airport
      fields AirportID, Name
      into table @airports.

  endmethod.

  method constructor.

    if i_carrier_id is initial or i_connection_id is initial.
      raise exception type cx_abap_invalid_value.
    endif.

    select single
      from /DMO/I_Connection
      fields DepartureAirport, DestinationAirport, \_Airline-Name as AirlineName
      where AirlineID = @i_carrier_id and ConnectionID = @i_connection_id
      into corresponding fields of @details.

    if sy-subrc <> 0.
      raise exception type cx_abap_invalid_value.
    endif.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.

    conn_counter = conn_counter + 1.

  endmethod.


  method get_output.

    data(departure) = airports[ airportid = details-departureairport ].
    data(destination) = airports[ airportid = details-destinationairport ].

    append |-----------------------------------------------------------------| to r_output.
*    append |Carrier:      { carrier_id }                 | to r_output.
*    append |Connection:   { connection_id }              | to r_output.
*    append |Departure :   { airport_from_id }            | to r_output.
*    append |Destination:  { airport_to_id }              | to r_output.
    append |Carrier:      { carrier_id } { details-airlinename }             | to r_output.
    append |Conncetion:   { connection_id }                                  | to r_output.
    append |Departure :   { details-departureairport } { departure-name }    | to r_output.
    append |Destination : { details-destinationairport } { destination-name }| to r_output.
* APPEND ALTERNATIVE
*    append |Departure :   { details-departureairport } { airports[ airportid = details-departureairport ]-name }    | to r_output.
*    append |Destination : { details-destinationairport } { airports[ airportid = details-destinationairport ]-name }| to r_output.

  endmethod.



endclass.

