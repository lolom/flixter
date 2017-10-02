class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course

  def show
  end

  private

  def require_authorized_for_current_course
    if ! current_user.enrolled_in?(current_lesson.section.course)
      redirect_to courses_path, alert: 'You must be enrolled in the course to view lessons.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
