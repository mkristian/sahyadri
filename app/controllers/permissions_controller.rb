class PermissionsController < ApplicationController

  def index
     render :xml => Ixtlan::Guard.export_xml
  end

end
