class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    first_name = self.first_name
    last_name = self.last_name
    "#{first_name} #{last_name}"
  end

  def list_roles
    own_roles = Character.all.select{|character| character.actor_id == self.id}
    own_roles.map {|character| "#{character.name} - #{character.show.name}"}
  end

end