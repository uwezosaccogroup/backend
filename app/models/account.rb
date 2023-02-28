class Account < ActiveRecord::Base
    belongs_to :customers
end