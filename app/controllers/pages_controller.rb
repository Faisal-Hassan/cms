class PagesController < ApplicationController
  
  layout 'admin'
  
  before_action :confirm_logged_in
  before_action :find_subject
  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:new, :create, :edit, :update]
  before_action :find_page_by_id, :except => [:index, :new, :create, ]
  
  def index
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject_id)
  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page has been saved successfully"
      redirect_to(pages_path(:subject_id => @subject_id))
    else
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
  end
  
  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Page has been updated successfully"
      redirect_to(page_path(@page, :subject_id => @subject_id))
    else
      render('edit')
    end
  end

  def delete
  end
  
  def destroy
    @page.destroy
    flash[:notice] = "Page has been deleted successfully"
    redirect_to(pages_path(:subject_id => @subject_id))
  end
  
  private
  
  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end
  
  def find_subjects
    @subjects = Subject.sorted
  end
  
  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end
  
  def find_page_by_id
    @page = Page.find(params[:id])
  end
  
  def find_subject
    @subject = Subject.find(params[:subject_id])
  end
end
