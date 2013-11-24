require 'machinist/active_record'

User.blueprint do
  name { "User #{sn}" }
  email { "user#{sn}@domain.com" }
  password { "password" }
  password_confirmation { "password" }
  admin { false }
end
