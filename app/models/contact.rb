class Contact < ActiveRecord::Base
    #Form Validations
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
end