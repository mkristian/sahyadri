class UsersController < ApplicationController
  include Ixtlan::Controllers::UsersController

  layout "sahyadri"

  alias :create_old :create
  alias :update_old :update

  def index
    @users = query(USER, :name)
    @size = @users.size
    @query = params[:query]
    @limit = params[:limit].to_i + 1
    @offset = params[:offset].to_i

    respond_to do |format|
      format.html do
        if @users.size == 1
          @user = @users[0]
          if allowed(:edit)
            render "edit"
          else
            render "show"
          end
        else
          render
        end
      end
      format.xml  { render :xml => @users }
    end
  end

  def create
    setup_groups
    create_old
  end

  def update
    setup_groups
    params[:user].delete(:login)
    update_old
  end

  def setup_groups
    if user = params[:user]
      user[:email] = if user[:login]
                       "#{user[:login]}@mail"
                     elsif params[:id]
                       "#{User.get(params[:id]).login}@mail"
                     end
      
      pgroup = Group.get(user.delete(:primary))
      if pgroup
        groups = GroupSet.get(pgroup.name).groups 
        groups << pgroup
      else
        groups = []
      end

      # add all selected groups
      (user.delete(:group_ids) || []).each do |gid|
        g = Group.get(gid)
        groups << g unless GroupSet.all_names.member? g.name
      end

      # setup params
      user[:primary] = pgroup.id.to_s if pgroup
      user[:groups] = groups.collect {|g| g.id}
    end
  end
end
