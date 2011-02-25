require 'csv'
require 'books_import_export'
class BooksController < ApplicationController

  layout "sahyadri"

  before_filter :users

  def users
    @users = User.all(:order => [:name])
  end

  # GET /books
  # GET /books.xml
  def index
    @query = params[:query]
    @limit = params[:limit].to_i + 1
    @offset = params[:offset].to_i
    @fuzzy = !(["exact search", "false"].member? params.delete(:fuzzy))

    field = 
      unless @fuzzy
        :total
      else
        :total.like
      end
    # TODO not shure why this is needed
    flash.clear
    @books =
      if @limit > 1 && @query && @query.size > 0
        Book.all(field => "#{@query}", :limit => @limit, :offset => @offset) 
      elsif @query && @query.size > 0
        Book.all(field => "#{@query}")
      else
        flash["notice"] = "nothing to search" if @query
        Book.all(:id => -1123870) # the funny id is to produce an empty result set
      end
    @size = @books.size

    respond_to do |format|
      format.html {
        if @books.size == 1
          @book = @books[0]
          if allowed(:edit)
            render "edit"
          else
            render "show"
          end
        else
          render
        end
      }
      format.xml  { render :xml => @books }
      format.csv do
        render :text => proc { |response, output|
          def output.<<(str)
            write(str)
            self
          end

          CSV::Writer.generate(output, ";") do |csv|
            BooksImportExport.do_export(@books, csv)
          end
        }
      end
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
p @book
p @book.state
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
