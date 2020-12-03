class Api::V1::StudentsController < ApplicationController
    def index
        @students = Student.all
        render json:@students
     end
    
     def show
        @students = Student.find(params[:id])
        render json:@students
     end
    
     def create
        @student = Student.new(student_params)
        if @student.save
          render json:@student
        else
          render error: {error: "Unable to create the students"}, status: 400
        end
     end
    
     def update
        @student = Student.find(params[:id])
        if @student
          @student.update(student_params)
          render json: {message: "Student updated successfully"}, status: 200
        else
          render error: {error: "Unable to update the student"}, status: 400
        end
     end
    
        def destroy
            @student = Student.find(params[:id])
            if @student
              @student.destroy
              render json: {message: "Student deleted successfully"}, status: 200
            else
              render error: {error: "Unable to delete the Student"}, status: 400
            end
        end
    
        private 
        def student_params
          params.require(:student).permit(:first_name, :last_name, :email, :year_of_birth, :gender, :address, :fathers_name, :mothers_name)
        end
end
