class StudentReflex < ApplicationReflex

  def add
    session[:students] << Student.new
  end

  def validate
    session[:students] = students_parmas.map { |s| Student.new(s) }
  end

  private

  def students_parmas
    params.require(:students).permit(students: [:first_name])[:students]
  end
end
