class Group

  LDAP = true

  include Ixtlan::Models::Group

  dn_prefix { |group| "cn=#{group.name}" }
  
  treebase "ou=groups"
  
  ldap_properties {{:objectclass => "posixGroup"}}

  def self.repository(name = nil, &block)
    super(:ldap, &block)
  end

  def self.visible_groups
    hidden = GroupSet.hidden_groups
    all.select do |g|
      !hidden.member?(g.name) && !GroupSet.all_names.member?(g.name.to_sym)
    end
  end

  # sahyadri uses 'manager' as superuser role
  def root?
    attribute_get(:name) == 'manager'
  end
end
