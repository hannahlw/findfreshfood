class CreateFreshfoods < ActiveRecord::Migration
  def change
    create_table :freshfoods do |t|

      t.timestamps null: false
    end
  end
end
