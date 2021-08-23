require 'faker'

module Factory
  class Dynamic
    def self.valid_user
      {
        nome: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: "1234",
        administrador: "true"
      }
    end

    def self.valid_product
      {
        nome: Faker::Name.first_name,
        preco: "999999999",
        descricao: "Este é um produto válido",
        quantidade: 500
      }
    end
  end
end
