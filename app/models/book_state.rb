class BookState
  include DataMapper::Resource

  property :book_id, Integer, :key => true #:lazy => false # lazy is needed :(

  belongs_to :issued_by, "User", :required => false

  property :issued_at, DateTime, :required => false
 
  belongs_to :reserved_by, "User", :required => false
  
  property :reserved_at, DateTime, :required => false

  belongs_to :book
  
  def issue_by(user)
    if self.reserved_by.nil? || self.reserved_by == user
      self.reserved_by = nil
      self.reserved_at = nil
      self.issued_at = DateTime.now
      self.issued_by = user
      self.issued_by_id = user.id
    end
  end

  def reserve_by(user)
    if user.nil? || reserved_by.nil?
      reserved_by = user
      reserved_at = user.nil? ? nil : DateTime.now
    end
  end

  def destroy?
    reserved_by.nil? && issued_by.nil?
  end

  def self.repository(name = nil, &block)
    super(:default, &block)
  end

  if protected_instance_methods.find {|m| m == 'to_x'}.nil?
    
    protected
    
    alias :to_x :to_xml_document
    def to_xml_document(opts, doc = nil)
      opts.merge!({:methods => [:updated_by], :exclude => [:updated_by_id]})
      to_x(opts, doc)
    end
  end

end
