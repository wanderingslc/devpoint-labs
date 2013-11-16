class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_users, only: [:new, :edit, :create, :update]  
  # GET /projects
  # GET /projects.json
  def index
    @projects = ProjectDecorator.decorate_collection(Project.includes(:pictures, :user))
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.xml { render xml: @projects}
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id], include: [:pictures, :user, :tags]).decorate

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
      format.js
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = current_user.object.projects.new
    @project.pictures.build 
    @project.tags.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = ProjectDecorator.find(params[:id])

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.object.projects.new(params[:project])
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        flash.now.alert = "Your Project could not be created. Please check the errors below"
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        flash.now.alert = "Project could not be updated. Please correct the errors below."
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "That project is gone!" }
      format.json { head :no_content }
    end
  end

  def new_picture
    @project = ProjectDecorator.find(params[:project_id])
    @picture = @project.object.pictures.new
  end

  def create_picture
    @project = ProjectDecorator.find(params[:project_id])
    @picture = @project.object.pictures.new(params[:picture])
    if @picture.save
      redirect_to project_path(@project), notice: "Image successfully uploaded"
    else
      flash.now.alert = 'Image could not be saved. See errors below'
      render :new_picture
    end
  end  

  private
  def find_users
    @users = UserDecorator.decorate_collection(User.order('first_name desc'))
  end
end
