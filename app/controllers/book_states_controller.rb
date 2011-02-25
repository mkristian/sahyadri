class BookStatesController < ApplicationController

  # POST
  def create
    book = Book.get(params[:id])
    issuer = User.get(params[:book_state][:issued_by_id])
    if issuer
      @book_state = BookState.new
      @book_state.book = book
      @book_state.issue_by issuer
      @book_state.current_user = current_user
    end
    respond_to do |format|
      if @book_state.nil? || @book_state.save
        flash[:notice] = 'Book was successfully issued.' if @book_state
        format.html { redirect_to(edit_book_url(book.id)) }
        format.xml  { render :xml => book, :status => :created, :location => book }
      else
        format.html { redirect_to(edit_book_url(book.id)) }
        format.xml  { render :xml => @book_state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT
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

  # DELETE
  def destroy
    book = Book.get(params[:id])
    @book_state = book.state
    @book_state.current_user = current_user
    
    @book_state.destroy
    respond_to do |format|
      flash[:notice] = 'Book was successfully deleted.'
      format.html { redirect_to(edit_book_path(book.id)) }
      format.xml  { head :ok }
    end
  end
end
