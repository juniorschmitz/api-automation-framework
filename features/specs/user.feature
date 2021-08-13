#language: pt

@servrest_user
Funcionalidade: ServeRest User
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @get_all_users
  Cenário: Get Users
    Quando chamar o endpoint "/usuarios" com o método "get"
    Então deverá retornar o status code 200
    E deverá retornar uma lista de usuários

  @get_user_by_id
  Cenário: Get User By Id
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "get"
    Então deverá retornar o status code 200
    
  @register_user
  Cenário: Register user 201 ok
    Dado que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "post"
    Então deverá retornar o status code 201
    E deverá criar um usuário com sucesso
  