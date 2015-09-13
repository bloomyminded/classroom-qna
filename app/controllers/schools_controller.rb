class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_school, only: [:show, :destroy]

  def index
    @schools = School.all
  end

  def show
    @courses = @school.courses
  end

  def destroy
    authorize @school

    if @school.destroy
      redirect_to action: "index", notice: "Delete successful!"
    else
      redirect_to action: "index", notice: "Failed to delete school!"
    end
  end

  private
  
  def get_school
    @school = School.find(params[:id])
  end

  def private_params
    params.require(:school)
  end

end
