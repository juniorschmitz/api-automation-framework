#language: pt

@serverest_user
Funcionalidade: [POST] ServeRest User
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações
     
  @delete_after
  @post_register_user_201
  Cenário: [POST] Register user 201
    Dado que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 201
    E deverá retornar a mensagem "Cadastro realizado com sucesso"

  @delete_after
  @post_register_user_400
  Cenário: [POST] Register user 400 email already registered 400
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Este email já está sendo usado"

  @post_register_user_without_required_fields_400
  Esquema do Cenário: [POST] Register user without required fields 400
    Dado que possua um payload de usuário válido
    Mas que tenha removido o campo "<field>"
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 400
    E deverá retornar uma mensagem informando que o campo "<field>" é obrigatório
  
    Exemplos:
    |  field        |
    | nome          |
    | email         |
    | password      |

  @post_register_user_with_invalid_data_400
  Esquema do Cenário: [POST] Register user invalid fields 400
    Dado que possua um payload de usuário do tipo "<user_type>"
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 400
    E deverá retornar uma mensagem "<message>" para o campo "<field>"
  
    Exemplos:
    |  user_type                | message                                        |  field           |
    | invalid_email             | email deve ser um email válido                 | email            |
    | administrator_non_boolean | administrador deve ser 'true' ou 'false'       | administrador    |
