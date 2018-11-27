class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]
  before_action :find_offices, only: [:new, :edit]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def edit
  end

  def update
    @doctor.update(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :office_id)
  end

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def find_offices
    @offices = Office.all
  end
end
