#language: pt

@serverest_login
Funcionalidade: [POST] ServeRest Login
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @delete_after
  @post_login_200
  Cenário: [POST] Post Login 200
    Dado que possua um usuário pré-cadastrado
    E que possua os dados do usuário criado para logar
    Quando chamar o endpoint "/login" com o método "post" sem parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Login realizado com sucesso"

  @delete_after
  @post_login_400
  Esquema do Cenário: [POST] Post Login 400
    Dado que possua um payload para logar do tipo "<type>"
    Quando chamar o endpoint "/login" com o método "post" sem parâmetros
    Então deverá retornar o status code 400
    E deverá retornar uma mensagem "<message>" para o campo "<field>"

    Exemplos:
    |  type               | message                                   | field        |
    |  invalid_email      | email deve ser um email válido            | email        |
    |  invalid_password   | password não pode ficar em branco         | password     |