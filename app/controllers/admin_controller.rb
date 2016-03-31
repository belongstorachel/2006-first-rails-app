class AdminController < ApplicationController

def tobepaid

@workorders = Workorder.to_be_paid

end

def index
 @workorders = Workorder.open_workorders
 $labor_totals, $parts_totals, $work_order_totals,  = 0,0,0 

@workorder.open_workorders.each 
  $labor_totals += @workorder.labor_cost
     $parts_totals += @workorder.parts_cost
     $work_order_totals += @workorder.total 
 end
end



end
