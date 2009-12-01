require 'spec_helper'

describe "/books/index.html.erb" do
  include BooksHelper

  before(:each) do
    assigns[:books] = [
      stub_model(Book,
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
      ),
      stub_model(Book,
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
    ]
  end

  it "renders a list of books" do
    render
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for author".to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for edition".to_s, 2)
    response.should have_tag("tr>td", "value for place_publisher".to_s, 2)
    response.should have_tag("tr>td", "value for status".to_s, 2)
    response.should have_tag("tr>td", "value for clas_no".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for volume".to_s, 2)
    response.should have_tag("tr>td", "value for source".to_s, 2)
    response.should have_tag("tr>td", "value for cost".to_s, 2)
    response.should have_tag("tr>td", "value for bill_no".to_s, 2)
    response.should have_tag("tr>td", "value for isbn".to_s, 2)
    response.should have_tag("tr>td", "value for keywords".to_s, 2)
    response.should have_tag("tr>td", "value for remarks".to_s, 2)
  end
end
