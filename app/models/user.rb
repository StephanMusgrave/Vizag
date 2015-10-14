class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :first_name, presence: true

  def full_name
    if last_name?
      first_name + ' ' + last_name
    else
      first_name
    end
  end

  def has_manager?
    has_manager
  end

end
