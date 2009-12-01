require 'spec_helper'

describe "/books/show.html.erb" do
  include BooksHelper
  before(:each) do
    assigns[:book] = @book = stub_model(Book,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ author/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ edition/)
    response.should have_text(/value\ for\ place_publisher/)
    response.should have_text(/value\ for\ status/)
    response.should have_text(/value\ for\ clas_no/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ volume/)
    response.should have_text(/value\ for\ source/)
    response.should have_text(/value\ for\ cost/)
    response.should have_text(/value\ for\ bill_no/)
    response.should have_text(/value\ for\ isbn/)
    response.should have_text(/value\ for\ keywords/)
    response.should have_text(/value\ for\ remarks/)
  end
end
