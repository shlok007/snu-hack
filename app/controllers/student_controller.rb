class StudentController < ApplicationController
	def show
		@student = Student.find(params[:id])
	end

	def attach_addhar
		@addhar = AddharCard.where(number: params[:number]).first
		@student = Student.find_by_id(params[:id])
		begin 
			if !@exam_id = ExamId.where(aadhar_number: @addhar.number, student_id: @student.id).last.id + 1600
			  if @student.name == @addhar.name && @student.fathers_name == @addhar.fathers_name
			    @exam_id = generate_id
			    render json: {:exam_id => @exam_id}
			  end
			else
				render json: {:exam_id => @exam_id}
			end
		rescue
			flash[:error] = "One of your fields did not match with the aadhar card you entered."
			redirect_to :back
		end
	end

	private

	def generate_id
		ExamId.create(aadhar_number: @addhar.number, student_id: @student.id)
		1600 + ExamId.count
	end
end
