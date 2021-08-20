#language: pt

@serverest_user
Funcionalidade: [DELETE] ServeRest User
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @delete_user_200
  Cenário: [DELETE] Delete user 200
    Dado que possua um usuário pré-cadastrado
    Quando chamar o endpoint "/usuarios" com o método "delete" com parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Registro excluído com sucesso"
    E o usuário não deverá mais existir na base

  @delete_user_400
  Cenário: [DELETE] Delete user 400
    Dado que possua um id de usuário inválido
    Quando chamar o endpoint "/usuarios" com o método "delete" com parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Nenhum registro excluído"

  @delete_user_with_cart_400
  Cenário: [DELETE] Delete user with registered cart 400
    Dado que possua um usuário pré-cadastrado
    E que o usuário possua um carrinho cadastrado
    Quando chamar o endpoint "/usuarios" com o método "delete" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Não é permitido excluir usuário com carrinho cadastrado"
