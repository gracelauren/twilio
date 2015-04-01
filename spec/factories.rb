FactoryGirl.define do
  factory(:message) do
    body 'Hello World!'
    to '5039846049'
    from '5005550006'
  end
end
