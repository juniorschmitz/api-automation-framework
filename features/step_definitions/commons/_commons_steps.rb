Quando("chamar o endpoint {string} com o método {string} sem parâmetros") do |endpoint, method|
  @serverest_api = ServeRest.new
  @response = @serverest_api.send(method, endpoint, @body)
  Utils.log_response(@response.body)
end

Quando("chamar o endpoint {string} com o método {string} com parâmetros") do |endpoint, method|
  @serverest_api = ServeRest.new
  endpoint += @params unless @params.nil?
  @response = @serverest_api.send(method, endpoint, @body)
  Utils.log_response(@response.body)
end

Então("deverá retornar o status code {int}") do |status_code|
  expect(@response.status).to eq status_code
end

Então("deverá retornar a mensagem {string}") do |message|
  response_body_json = JSON.parse(@response.body)
  expect(response_body_json["message"]).to eql message
end