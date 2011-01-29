class Configuration
  include Ixtlan::Models::Configuration

  property :bills_directory, String, :required => true, :default => "bills"
end
