require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/books/edit.html.erb" do
  include BooksHelper

  before(:each) do
    assigns[:book] = @book = stub_model(Book,
      :new_record? => false,
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
    )
  end

  it "renders the edit book form" do
    render

    response.should have_tag("form[action=#{book_path(@book.key)}][method=post]") do
      with_tag('input#book_date[name=?]', "book[date]")
      with_tag('input#book_author[name=?]', "book[author]")
      with_tag('input#book_title[name=?]', "book[title]")
      with_tag('input#book_edition[name=?]', "book[edition]")
      with_tag('input#book_place_publisher[name=?]', "book[place_publisher]")
      with_tag('input#book_status[name=?]', "book[status]")
      with_tag('input#book_clas_no[name=?]', "book[clas_no]")
      with_tag('input#book_year[name=?]', "book[year]")
      with_tag('input#book_pages[name=?]', "book[pages]")
      with_tag('input#book_volume[name=?]', "book[volume]")
      with_tag('input#book_source[name=?]', "book[source]")
      with_tag('input#book_cost[name=?]', "book[cost]")
      with_tag('input#book_bill_no[name=?]', "book[bill_no]")
      with_tag('input#book_isbn[name=?]', "book[isbn]")
      with_tag('input#book_keywords[name=?]', "book[keywords]")
      with_tag('textarea#book_remarks[name=?]', "book[remarks]")
    end
  end
end
