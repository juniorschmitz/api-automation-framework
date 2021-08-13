Before do
  @params = ''
end

After('@register_user or @get_user_by_id') do
  log 'Deletando usuários criados nos testes...'
  @serverest_api.delete("/usuarios#{@params}")
end
