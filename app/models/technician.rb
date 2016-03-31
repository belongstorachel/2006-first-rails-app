class Technician < ActiveRecord::Base

  has_many :workorders
end
