class Subscription < ActiveRecord::Base
    belongs_to :magazine #give us instance method like def magazien
    belongs_to :reader #give us instance method like def reader

    # def reader
    #     Reader.select do |reader|
    #         reader.id == self.reader_id
    #     end
    # end

    # def magazine
    #     Magazine.select do |magazine|
    #         magazine.id == self.magazine_id
    #     end
    # end

    def print_details
        puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
    end
end