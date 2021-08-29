#language: pt

@serverest_product
Funcionalidade: [POST] ServeRest Product
  Como uma aplicação xpto
  Gostaria de poder chamar os endpoints da API ServeRest
  Para poder garantir seus status e validações

  @delete_after
  @post_register_product_201
  Cenário: [POST] Register product  201
    Dado que tenha salvado o token para as requisições
    E que possua um payload de um produto válido
    Quando chamar o endpoint "/produtos" com o método "post" sem parâmetros
    Então deverá retornar o status code 201
    E deverá retornar a mensagem "Cadastro realizado com sucesso"
    