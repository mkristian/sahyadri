class Book
  include DataMapper::Resource

  property :id, Serial

  property :old_id, Integer, :nullable => true

  property :author, String, :nullable => true, :format => /^[^<">]*$/, :length => 64

  property :title, String, :nullable => false, :format => /^[^<>]*$/, :length => 192

  property :edition, String, :nullable => true, :format => /^[^<'">]*$/, :length => 64

  property :place_publisher, String, :nullable => true, :format => /^[^">]*$/, :length => 64

  property :status, String, :nullable => true, :format => /^[^<'&">]*$/, :length => 16

  property :clas_no, String, :nullable => true, :format => /^[^<&">]*$/, :length => 32

  property :year, Integer, :nullable => false 

  property :pages, String, :nullable => true, :format => /^[^<'">]*$/, :length => 48

  property :volume, String, :nullable => true, :format => /^[^<'">]*$/, :length => 16

  property :source, String, :nullable => true, :format => /^[^<">]*$/, :length => 64

  property :cost, String, :nullable => true, :format => /^[^<'">]*$/, :length => 64

  property :bill_no, String, :nullable => true, :format => /^[^<'">]*$/, :length => 64

  property :isbn, String, :nullable => true, :format => /^[^<'">]*$/, :length => 32

  property :keywords, String, :nullable => true, :format => /^[^<">]*$/, :length => 128

  property :remarks, Text, :nullable => true, :format => /^[^<">]*$/

  property :total, Text, :nullable => false, :format => /^[^<">]*$/

  before :valid? do
    val = attributes.values.join(" ").strip
    attribute_set(:total, val)
  end

  timestamps :on

  modified_by "User"

  def date
    created_on
  end

  def self.repository(name = nil, &block)
    super(:books, &block)
  end
end
