
class Workorder < ActiveRecord::Base

validates_presence_of :first_name, :last_name, :contact_number, :description_of_problem

belongs_to :technician
belongs_to :status



def self.open_workorders
  find(:all,
        :conditions => "status_id > 1")
end



end
