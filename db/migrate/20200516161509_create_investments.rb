class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.string :name
      t.string :ein
      t.decimal :ordinary_income
      t.decimal :interest_income
      t.decimal :st_capital
      t.decimal :mt_capital
      t.decimal :lt_capital
      t.belongs_to :user, foreign_key: true
      t.belongs_to :client, foreign_key: true
    end
  end
end
