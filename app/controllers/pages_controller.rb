class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:name => "Default")
  end

  def create
    @page = Page.new(page_params)
    # Save the object
   if @page.save
    # If save succeeds, redirect to the index action
    flash[:notice] = "Page saved successfully."
    redirect_to(:action => 'index')
   else
    # If save fails, redisplay the form so user can fix problems
    render('new')
   end
  end

  def edit
    @page = Page.find(params[:id])

  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def destroy
  
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  def delete
     @page = Page.find(params[:id])
  end

  def page_params
    
     params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end
end
