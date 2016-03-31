class Status < ActiveRecord::Base
  has_many :workorders
end
