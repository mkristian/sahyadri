require 'action_controller/streaming'
class BillsController < ApplicationController

  cache_headers :private

  # GET /bills
  def index
    path = File.join(Rails.root, Configuration.instance.bills_directory, current_user.login)
    if File.exists?(path) && File.directory?(path)
      @files = Dir["#{path}/**"].collect { |f| File.basename(f) }
    else
      render :text => "no files for #{current_user.login}"
    end
  end

  # GET /bills/file
  # GET /bills/1.xml
  def show
    filename = if params[:ext]
                 params[:file] + "." + params[:ext]
               else
                 params[:file]
               end
    path = File.join(Rails.root, 'bills', current_user.login, filename)
    if File.exists?(path)
      send_file(path)
    else
      render :text => "file not found #{path}"
    end
  end
end
