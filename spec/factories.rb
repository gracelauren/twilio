FactoryGirl.define do
  factory(:message) do
    body 'Hello World!'
    to '7085038000'
    from '5005550006'
  end

  factory(:admirer) do
    email 'test@test.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
