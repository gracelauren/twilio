FactoryGirl.define do
  factory(:message) do
    body 'Hello World!'
    to '7085038000'
    from '5005550006'
  end
end
