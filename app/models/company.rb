class Company < ActiveRecord::Base
    has_many :freebies

    def devs
        newArray = []
        self.freebies.each do |freebie|
            newArray.push(freebie.dev)
        end
        newArray
    end

    def give_freebie(dev, item_name, value)
        newFreeb = Freebie.create(company_id: self.id, item_name: item_name, value: value)
        dev.freebies.push(newFreeb)
    end

    def self.oldest_company
        self.minimum(:founding_year)
    end
end
