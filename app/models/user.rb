class User < ActiveRecord::Base
    has_many :current_accounts
    has_many :savings_accounts
end