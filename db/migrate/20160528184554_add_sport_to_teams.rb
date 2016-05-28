class AddSportToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :sport, index: true, foreign_key: true
  end
end
