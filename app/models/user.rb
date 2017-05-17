class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    
    def mood
        happiness > nausea ? "happy" : "sad"
    end
end
