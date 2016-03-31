class TechniciansController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @technician_pages, @technicians = paginate :technicians, :per_page => 10
  end

  def show
    @technician = Technician.find(params[:id])
  end

  def new
    @technician = Technician.new
  end

  def create
    @technician = Technician.new(params[:technician])
    if @technician.save
      flash[:notice] = 'Technician was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @technician = Technician.find(params[:id])
  end

  def update
    @technician = Technician.find(params[:id])
    if @technician.update_attributes(params[:technician])
      flash[:notice] = 'Technician was successfully updated.'
      redirect_to :action => 'show', :id => @technician
    else
      render :action => 'edit'
    end
  end

  def destroy
    Technician.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
