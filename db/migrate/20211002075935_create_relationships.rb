class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.follower_id :integer
      t.followed_id :integer

      t.timestamps
    end
  end
end
