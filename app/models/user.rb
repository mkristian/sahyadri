load 'group.rb'
class User

  LDAP = true

  include Ixtlan::Models::User

  property :primary, Integer, :required => true, :field => "gidnumber", :message => "Please select a primary group"

  def primary_group
    Group.get!(attribute_get(:primary))
  end

  def primary_group=(g)
    attribute_set(:primary, g.id) if g
  end

  dn_prefix { |user| "uid=#{user.login}"}

  treebase "ou=people"

  ldap_properties do |user|
    properties = { 
      :objectclass => ["inetOrgPerson", "posixAccount", "shadowAccount"], 
      :loginshell => "/bin/bash"
    }
    properties[:sn] = "#{user.name.sub(/.*\ /, "")}"
    properties[:givenname] = "#{user.name.sub(/\ .*/, "")}"
    properties[:homedirectory] = "/home/#{user.login}"
    properties
  end

  def group_ids
    groups.collect { |g| g.id }
  end

  def self.repository(name = nil, &block)
    super(:ldap, &block)
  end

  def self.authenticate(login, pwd)
    if login
      u = first(:login => login)
      if u
        if u.authenticate(pwd)
          u
        else
          "wrong password"
        end
      else
        "unknown login"
      end
    else
      "no login"
    end
  end
end
