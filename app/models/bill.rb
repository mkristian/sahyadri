class Bill

  attr_reader :dir, :files

  def self.bill_path(current_user, dir = nil)
    path = File.join(Configuration.instance.bills_directory, current_user.login)
    path = File.join(path, dir) if dir
    path if File.exists?(path) && File.directory?(path)
  end

  def initialize(current_user, dir = nil)
    @dir = dir
    if path = self.class.bill_path(current_user, dir)
      @files = Dir[File.join(path, "**")].collect do |f|
        file = File.basename(f)
        if File.directory?(f)
          file = File.join(file, "")
          def file.to_display
            m = MONTHS[to_s.sub(/.*_/, '').to_i - 1]
            "#{m} #{to_s.sub(/_.*/, '')}"
          end
        else
          def file.to_display
            to_s
          end
        end
        file
      end
      @files.sort!
    end
  end

end
