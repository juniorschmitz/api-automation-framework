#language: pt

@servrest_user
Funcionalidade: ServeRest User
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @get_all_users_200
  Cenário: [GET] Get Users 200
    Quando chamar o endpoint "/usuarios" com o método "get" sem parâmetros
    Então deverá retornar o status code 200
    E deverá retornar uma lista de usuários

  @should_delete_users
  @get_user_by_id_200
  Cenário: [GET] Get User By Id 200
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "get" com parâmetros
    Então deverá retornar o status code 200

  @get_user_by_id_400
  Cenário: [GET] Get User By Id 400
    Dado que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "get" com parâmetros
    Então deverá retornar o status code 400
    
  @should_delete_users
  @post_register_user_201
  Cenário: [POST] Register user 201
    Dado que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 201
    E deverá criar um usuário com sucesso

  @should_delete_users
  @register_user_400
  Cenário: [POST] Register user 400 email already registered
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Este email já está sendo usado"

  @delete_user_200
  Cenário: [DELETE] Delete user 200
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "delete" com parâmetros
    Então deverá retornar o status code 200
    E o usuário não deverá mais existir na base

  @should_delete_users
  @put_register_user_201
  Cenário: [PUT] Register user 201
    Dado que possua um payload de usuário válido
    E que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 201
    E deverá criar um usuário com sucesso

  @should_delete_users
  @put_update_user_201
  Cenário: [PUT] Change user register 200
    Dado que possua um usuário pré-cadastrado
    E que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Registro alterado com sucesso"
    E deverá alterar o usuário criado previamente

  @should_delete_users
  @put_register_user_400
  Cenário: [PUT] Register user 400
    Dado que possua um usuário pré-cadastrado
    E que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Este email já está sendo usado"