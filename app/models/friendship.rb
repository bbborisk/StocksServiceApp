class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User' #jer je friend deo klase user

end
