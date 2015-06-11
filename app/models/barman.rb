class Barman < ActiveRecord::Base
    def up
        drop_tabel :barmans
    end
    
    def down
    raise ActiveRecord::IrreversibleMigration
    end
end
