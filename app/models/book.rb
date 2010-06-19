class Book
  include DataMapper::Resource

  property :id, Serial

  property :author, String, :required => false, :format => /^[^<">]*$/, :length => 64

  property :title, String, :required => true, :format => /^[^<>]*$/, :length => 192

  property :edition, String, :required => false, :format => /^[^<'">]*$/, :length => 64

  property :place_publisher, String, :required => false, :format => /^[^">]*$/, :length => 64

  property :status, String, :required => false, :format => /^[^<'&">]*$/, :length => 16

  property :clas_no, String, :required => false, :format => /^[^<&">]*$/, :length => 32

  property :year, Integer, :required => true 

  property :pages, String, :required => false, :format => /^[^<'">]*$/, :length => 48

  property :volume, String, :required => false, :format => /^[^<'">]*$/, :length => 16

  property :source, String, :required => false, :format => /^[^<">]*$/, :length => 64

  property :cost, String, :required => false, :format => /^[^<'">]*$/, :length => 64

  property :bill_no, String, :required => false, :format => /^[^<'">]*$/, :length => 64

  property :isbn, String, :required => false, :format => /^[^<'">]*$/, :length => 32

  property :keywords, String, :required => false, :format => /^[^<">]*$/, :length => 128

  property :remarks, Text, :required => false, :format => /^[^<">]*$/

  property :total, Text, :required => true, :format => /^[^<">]*$/

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

  modified_by "User", nil, { :repository => :default}

  def date
    created_at.strftime("%d-%m-%Y") if created_at rescue created_at
  end

  if protected_instance_methods.find {|m| m == 'to_x'}.nil?
    
    protected
    
    alias :to_x :to_xml_document
    def to_xml_document(opts, doc = nil)
      opts.merge!({:methods => [:updated_by], :exclude => [:updated_by_id]})
      to_x(opts, doc)
    end
  end

  def self.repository(name = nil, &block)
    super(:books, &block)
  end
end
