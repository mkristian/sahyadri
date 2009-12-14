class BooksController < ApplicationController

  # GET /books
  # GET /books.xml
  def index
    @query = params[:query]
    @limit = params[:limit].to_i + 1
    @offset = params[:offset].to_i
    @books = @limit > 1 ? Book.all(:total.like => "#{@query}", :limit => @limit, :offset => @offset) : Book.all(:id => -1123870) # == empty
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.get!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.get!(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    @book.current_user = current_user

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(book_url(@book.id)) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.get!(params[:id])
    @book.current_user = current_user

    respond_to do |format|
      if @book.update(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(book_url(@book.id)) }
        format.xml  { render :xml => @book }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.get(params[:id])
    @book.current_user = current_user
    @book.destroy if @book

    respond_to do |format|
      flash[:notice] = 'Book was successfully deleted.'
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
