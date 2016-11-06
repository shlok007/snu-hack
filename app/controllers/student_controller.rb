class StudentController < ApplicationController
	def show
		if params[:dob]
		@student = Student.where(id: params[:id], dob: params[:dob]).last
		if @student
		else
			redirect_to :back
		end
	else
		@student = Student.find(params[:id])
		if @student
		else
			redirect_to :back
		end
	end
	end

	def attach_addhar
		@addhar = AddharCard.where(number: params[:number]).first
		@student = Student.find_by_id(params[:id])
		begin 
			if !ExamId.where(aadhar_number: @addhar.number, student_id: @student.id).last
			  if @student.name == @addhar.name && @student.fathers_name == @addhar.fathers_name && @student.mothers_name == @addhar.mothers_name 
			    @exam_id = generate_id
			    flash[:error] = "Congratulations! your identity has been verified successfully"
			    redirect_to :back
			  end
			else
				flash[:error] = "Details did not match.Check your Details and try again."
				redirect_to :back
			end
		rescue
			flash[:error] = "Details did not match.Check your Details and try again.
			Contact the college authorities if the problem persists"
			redirect_to :back
		end
	end

	def authenticate
		@student = Student.find(ExamId.find(params[:id].to_i-1600).student_id)
		if @student
			render json: @student.to_json
		else
			render json: {:fail => "fail"}
		end
	end

	private

	def generate_id
		ExamId.create(aadhar_number: @addhar.number, student_id: @student.id)
		1600 + ExamId.count
	end
end
