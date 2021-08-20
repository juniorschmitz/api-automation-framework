#language: pt

@serverest_user
Funcionalidade: [PUT] ServeRest User
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @delete_after
  @put_register_user_201
  Cenário: [PUT] Register user 201
    Dado que possua um payload de usuário válido
    E que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 201
    E deverá retornar a mensagem "Cadastro realizado com sucesso"

  @delete_after
  @put_update_user_201
  Cenário: [PUT] Change user register 200
    Dado que possua um usuário pré-cadastrado
    E que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Registro alterado com sucesso"
    E deverá alterar o usuário criado previamente

  @delete_after
  @put_register_user_400
  Cenário: [PUT] Register user 400
    Dado que possua um usuário pré-cadastrado
    E que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Este email já está sendo usado"

  @put_register_user_without_required_fields_400
  Esquema do Cenário: [PUT] Register user without required fields 400
    Dado que possua um id de usuário inválido
    E que possua um payload de usuário válido
    Mas que tenha removido o campo "<field>"
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar uma mensagem informando que o campo "<field>" é obrigatório
  
    Exemplos:
    |  field        |
    | nome          |
    | email         |
    | password      |

  @put_register_user_with_invalid_data_400
  Esquema do Cenário: [PUT] Register user invalid fields 400
    Dado que possua um id de usuário inválido
    E que possua um payload de usuário do tipo "<user_type>"
    Quando chamar o endpoint "/usuarios" com o método "put" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar uma mensagem "<message>" para o campo "<field>"
  
    Exemplos:
    |  user_type                | message                                        |  field           |
    | invalid_email             | email deve ser um email válido                 | email            |
    | administrator_non_boolean | administrador deve ser 'true' ou 'false'       | administrador    |
