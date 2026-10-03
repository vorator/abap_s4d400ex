class zcl_vorator_eml definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_vorator_eml implementation.


  method if_oo_adt_classrun~main.

    data agencies_upd type table for update /DMO/I_AgencyTP.

    agencies_upd = value #( (
      AgencyID = '0700139'
      Name = 'Vorator agency'
     ) ).

    modify entities of /DMO/I_AgencyTP
      entity /DMO/Agency
      update fields ( Name )
      with agencies_upd.

    out->write( |Method execution finished| ).

  endmethod.
endclass.
