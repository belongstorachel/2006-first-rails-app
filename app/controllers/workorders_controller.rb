class WorkordersController < ApplicationController

  def index
    @workorders = Workorder.open_workorders
  end

def list
  @workorders = Workorder.find_all
end

def print
  @workorders = Workorder.find_all
  @workorder = Workorder.find(params[:id])
  

  
end

  def listall
    @workorder_pages, @workorders = paginate :workorders, :per_page => 10
  end

  def show
    @workorder = Workorder.find(params[:id])
    @technicians = Technician.find_all 
    @statuses = Status.find_all
    @workorders = Workorder.find_all
    

    
  end

 def new
     @workorder = Workorder.new
    @statuses = Status.find_all
    @technicians = Technician.find_all
 end

  def create
    @workorder = Workorder.new(params[:workorder])
    @technicians = Technician.find_all
    if @workorder.save
      flash[:notice] = 'Workorder was successfully created.'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @workorder = Workorder.find(params[:id])
    @statuses = Status.find_all
    @technicians = Technician.find_all
    

  end

  def update

  
    @workorder = Workorder.find(params[:id])
          partscost = @workorder.parts_cost
  laborcost = @workorder.labor_cost
  @workorder.total = laborcost +  partscost + (partscost * 0.09) 


    if @workorder.update_attributes(params[:workorder])
      flash[:notice] = 'Workorder was successfully updated.'
      redirect_to :action => 'show', :id => @workorder
    else
      render :action => 'edit'
    end
  end

  def destroy
    Workorder.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
