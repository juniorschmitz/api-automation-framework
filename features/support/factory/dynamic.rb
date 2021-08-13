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
  end
end
