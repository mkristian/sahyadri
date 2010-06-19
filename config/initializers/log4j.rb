begin
  require 'java'
  begin
    org.apache.log4j.PropertyConfigurator.configure(File.dirname(__FILE__) + '/log4j.properties')
  rescue
    warn "no log4j so skip log4j config"
  end
rescue
  warn "no java so skip log4j config"
end
