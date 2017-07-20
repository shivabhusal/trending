# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  provider               :string
#  uid                    :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter facebook]

  class << self
    def from_omniauth_twitter(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        # Since twitter does not provide us email address in response
        user.email       = "#{auth.info.nickname}@trending.io"
        user.password    = Devise.friendly_token[0, 20]
        user.first_name  = auth.info.first_name
        user.last_name   = auth.info.last_name
      end
    end

    def from_omniauth_facebook(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.first_name  = auth.info.first_name
        user.last_name   = auth.info.last_name
      end
    end
  end
end
