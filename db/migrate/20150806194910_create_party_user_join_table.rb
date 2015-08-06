class CreatePartyUserJoinTable < ActiveRecord::Migration
  def change
    create_join_table :parties, :users do |t|
      # t.index [:party_id, :user_id]
      # t.index [:user_id, :party_id]
    end
  end
end
