class zcl_vorator_hello_world definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_vorator_hello_world implementation.


  method if_oo_adt_classrun~main.

    out->write( 'Hello World' ).

  endmethod.
endclass.
