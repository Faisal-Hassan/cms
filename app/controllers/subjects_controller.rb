class SubjectsController < ApplicationController
  
  layout 'admin'
  
  before_action :find_subject_by_id, :except => [:index, :new, :create]
  before_action :set_subject_count, :only => [:new, :create, :edit, :update]
  
  def index
    logger.debug("***Testing the logger.***")
    @subjects = Subject.sorted
  end

  def show
  end

  def new
    @subject = Subject.new(:name => "Default")
  end
  
  def create
    # Instantiate a new object using form parameters
    @subject= Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Subject has been created successfully!"
      redirect_to(subjects_path)
    else
    # If save fails, redisplay the form so user can fix 
      render('new')
    end
  end

  def edit
  end
  
  def update
    # Instantiate a new object using form parameters
    # Save the object
    if @subject.update_attributes(subject_params)
    # If save succeeds, redirect to the show action
      flash[:notice] = "Subject has been updated successfully!"
      redirect_to(subject_path(@subject))
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
  end
  
  def destroy
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' has been deleted successfully!"
    redirect_to(subjects_path)
  end
  
  private
  
  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end
  
  def find_subject_by_id
    @subject = Subject.find(params[:id])
  end
  
  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end
end
