require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  before(:each) do
    @valid_attributes = {
      :date => ,
      :author => "value for author",
      :title => "value for title",
      :edition => "value for edition",
      :place_publisher => "value for place_publisher",
      :status => "value for status",
      :clas_no => "value for clas_no",
      :year => 1,
      :pages => 1,
      :volume => "value for volume",
      :source => "value for source",
      :cost => "value for cost",
      :bill_no => "value for bill_no",
      :isbn => "value for isbn",
      :keywords => "value for keywords",
      :remarks => "value for remarks"
    }
  end

  it "should create a new instance given valid attributes" do
    Book.create(@valid_attributes)
  end
  it "should require date" do
    book = Book.create(@valid_attributes.merge(:date => nil))
    book.errors.on(:date).should_not == nil
  end

  it "should require author" do
    book = Book.create(@valid_attributes.merge(:author => nil))
    book.errors.on(:author).should_not == nil
  end

  it 'should not match author' do
    book = Book.create(@valid_attributes.merge(:author => "<script" ))
    book.errors.on(:author).should_not == nil
    book = Book.create(@valid_attributes.merge(:author => "sc'ript" ))
    book.errors.on(:author).should_not == nil
    book = Book.create(@valid_attributes.merge(:author => "scr&ipt" ))
    book.errors.on(:author).should_not == nil
    book = Book.create(@valid_attributes.merge(:author => 'scr"ipt' ))
    book.errors.on(:author).should_not == nil
    book = Book.create(@valid_attributes.merge(:author => "script>" ))
    book.errors.on(:author).should_not == nil
  end

  it "should require title" do
    book = Book.create(@valid_attributes.merge(:title => nil))
    book.errors.on(:title).should_not == nil
  end

  it 'should not match title' do
    book = Book.create(@valid_attributes.merge(:title => "<script" ))
    book.errors.on(:title).should_not == nil
    book = Book.create(@valid_attributes.merge(:title => "sc'ript" ))
    book.errors.on(:title).should_not == nil
    book = Book.create(@valid_attributes.merge(:title => "scr&ipt" ))
    book.errors.on(:title).should_not == nil
    book = Book.create(@valid_attributes.merge(:title => 'scr"ipt' ))
    book.errors.on(:title).should_not == nil
    book = Book.create(@valid_attributes.merge(:title => "script>" ))
    book.errors.on(:title).should_not == nil
  end

  it "should require edition" do
    book = Book.create(@valid_attributes.merge(:edition => nil))
    book.errors.on(:edition).should_not == nil
  end

  it 'should not match edition' do
    book = Book.create(@valid_attributes.merge(:edition => "<script" ))
    book.errors.on(:edition).should_not == nil
    book = Book.create(@valid_attributes.merge(:edition => "sc'ript" ))
    book.errors.on(:edition).should_not == nil
    book = Book.create(@valid_attributes.merge(:edition => "scr&ipt" ))
    book.errors.on(:edition).should_not == nil
    book = Book.create(@valid_attributes.merge(:edition => 'scr"ipt' ))
    book.errors.on(:edition).should_not == nil
    book = Book.create(@valid_attributes.merge(:edition => "script>" ))
    book.errors.on(:edition).should_not == nil
  end

  it "should require place_publisher" do
    book = Book.create(@valid_attributes.merge(:place_publisher => nil))
    book.errors.on(:place_publisher).should_not == nil
  end

  it 'should not match place_publisher' do
    book = Book.create(@valid_attributes.merge(:place_publisher => "<script" ))
    book.errors.on(:place_publisher).should_not == nil
    book = Book.create(@valid_attributes.merge(:place_publisher => "sc'ript" ))
    book.errors.on(:place_publisher).should_not == nil
    book = Book.create(@valid_attributes.merge(:place_publisher => "scr&ipt" ))
    book.errors.on(:place_publisher).should_not == nil
    book = Book.create(@valid_attributes.merge(:place_publisher => 'scr"ipt' ))
    book.errors.on(:place_publisher).should_not == nil
    book = Book.create(@valid_attributes.merge(:place_publisher => "script>" ))
    book.errors.on(:place_publisher).should_not == nil
  end

  it "should require status" do
    book = Book.create(@valid_attributes.merge(:status => nil))
    book.errors.on(:status).should_not == nil
  end

  it 'should not match status' do
    book = Book.create(@valid_attributes.merge(:status => "<script" ))
    book.errors.on(:status).should_not == nil
    book = Book.create(@valid_attributes.merge(:status => "sc'ript" ))
    book.errors.on(:status).should_not == nil
    book = Book.create(@valid_attributes.merge(:status => "scr&ipt" ))
    book.errors.on(:status).should_not == nil
    book = Book.create(@valid_attributes.merge(:status => 'scr"ipt' ))
    book.errors.on(:status).should_not == nil
    book = Book.create(@valid_attributes.merge(:status => "script>" ))
    book.errors.on(:status).should_not == nil
  end

  it "should require clas_no" do
    book = Book.create(@valid_attributes.merge(:clas_no => nil))
    book.errors.on(:clas_no).should_not == nil
  end

  it 'should not match clas_no' do
    book = Book.create(@valid_attributes.merge(:clas_no => "<script" ))
    book.errors.on(:clas_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:clas_no => "sc'ript" ))
    book.errors.on(:clas_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:clas_no => "scr&ipt" ))
    book.errors.on(:clas_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:clas_no => 'scr"ipt' ))
    book.errors.on(:clas_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:clas_no => "script>" ))
    book.errors.on(:clas_no).should_not == nil
  end

  it "should require year" do
    book = Book.create(@valid_attributes.merge(:year => nil))
    book.errors.on(:year).should_not == nil
  end


  it "should be numerical year" do
    book = Book.create(@valid_attributes.merge(:year => "none-numberic" ))
    book.year.to_i.should == 0
    book.errors.size.should == 1
  end

  it "should require pages" do
    book = Book.create(@valid_attributes.merge(:pages => nil))
    book.errors.on(:pages).should_not == nil
  end


  it "should be numerical pages" do
    book = Book.create(@valid_attributes.merge(:pages => "none-numberic" ))
    book.pages.to_i.should == 0
    book.errors.size.should == 1
  end

  it "should require volume" do
    book = Book.create(@valid_attributes.merge(:volume => nil))
    book.errors.on(:volume).should_not == nil
  end

  it 'should not match volume' do
    book = Book.create(@valid_attributes.merge(:volume => "<script" ))
    book.errors.on(:volume).should_not == nil
    book = Book.create(@valid_attributes.merge(:volume => "sc'ript" ))
    book.errors.on(:volume).should_not == nil
    book = Book.create(@valid_attributes.merge(:volume => "scr&ipt" ))
    book.errors.on(:volume).should_not == nil
    book = Book.create(@valid_attributes.merge(:volume => 'scr"ipt' ))
    book.errors.on(:volume).should_not == nil
    book = Book.create(@valid_attributes.merge(:volume => "script>" ))
    book.errors.on(:volume).should_not == nil
  end

  it "should require source" do
    book = Book.create(@valid_attributes.merge(:source => nil))
    book.errors.on(:source).should_not == nil
  end

  it 'should not match source' do
    book = Book.create(@valid_attributes.merge(:source => "<script" ))
    book.errors.on(:source).should_not == nil
    book = Book.create(@valid_attributes.merge(:source => "sc'ript" ))
    book.errors.on(:source).should_not == nil
    book = Book.create(@valid_attributes.merge(:source => "scr&ipt" ))
    book.errors.on(:source).should_not == nil
    book = Book.create(@valid_attributes.merge(:source => 'scr"ipt' ))
    book.errors.on(:source).should_not == nil
    book = Book.create(@valid_attributes.merge(:source => "script>" ))
    book.errors.on(:source).should_not == nil
  end

  it "should require cost" do
    book = Book.create(@valid_attributes.merge(:cost => nil))
    book.errors.on(:cost).should_not == nil
  end

  it 'should not match cost' do
    book = Book.create(@valid_attributes.merge(:cost => "<script" ))
    book.errors.on(:cost).should_not == nil
    book = Book.create(@valid_attributes.merge(:cost => "sc'ript" ))
    book.errors.on(:cost).should_not == nil
    book = Book.create(@valid_attributes.merge(:cost => "scr&ipt" ))
    book.errors.on(:cost).should_not == nil
    book = Book.create(@valid_attributes.merge(:cost => 'scr"ipt' ))
    book.errors.on(:cost).should_not == nil
    book = Book.create(@valid_attributes.merge(:cost => "script>" ))
    book.errors.on(:cost).should_not == nil
  end

  it "should require bill_no" do
    book = Book.create(@valid_attributes.merge(:bill_no => nil))
    book.errors.on(:bill_no).should_not == nil
  end

  it 'should not match bill_no' do
    book = Book.create(@valid_attributes.merge(:bill_no => "<script" ))
    book.errors.on(:bill_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:bill_no => "sc'ript" ))
    book.errors.on(:bill_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:bill_no => "scr&ipt" ))
    book.errors.on(:bill_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:bill_no => 'scr"ipt' ))
    book.errors.on(:bill_no).should_not == nil
    book = Book.create(@valid_attributes.merge(:bill_no => "script>" ))
    book.errors.on(:bill_no).should_not == nil
  end

  it "should require isbn" do
    book = Book.create(@valid_attributes.merge(:isbn => nil))
    book.errors.on(:isbn).should_not == nil
  end

  it 'should not match isbn' do
    book = Book.create(@valid_attributes.merge(:isbn => "<script" ))
    book.errors.on(:isbn).should_not == nil
    book = Book.create(@valid_attributes.merge(:isbn => "sc'ript" ))
    book.errors.on(:isbn).should_not == nil
    book = Book.create(@valid_attributes.merge(:isbn => "scr&ipt" ))
    book.errors.on(:isbn).should_not == nil
    book = Book.create(@valid_attributes.merge(:isbn => 'scr"ipt' ))
    book.errors.on(:isbn).should_not == nil
    book = Book.create(@valid_attributes.merge(:isbn => "script>" ))
    book.errors.on(:isbn).should_not == nil
  end

  it "should require keywords" do
    book = Book.create(@valid_attributes.merge(:keywords => nil))
    book.errors.on(:keywords).should_not == nil
  end

  it 'should not match keywords' do
    book = Book.create(@valid_attributes.merge(:keywords => "<script" ))
    book.errors.on(:keywords).should_not == nil
    book = Book.create(@valid_attributes.merge(:keywords => "sc'ript" ))
    book.errors.on(:keywords).should_not == nil
    book = Book.create(@valid_attributes.merge(:keywords => "scr&ipt" ))
    book.errors.on(:keywords).should_not == nil
    book = Book.create(@valid_attributes.merge(:keywords => 'scr"ipt' ))
    book.errors.on(:keywords).should_not == nil
    book = Book.create(@valid_attributes.merge(:keywords => "script>" ))
    book.errors.on(:keywords).should_not == nil
  end

  it "should require remarks" do
    book = Book.create(@valid_attributes.merge(:remarks => nil))
    book.errors.on(:remarks).should_not == nil
  end

  it 'should not match remarks' do
    book = Book.create(@valid_attributes.merge(:remarks => "<script" ))
    book.errors.on(:remarks).should_not == nil
    book = Book.create(@valid_attributes.merge(:remarks => "sc'ript" ))
    book.errors.on(:remarks).should_not == nil
    book = Book.create(@valid_attributes.merge(:remarks => "scr&ipt" ))
    book.errors.on(:remarks).should_not == nil
    book = Book.create(@valid_attributes.merge(:remarks => 'scr"ipt' ))
    book.errors.on(:remarks).should_not == nil
    book = Book.create(@valid_attributes.merge(:remarks => "script>" ))
    book.errors.on(:remarks).should_not == nil
  end

end
