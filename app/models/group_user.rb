class GroupUser < Ixtlan::Models::GroupUser
  
  dn_prefix { |group_user| "cn=#{group_user.group.name}" }
  
  treebase "ou=groups"
  
  multivalue_field :memberuid
  
  ldap_properties do |group_user|
    {:cn=>"#{group_user.group.name}",  :objectclass => "posixGroup"}
  end

  def self.repository(name = nil, &block)
    super(:ldap, &block)
  end
end
