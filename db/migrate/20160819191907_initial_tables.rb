class InitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :real_name
      t.string :real_name_pron
      t.string :screen_name, null: false
      t.integer :entrance_year
      t.text :affiliation_outside

      t.timestamps
    end

    add_index :users, :real_name
    add_index :users, :real_name_pron
    add_index :users, :screen_name

    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.date :inauguration_date
      t.date :breakup_date
      t.text :breakup_reason

      t.timestamps
    end

    add_index :groups, :name

    create_table :group_users do |t|
      t.references :group, null: false
      t.references :user, null: false
      t.date :entrance_date, null: false
      t.date :withdrawal_date
      t.text :withdrawal_reason

      t.timestamps
    end

    add_index :group_users, [:group_id, :user_id, :entrance_date], unique: true

    create_table :charges do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.references :group, null: false
      t.integer :year
      t.text :description
      t.date :inauguration_date
      t.date :retirement_date
      t.text :retirement_reason

      t.timestamps
    end

    add_index :charges, [:name, :user_id, :group_id, :year], unique: true

    create_table :contact_tools do |t|
      t.string :name, null: false
      t.text :description
    end

    add_index :contact_tools, [:name], unique: true

    create_table :contacts do |t|
      t.references :user, null: false
      t.references :contact_tool, null: false
      t.string :data, null: false
      t.text :description
      t.text :expiration_date

      t.timestamps
    end

    add_index :contacts, [:user_id, :contact_tool_id, :data], unique: true
  end
end
