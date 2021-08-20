Dado("que possua um payload de usuário válido") do
  @body = Factory::Dynamic::valid_user
end

E("deverá retornar uma lista de usuários") do
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body["usuarios"].size).to be > 1
  expect(@parsed_response_body["usuarios"].class).to be_a_kind_of(Array.class)
end

Dado("que possua um usuário pré-cadastrado") do
  steps %{
    Dado que possua um payload de usuário válido
    Quando chamar o endpoint "/usuarios" com o método "post" sem parâmetros
    Então deverá retornar o status code 201
    E deverá retornar a mensagem "Cadastro realizado com sucesso"
  }
  expect(@parsed_response_body["_id"]).to be_truthy
  @params += "/#{@parsed_response_body["_id"]}"
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
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body["nome"]).to eql @body[:nome]
  expect(@parsed_response_body["email"]).to eql @body[:email]
end

E("deverá retornar um único usuário") do
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body["usuarios"]).to be nil
  expect(@parsed_response_body["nome"]).not_to be nil
  expect(@parsed_response_body["_id"]).not_to be nil
end

Dado('que o usuário possua um carrinho cadastrado') do
  # binding.pry
end

Dado('que tenha removido o campo {string}') do |field|
  @body.delete(field.to_sym)
end

E("deverá retornar uma mensagem informando que o campo {string} é obrigatório") do |field|
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body[field]).to eql "#{field} é obrigatório"
end

Dado("que possua um payload de usuário do tipo {string}") do |user_type|
  @body = Factory::Static.static_data user_type
end

Então("deverá retornar uma mensagem {string} para o campo {string}") do |message, field|
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body[field]).to eql message
end
