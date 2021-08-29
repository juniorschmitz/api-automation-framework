Quando("chamar o endpoint {string} com o método {string} sem parâmetros") do |endpoint, method|
  @response = @serverest_api.send(method, endpoint, @body)
  Utils.log_response(@response.body)
end

Quando("chamar o endpoint {string} com o método {string} com parâmetros") do |endpoint, method|
  endpoint += @params unless @params.nil?
  @response = @serverest_api.send(method, endpoint, @body)
  Utils.log_response(@response.body)
end

Então("deverá retornar o status code {int}") do |status_code|
  expect(@response.status).to eq status_code
end

Então("deverá retornar a mensagem {string}") do |message|
  @parsed_response_body = JSON.parse(@response.body)
  expect(@parsed_response_body["message"]).to eql message
end

Então("deverá retornar o contrato do serviço {string}") do |service|
  @parsed_response_body = JSON.parse(@response.body)
  schema = Utils.get_schema service
  expect(JSON::Validator.validate!(schema, @parsed_response_body)).to be true
end

Dado("que tenha salvado o token para as requisições") do
  steps %{
    Dado que possua um usuário pré-cadastrado
    E que possua os dados do usuário criado para logar
    Quando chamar o endpoint "/login" com o método "post" sem parâmetros
    Então deverá retornar o status code 200
    E deverá retornar a mensagem "Login realizado com sucesso"
  }
  token = @parsed_response_body["authorization"]
  @serverest_api.set_token(token)
end