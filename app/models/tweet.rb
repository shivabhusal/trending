# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  text       :string
#  tweeted_at :datetime
#  metadata   :jsonb
#  address    :string
#  lat        :string
#  long       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
 
end
