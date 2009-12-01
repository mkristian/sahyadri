require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BooksController do

  def mock_book(stubs={})
    @mock_book ||= mock_model(Book, stubs)
  end

  def mock_array(*args)
    a = args
    def a.model
      Book
    end
    a
  end

  def mock_arguments(merge = {})
    args = merge
    args.merge!(:current_user= => nil)
    args.merge!(:model => Book, :key => 12)
  args
  end

  before(:each) do
    user = Ixtlan::Models::User.new(:id => 1, :login => 'root')
    def user.groups
      [Ixtlan::Models::Group.new(:name => "root")]
    end
    controller.send(:current_user=, user)
    mock_configuration = mock_model(Ixtlan::Models::Configuration,{})
    Ixtlan::Models::Configuration.should_receive(:instance).any_number_of_times.and_return(mock_configuration)
    mock_configuration.should_receive(:session_idle_timeout).any_number_of_times.and_return(1)
  end

  describe "GET index" do

    it "exposes all books as @books" do
      Book.should_receive(:all).and_return(mock_array(mock_book))
      get :index
      assigns[:books].should == mock_array(mock_book)
    end

    describe "with mime type of xml" do

      it "renders all bookses as xml" do
        Book.should_receive(:all).and_return(books = mock_array("Array of Books"))
        books.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested book as @book" do
      Book.should_receive(:get!).with("37").and_return(mock_book(mock_arguments))
      get :show, :id => "37"
      assigns[:book].should equal(mock_book)
    end

    describe "with mime type of xml" do

      it "renders the requested book as xml" do
        Book.should_receive(:get!).with("37").and_return(mock_book(mock_arguments))
        mock_book.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new book as @book" do
      Book.should_receive(:new).and_return(mock_book(mock_arguments))
      get :new
      assigns[:book].should equal(mock_book)
    end

  end

  describe "GET edit" do

    it "exposes the requested book as @book" do
      Book.should_receive(:get!).with("37").and_return(mock_book(mock_arguments))
      get :edit, :id => "37"
      assigns[:book].should equal(mock_book)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created book as @book" do
        Book.should_receive(:new).with({'these' => 'params'}).and_return(mock_book(mock_arguments(:save => true)))
        post :create, :book => {:these => 'params'}
        assigns(:book).should equal(mock_book)
      end

      it "redirects to the created book" do
        Book.stub!(:new).and_return(mock_book(mock_arguments(:save => true)))
        post :create, :book => {}
        response.should redirect_to(book_url(mock_book))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved book as @book" do
        Book.stub!(:new).with({'these' => 'params'}).and_return(mock_book(mock_arguments(:save => false)))
        post :create, :book => {:these => 'params'}
        assigns(:book).should equal(mock_book)
      end

      it "re-renders the 'new' template" do
        Book.stub!(:new).and_return(mock_book(mock_arguments(:save => false)))
        post :create, :book => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested book" do
        Book.should_receive(:get!).with("37").and_return(mock_book(mock_arguments))
        mock_book.should_receive(:update).with({'these' => 'params'})
        mock_book.should_receive(:dirty?)
        put :update, :id => "37", :book => {:these => 'params'}
      end

      it "exposes the requested book as @book" do
        Book.stub!(:get!).and_return(mock_book(mock_arguments(:update => true)))
        put :update, :id => "1"
        assigns(:book).should equal(mock_book)
      end

      it "redirects to the book" do
        Book.stub!(:get!).and_return(mock_book(mock_arguments(:update => true)))
        put :update, :id => "1"
        response.should redirect_to(book_url(mock_book))
      end

    end

    describe "with invalid params" do

      it "updates the requested book" do
        Book.should_receive(:get!).with("37").and_return(mock_book(mock_arguments))
        mock_book.should_receive(:update).with({'these' => 'params'})
        mock_book.should_receive(:dirty?)
        put :update, :id => "37", :book => {:these => 'params'}
      end

      it "exposes the book as @book" do
        Book.stub!(:get!).and_return(mock_book(mock_arguments(:update => false)))
        mock_book.should_receive(:dirty?)
        put :update, :id => "1"
        assigns(:book).should equal(mock_book)
      end

      it "re-renders the 'edit' template" do
        Book.stub!(:get!).and_return(mock_book(mock_arguments(:update => false, :dirty? => true)))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested book" do
      Book.should_receive(:get).with("37").and_return(mock_book(mock_arguments))
      mock_book.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the books list" do
      Book.should_receive(:get).with("1").and_return(mock_book(mock_arguments(:destroy => true)))
      delete :destroy, :id => "1"
      response.should redirect_to(books_url)
    end

  end

end
