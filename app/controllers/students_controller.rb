class StudentsController < ApplicationController

  # GET /students
  # GET /students.xml
  def index
    @students = Student.all()

    respond_to do |format|
      format.html
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.get!(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])
    @student.current_user = current_user

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(student_url(@student.id)) }
        format.xml  { render :xml => @student, :status => :created, :location => student_url(@student.id) + ".xml" }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.get!(params[:id])
    @student.current_user = current_user

    respond_to do |format|
      if @student.update(params[:student]) or not @student.dirty?
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(student_url(@student.id)) }
        format.xml  { render :xml => @student }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.get(params[:id])
    @student.current_user = current_user
    @student.destroy if @student

    respond_to do |format|
      flash[:notice] = 'Student was successfully deleted.'
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
