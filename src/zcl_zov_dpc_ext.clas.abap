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


  method ovcabset_create_entity.
    data: ld_lastid type int4,
          ls_cab    type zovcab.

    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    io_data_provider->read_entry_data(
      importing
        es_data = er_entity ).

    move-corresponding er_entity to ls_cab.

    ls_cab-criacao_data = sy-datum.
    ls_cab-criacao_hora = sy-uzeit.
    ls_cab-criacao_usuario = sy-uname.

    select single max( ordemid )
      into ld_lastid
      from zovcab.

    ls_cab-ordemid = ld_lastid + 1.

    insert zovcab from ls_cab.

    if sy-subrc <> 0.
      lo_msg->add_message_text_only(
        exporting
          iv_msg_type               =  'E'                     " Message Type - defined by GCS_MESSAGE_TYPE
          iv_msg_text               =  'Erro ao inserir ordem' " Message Text
          ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

    MOVE-CORRESPONDING ls_cab TO er_entity.

    CONVERT
      DATE ls_cab-criacao_data
      TIME ls_cab-criacao_hora
      INTO TIME STAMP er_entity-datacriacao
      TIME ZONE sy-zonlo.

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
    data: ld_ordemid type zovcab-ordemid,
          ls_key_tab like line of it_key_tab,
          ls_cab     type zovcab.

    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    read table it_key_tab into ls_key_tab with key name = 'OrdemId'.
    if sy-subrc <> 0.
      lo_msg->add_message_text_only(
        exporting
          iv_msg_type               = 'E'                          " Message Type - defined by GCS_MESSAGE_TYPE
          iv_msg_text               = 'Id da ordem não informado'  " Message Text
      ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.

    endif.

    ld_ordemid = ls_key_tab-value.

    select single *
      into ls_cab
      from zovcab
      where ordemid = ld_ordemid.

    if sy-subrc = 0.
      move-corresponding ls_cab to er_entity.

      er_entity-criadopor = ls_cab-criacao_usuario.

      convert
        date ls_cab-criacao_data
        time ls_cab-criacao_hora
        into time stamp er_entity-datacriacao
        time zone sy-zonlo.
    else.
      lo_msg->add_message_text_only(
       exporting
         iv_msg_type               = 'E'                           " Message Type - defined by GCS_MESSAGE_TYPE
         iv_msg_text               = 'Id da ordem não encontrado'  " Message Text
     ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

  endmethod.


  method ovcabset_get_entityset.
    data: lt_cab       type standard table of zovcab,
          ls_cab       type zovcab,
          ls_entityset like line of et_entityset,
          lt_orderby   type standard table of string,
          ld_orderby   type string.

    loop at it_order into data(ls_order).
      translate ls_order-property to upper case.
      translate ls_order-order to upper case.

      if ls_order-order = 'DESC'.
        ls_order-order = 'DESCENDING'.
      else.
        ls_order-order = 'ASCENDING'.
      endif.

      append |{ ls_order-property } { ls_order-order }| to lt_orderby.
    endloop .

    concatenate lines of lt_orderby into ld_orderby separated by ''.

    if ld_orderby = ''.
      ld_orderby = 'OrdemId ASCENDING'.
    endif.

    select *
      from zovcab
      where (iv_filter_string)
      order by (ld_orderby)
      into table @lt_cab
      up to @is_paging-top rows
      offset @is_paging-skip.


    loop at lt_cab into ls_cab.
      clear ls_entityset.

      move-corresponding ls_cab to ls_entityset.

      ls_entityset-criadopor  = ls_cab-criacao_usuario.

      convert
         date ls_cab-criacao_data
         time ls_cab-criacao_hora
         into time stamp ls_entityset-datacriacao
         time zone sy-zonlo.


      append ls_entityset to et_entityset.

    endloop.
  endmethod.


  method ovcabset_update_entity.
    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    io_data_provider->read_entry_data(
      importing
        es_data = er_entity
    ).

    er_entity-ordemid = it_key_tab[ name = 'OrdemId' ]-value.

    update zovcab
       set clienteid = er_entity-clienteid
           totalitens = er_entity-totalitens
           totalfrete = er_entity-totalfrete
           totalordem = er_entity-totalordem
           status = er_entity-status
      where ordemid = er_entity-ordemid.

    if sy-subrc <> 0.
      lo_msg->add_message_text_only(
        exporting
          iv_msg_type               =  'E'                " Message Type - defined by GCS_MESSAGE_TYPE
          iv_msg_text               =  'Erro ao atualizar ordem'                " Message Text
 ).


      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.
  endmethod.


  method ovitemset_create_entity.
    data ls_item type zovitem.

    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    data: ld_lastid type int4,
          ls_cab    type zovcab.

    io_data_provider->read_entry_data(
      importing
        es_data = er_entity ).

    move-corresponding er_entity to ls_item.

    if er_entity-itemid = 0.
      select single max( itemid )
        into er_entity-itemid
        from zovitem
        where ordemid = er_entity-ordemid.

      er_entity-itemid = er_entity-itemid + 1.
    endif.

    insert zovitem from ls_item.

    if sy-subrc <> 0.
      lo_msg->add_message_text_only(
        exporting
          iv_msg_type               =  'E'                     " Message Type - defined by GCS_MESSAGE_TYPE
          iv_msg_text               =  'Erro ao inserir item' " Message Text
          ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

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


  method ovitemset_get_entity.
    data: ls_key_tab like line of it_key_tab,
          ls_item    type zovitem,
          ld_error   type flag.

    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    read table it_key_tab into ls_key_tab with key name = 'OrdemId'.
    if sy-subrc <> 0.
      ld_error = 'X'.

      lo_msg->add_message_text_only(
       exporting
         iv_msg_type               = 'E'                 " Message Type - defined by GCS_MESSAGE_TYPE
         iv_msg_text               = 'Id da ordem não informado'  " Message Text
     ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

    ls_item-ordemid = ls_key_tab-value.

    read table it_key_tab into ls_key_tab with key name = 'ItemId'.
    if sy-subrc <> 0.
      ld_error = 'X'.

      lo_msg->add_message_text_only(
       exporting
         iv_msg_type               = 'E'                 " Message Type - defined by GCS_MESSAGE_TYPE
         iv_msg_text               = 'Id da item não informado'  " Message Text
     ).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

    ls_item-itemid = ls_key_tab-value.

    if ld_error = 'X'.
      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.

    select single *
      into ls_item
      from zovitem
      where ordemid = ls_item-ordemid
      and itemid = ls_item-itemid.

    if sy-subrc = 0.
      move-corresponding ls_item to er_entity.
    else.
      lo_msg->add_message_text_only(
 exporting
   iv_msg_type               = 'E'                 " Message Type - defined by GCS_MESSAGE_TYPE
   iv_msg_text               = 'Id da item não encontrado'  " Message Text
).

      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.
  endmethod.


  method ovitemset_get_entityset.
    data: ld_ordemid       type int4,
          lt_ordemid_range type range of int4,
          ls_ordemid_range like line of lt_ordemid_range,
          ls_key_tab       like line of it_key_tab.

    read table it_key_tab into ls_key_tab with key name = 'OrdemId'.

    if sy-subrc = 0.
      ld_ordemid = ls_key_tab-value.

      clear ls_ordemid_range.
      ls_ordemid_range-sign = 'I'.
      ls_ordemid_range-option = 'EQ'.
      ls_ordemid_range-low = ld_ordemid.

      append ls_ordemid_range to lt_ordemid_range.

    endif.

    select *
      into corresponding fields of table et_entityset
      from zovitem
      where ordemid in lt_ordemid_range.


  endmethod.


  method ovitemset_update_entity.
    data(lo_msg) = me->/iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

    io_data_provider->read_entry_data(
      importing
        es_data = er_entity
    ).

    er_entity-ordemid = it_key_tab[ name = 'OrdemId' ]-value.
    er_entity-itemid = it_key_tab[ name = 'ItemId' ]-value.
    er_entity-precotot = er_entity-quantidade * er_entity-precounit.

    update zovitem
       set material = er_entity-material
           descricao = er_entity-descricao
           quantidade = er_entity-quantidade
           precotot = er_entity-precotot
           precouni = er_entity-precounit
     where ordemid = er_entity-ordemid
       and itemid = er_entity-itemid.

    if sy-subrc <> 0.
      lo_msg->add_message_text_only(
        exporting
          iv_msg_type               = 'E'                 " Message Type - defined by GCS_MESSAGE_TYPE
          iv_msg_text               = 'Erro ao atualizar item'                 " Message Text
   ).


      raise exception type /iwbep/cx_mgw_busi_exception
        exporting
          message_container = lo_msg.
    endif.
  endmethod.
ENDCLASS.
