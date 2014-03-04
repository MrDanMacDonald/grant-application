class Admin::ProgramsController < ApplicationController

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to admin_programs_path
    else
      render :new
    end     
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def program_params 
    params.require(:program).permit(:name)
  end

end
