require 'action_controller/streaming'
class BillsController < ApplicationController

  MONTHS = ["Jan","Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug" ,"Sep", "Oct", "Nov", "Dec"]

  cache_headers :private

  # GET /bills
  def index
    if request.path =~ /\/$/
      @dir = params[:dir] if params[:dir]
      path = File.join(Configuration.instance.bills_directory, current_user.login)
      path = File.join(path, @dir) if @dir
      if File.exists?(path) && File.directory?(path)
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
      else
        render :text => "no files for #{current_user.login}"
      end
    else
      redirect_to request.env['REQUEST_URI'] + "/"
    end
  end

  # GET /bills/file
  # GET /bills/1.xml
  def show
    dir = params[:dir] if params[:dir]
    filename = if params[:ext]
                 params[:file] + "." + params[:ext]
               else
                 params[:file]
               end
    path = File.join(Configuration.instance.bills_directory, current_user.login)
    path = dir ? File.join(path, dir, filename) : File.join(path, filename)
    if File.exists?(path)
      send_file(path)
    else
      render :text => "file not found #{path}"
    end
  end
end
