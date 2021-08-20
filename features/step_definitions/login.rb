E("que possua os dados do usuário criado para logar") do
  @body.delete(:nome)
  @body.delete(:administrador)
end

Dado("que possua um payload para logar do tipo {string}") do |login_type|
  @body = Factory::Static.static_data login_type
end