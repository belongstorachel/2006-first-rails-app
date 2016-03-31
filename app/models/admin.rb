class Admin < ActiveRecord::Base

def self.to_be_paid

  find(:all,
        :conditions ="status_id = 0")

end
