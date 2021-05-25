class Magazine < ActiveRecord::Base
  has_many :subscriptions #give us an instance method same as def subscriptions
  has_many :readers, through: :subscriptions #give us an instance method same as def readers

  # def subscriptions
  #   Subscription.select do |subscription|
  #     subscription.magazine_id == self.id
  #   end
  # end 

  # def readers
  #   self.subscriptions.map do |reader|
  #     reader.reader_id
  #   end 
  # end

  def email_list
    self.readers.map do |reader_instance|
      reader_instance.email
    end.join(";")
  end

  def self.most_popular
    Magazine.all.map do |magazine|
      magazine.subscriptions.size
    end.max

    #Approch 2
    # Magazine.all.max_by do |magazine|
    #   magazine.subscriptions.length
    
    # end
  end
end