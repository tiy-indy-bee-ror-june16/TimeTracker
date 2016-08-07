class UpdateDefaultTimerValuetoZero < ActiveRecord::Migration[5.0]
  def change
    change_column :timers, :value, :decimal, default: 0
  end
end
