class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.includes(:pictures, :user).limit(12)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id], include: [:pictures, :user, :tags])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
      format.js
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project.pictures.build 
    @project.tags.new

    @users = User.order('first_name desc')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @users = User.order('first_name desc')

  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @users = User.order('first_name desc')
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
        @users = User.order('first_name desc')
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
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.new
  end

  def create_picture
    @project = Project.find(params[:project_id])
    @picture = @project.pictures.new(params[:picture])
    if @picture.save
      redirect_to project_path(@project), notice: "Image successfully uploaded"
    else
      flash.now.alert = 'Image could not be saved. See errors below'
      render :new_picture
    end
  end  
end
