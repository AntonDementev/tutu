class AddPassangerInTicket < ActiveRecord::Migration[5.0]
  def change
    add_column(:tickets, :passanger_name, :string)
    add_column(:tickets, :passport_data, :string)
  end
end
