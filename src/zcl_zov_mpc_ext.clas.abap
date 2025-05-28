class zcl_zov_mpc_ext definition
  public
  inheriting from zcl_zov_mpc
  create public .

  public section.

    types:
      begin of ty_ordem_item
        , ordemid     type i
        , datacriacao type timestamp
        , criadopor   type c length 20
        , clienteid   type i
        , totalitens  type p length 8 decimals 2
        , totalfrete  type p length 8 decimals 2
        , totalordem  type p length 8 decimals 2
        , status      type c length 1
        , toovitem    type table of ts_ovitem with default key
        , end of ty_ordem_item .

    methods define
        redefinition.
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_ZOV_MPC_EXT IMPLEMENTATION.


  method define.
    data lo_entity_type type ref to /iwbep/if_mgw_odata_entity_typ.

    super->define( ).

    lo_entity_type = model->get_entity_type( iv_entity_name = 'OVCab' ).
    lo_entity_type->bind_structure( iv_structure_name = 'ZCL_ZOV_MPC_EXT=>TY_ORDEM_ITEM' ).
  endmethod.
ENDCLASS.
