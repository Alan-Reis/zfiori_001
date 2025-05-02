class ZCL_ZOV_DPC_EXT definition
  public
  inheriting from ZCL_ZOV_DPC
  create public .

public section.
protected section.

  methods MENSAGEMSET_CREATE_ENTITY
    redefinition .
  methods MENSAGEMSET_DELETE_ENTITY
    redefinition .
  methods MENSAGEMSET_GET_ENTITY
    redefinition .
  methods MENSAGEMSET_GET_ENTITYSET
    redefinition .
  methods MENSAGEMSET_UPDATE_ENTITY
    redefinition .
  methods OVCABSET_CREATE_ENTITY
    redefinition .
  methods OVCABSET_DELETE_ENTITY
    redefinition .
  methods OVCABSET_GET_ENTITY
    redefinition .
  methods OVCABSET_GET_ENTITYSET
    redefinition .
  methods OVCABSET_UPDATE_ENTITY
    redefinition .
  methods OVITEMSET_CREATE_ENTITY
    redefinition .
  methods OVITEMSET_DELETE_ENTITY
    redefinition .
  methods OVITEMSET_GET_ENTITY
    redefinition .
  methods OVITEMSET_GET_ENTITYSET
    redefinition .
  methods OVITEMSET_UPDATE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZOV_DPC_EXT IMPLEMENTATION.


  method MENSAGEMSET_CREATE_ENTITY.
**try.
*CALL METHOD SUPER->MENSAGEMSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method MENSAGEMSET_DELETE_ENTITY.
**try.
*CALL METHOD SUPER->MENSAGEMSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method MENSAGEMSET_GET_ENTITY.
**try.
*CALL METHOD SUPER->MENSAGEMSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method MENSAGEMSET_GET_ENTITYSET.
**try.
*CALL METHOD SUPER->MENSAGEMSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  importing
**    et_entityset             =
**    es_response_context      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method MENSAGEMSET_UPDATE_ENTITY.
**try.
*CALL METHOD SUPER->MENSAGEMSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVCABSET_CREATE_ENTITY.
**try.
*CALL METHOD SUPER->OVCABSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVCABSET_DELETE_ENTITY.
**try.
*CALL METHOD SUPER->OVCABSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method ovcabset_get_entity.
    er_entity-ordemid = 1.
    er_entity-criadopor = 'Alan'.
    er_entity-datacriacao = '197001010000000'.
  endmethod.


  method OVCABSET_GET_ENTITYSET.

  endmethod.


  method OVCABSET_UPDATE_ENTITY.
**try.
*CALL METHOD SUPER->OVCABSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVITEMSET_CREATE_ENTITY.
**try.
*CALL METHOD SUPER->OVITEMSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVITEMSET_DELETE_ENTITY.
**try.
*CALL METHOD SUPER->OVITEMSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVITEMSET_GET_ENTITY.
**try.
*CALL METHOD SUPER->OVITEMSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  importing
**    er_entity               =
**    es_response_context     =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.


  method OVITEMSET_GET_ENTITYSET.

  endmethod.


  method OVITEMSET_UPDATE_ENTITY.
**try.
*CALL METHOD SUPER->OVITEMSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  importing
**    er_entity               =
*    .
** catch /iwbep/cx_mgw_busi_exception .
** catch /iwbep/cx_mgw_tech_exception .
**endtry.
  endmethod.
ENDCLASS.
