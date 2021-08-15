Dado("que possua um payload de usuário válido") do
  @body = Factory::Dynamic::valid_user
end
   
Então("deverá criar um usuário com sucesso") do
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["message"]).to eql "Cadastro realizado com sucesso"
  expect(response_body_json["_id"]).to be_truthy
  @params += "/#{response_body_json["_id"]}"
end

E("deverá retornar uma lista de usuários") do
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["usuarios"].size).to be > 1
  expect(response_body_json["usuarios"].class).to be_a_kind_of(Array.class)
end

Dado("que possua um usuário pré-cadastrado") do
  steps %{
    Dado que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 201
    E deverá criar um usuário com sucesso
  }
end

Dado("que possua um id de usuário inválido") do
  @params = ''
  @params += "/umIdQueNaoExiste"
end

E("o usuário não deverá mais existir na base") do
  steps %{
    Quando chamar o endpoint "/usuarios" com o método "get" com parâmetros
    Então deverá retornar o status code 400
    E deverá retornar a mensagem "Usuário não encontrado"
  }
end

E("deverá alterar o usuário criado previamente") do
  steps %{
    Quando chamar o endpoint "/usuarios" com o método "get" com parâmetros
  }
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["nome"]).to eql @body[:nome]
  expect(response_body_json["email"]).to eql @body[:email]
end