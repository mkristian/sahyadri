class Book
  include DataMapper::Resource

  property :id, Serial

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
    attr = attributes
    attr.delete(:total)
    attr.delete(:created_at)
    attr.delete(:updated_at)
    attr.delete(:updated_by_id)

    val = attr.values.join(" ").strip
    attribute_set(:total, val)
  end

  timestamps :at

  modified_by "User"

  def date
    created_at.strftime("%d-%m-%Y") if created_at rescue created_at
  end

  alias :to_x :to_xml_document
  def to_xml_document(opts, doc = nil)
    opts.merge!({:methods => [:updated_by], :exclude => [:updated_by_id]})
    to_x(opts, doc)
  end

  def self.repository(name = nil, &block)
    super(:books, &block)
  end
end
