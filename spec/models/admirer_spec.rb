require 'rails_helper'

describe Admirer do
  it { should have_many :messages }
  it { should have_many :friends }
end
