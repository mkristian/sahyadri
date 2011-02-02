require 'action_controller/streaming'
class BillsController < ApplicationController

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
          file = File.join(file, "") if File.directory?(f)
          file
        end
      else
        render :text => "no files for #{current_user.login}"
      end
    else
      redirect_to request.path + "/"
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
