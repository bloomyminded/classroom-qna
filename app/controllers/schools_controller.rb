class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:index]

  def index
    @schools = School.all
  end

  def show
    authenticate_student!
    @school = get_school
    @courses = @school.courses
  end

  private
  
  def authenticate_student!
    if ( current_user.is_admin? || current_user.is_student?(@school) )
      true
    else
      return redirect_to "/"
    end
  end

  def get_school
    @school = School.find(params[:id])
  end

  def private_params
    params.require(:school)
  end

end
