class AddUserToPdfs < ActiveRecord::Migration[6.0]
  def change
    add_column :pdfs, :user_id, :integer
  end
end
