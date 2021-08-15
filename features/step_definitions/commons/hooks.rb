Before do
  @params = ''
end

After('@should_delete_users') do
  log 'Deletando usuários criados nos testes...'
  @serverest_api.delete("/usuarios#{@params}")
end
