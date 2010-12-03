class GroupSet

  MAP = {
    :manager => [:dip, :video, :audio, :plugdev, :scanner, :admin, :cdrom, :adm, :lpadmin, :powerdev, :dialout],
    :guests => [:audio, :cdrom, :video, :plugdev],
    :teachers => [:audio, :cdrom, :video, :plugdev, :scanner],
    :students => [:audio, :cdrom, :video, :plugdev],
    :office => [:audio, :cdrom, :video, :plugdev, :scanner]
  }

  def self.all_names
    MAP.keys
  end

  def self.all_groups
    MAP.keys.collect do |key|
      Group.first(:name => key)
    end.select do |g|
      g
    end
  end

  def self.all
    MAP.keys.collect do |key|
      get(key)
    end
  end

  def self.hidden_groups
    MAP.values.flatten.uniq.collect{|g| g.to_s}.sort
  end

  def self.get(key)
    GroupSet.new(key, MAP[key.to_sym]) if key
  end

  attr_reader :id, :name

  def initialize(name, group_names = [])
    @name = name
    @id = Group.first(:name => name).id
    @group_names = group_names
  end
  
  def groups
    @group_names.collect do |name|
      Group.first(:name => name)
    end.select { |g| g }
  end
end
