CLASS LHC_ZR_VORATORFLIGHT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrVoratorflight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            keys FOR ZrVoratorflight~validatePrice.
ENDCLASS.

CLASS LHC_ZR_VORATORFLIGHT IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD validatePrice.
    data failed_record like line of failed-zrvoratorflight.
    data reported_record like line of reported-zrvoratorflight.

    read entities of zr_voratorflight in local mode
      entity ZrVoratorflight
        fields ( Price )
        with corresponding #( keys )
        result data(flights).

    loop at flights into data(flight).
      if flight-price <= 0.

        failed_record-%tky = flight-%tky.
        append failed_record to failed-zrvoratorflight.

        reported_record-%tky = flight-%tky.
        reported_record-%msg = new_message( id = '/dmo/flight' number = '101' severity = ms-error v1 = 'Invalid negative amount' ).
        append reported_record TO reported-zrvoratorflight.
      endif.
    endloop.

  ENDMETHOD.

ENDCLASS.
