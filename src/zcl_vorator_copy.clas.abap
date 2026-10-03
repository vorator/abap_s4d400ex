class zcl_vorator_copy definition
public

final

create public .



  public section.

    interfaces if_oo_adt_classrun.

  protected section.

  private section.

    constants: table_name type tabname value 'ZVORATORFLIGHT'.

    .
endclass.



class zcl_vorator_copy implementation.
  method if_oo_adt_classrun~main.

    data: lt_flight type table of /dmo/flight.



    " Llenar datos de ejemplo

    lt_flight = value #(

    ( carrier_id = 'AA' connection_id = '0017' flight_date = '20250408' )

    ( carrier_id = 'LH' connection_id = '0400' flight_date = '20250409' )

    ( carrier_id = 'UA' connection_id = '0941' flight_date = '20250410' )

    ).



    " Borrar datos existentes en la tabla

    delete from (table_name).



    " Insertar nuevos datos

    insert (table_name) from table @lt_flight.



    " Verificar si la operación fue exitosa

    if sy-subrc = 0.

      out->write( |{ table_name } was filled with data.| ).

    else.

      out->write( |Error filling { table_name }.| ).

    endif.

  endmethod.
endclass.
