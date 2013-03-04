class SetSettingsValues < ActiveRecord::Migration
  def up
    Setting.bitacora_on = true
    Setting.agenda_on = true
  end

  def down
  end
end
