Dado("que possua um payload de usuário válido") do
  @body = Factory::Dynamic::valid_user
end

Quando("chamar o endpoint {string} com o método {string}") do |endpoint, method|
  @serverest_api = ServeRest.new
  endpoint += @params unless @params.nil?
  @response = @serverest_api.send(method, endpoint, @body)
end

Então("deverá retornar o status code {int}") do |status_code|
  expect(@response.status).to eq status_code
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
    Quando chamar o endpoint "/usuarios" com o método "post"
    Então deverá retornar o status code 201
    E deverá criar um usuário com sucesso
  }
end
