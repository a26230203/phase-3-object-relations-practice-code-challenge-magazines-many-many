class Reader < ActiveRecord::Base
    has_many :subscriptions #give us an instance method same as def subscriptions
    has_many :magazine, through: :subscriptions #give us an instance method same as def magazines

    # def subscriptions
    #     Subscription.select do |subscription|
    #       subscription.reader_id == self.id
    #     end
    #   end 
    
    #   def magazines
    #     self.subscriptions.map do |magazine|
    #         magazine.magazine_id
    #     end 
    #   end

      def subscribe(magazine, price)
        Subscription.create(reader_id: self.id, magazine_id: magazine.id, price: price )
      end

      def total_subcription_price
          self.subscriptions.sum(:price)
      end
      
      def cancel_subscription(magazine)
        sub = Subscription.find_by(magazine_id: magazine.id, reader_id: self.id)
        if sub
        sub.destroy
        end
      end
end