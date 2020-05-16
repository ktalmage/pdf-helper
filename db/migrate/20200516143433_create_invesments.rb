class CreateInvesments < ActiveRecord::Migration[6.0]
  def change
    create_table :invesments do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.string :ein
      t.decimal :ordinary_income
      t.decimal :interest_income
      t.decimal :st_capital
      t.decimal :mt_capital
      t.decimal :lt_capital
    end
  end
end
