class StudentController < ApplicationController
	def show
		@student = Student.find(param[:id].to_i)
	end

	def attach_addhar
		@addhar = Aadhar.where(number: params[:id])
		@student = Student.find(params[:id].to_i)
		if @addhar.name == @student.name
			@exam_id = generate_id
		else
			flash[:error] = "One of your fields did not match with the aadhar card you entered."
			redirect_to :back
	end

	private

	def generate_id
		ExamId.create(addhar_number: @addhar.number, student_id: @student.id)
		Exam.count - 1
	end
end
