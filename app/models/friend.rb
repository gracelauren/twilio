class Friend < ActiveRecord::Base
  belongs_to :admirer
  validates :phone, presence: true
  validates :name, presence: true
  validates :phone, format: { with: /[^A-Za-z]/,
    message: "does not allow letters" }
end
