# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sport_id    :integer
#  player_id   :integer
#

class Team < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :sport_id

  belongs_to :sport
end
