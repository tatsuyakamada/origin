class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :expired_at, :datetime, null: true
  end

  def down
    change_column :articles, :expired_at, :datetime, null: false
  end

end
