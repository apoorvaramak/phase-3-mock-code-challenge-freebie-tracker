class Dev < ActiveRecord::Base
    has_many :freebies

    def companies
        newArray = []
        self.freebies.each do |freebie|
            newArray.push(freebie.company)
        end
        newArray
    end

    def received_one?(item_name)
        self.freebies.each do |freebie|
            if(freebie.item_name == item_name)
                true
            end
        end
        false
    end

    def give_away(dev, freebie)
        self.freebies.each do |aFreebie|
            if aFreebie.id == freebie.id
                self.freebies.delete(aFreebie)
                dev.freebies.push(aFreebie)
                "Here take it"
            else
                "Not your freebie"
            end
        end
    end

end
