Before do
  @params = ''
end

After('@delete_after') do
  log 'Deletando usuários criados nos testes...'
  @serverest_api.delete("/usuarios#{@params}")
end
