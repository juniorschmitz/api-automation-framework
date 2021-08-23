Before do
  @params = ''
  @serverest_api = ServeRest.new
end

After('@delete_after') do
  log 'Deletando usuários criados nos testes...'
  @serverest_api.delete("/usuarios#{@params}")
end
