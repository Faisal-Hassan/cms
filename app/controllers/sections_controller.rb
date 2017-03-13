class SectionsController < ApplicationController
  
  layout 'admin'
  
  before_action :confirm_logged_in
  before_action :find_pages, :only => [:new, :create, :edit, :update]
  before_action :find_section_by_id, :except => [:index, :new, :create]
  before_action :set_section_count, :only => [:new, :create, :edit, :update]
  
  def index
    @sections = Section.sorted
  end

  def show
  end

  def new
    @section = Section.new
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section has been created successfully"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section has been updated successfully"
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def delete
  end
  
  def destroy
    @section.destroy
    flash[:notice] = "Section has been deleted successfully"
    redirect_to(sections_path)
  end
  
  private
  
  def section_params
    params.require(:section).permit(:page_id, :name, :position, 
    :visible, :content_type, :content)
  end
  
  def find_pages
    @pages = Page.sorted
  end
  
  def find_section_by_id
    @section = Section.find(params[:id])
  end
  
  def set_section_count
    @section_count = Section.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end
  
end
