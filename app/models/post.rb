require 'active_model'

class Post
  

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations 
  
  validates :title, presence: true
  
  attr_accessor :blog, :title, :body, :image_url, :pubdate
  
  def initialize(attrs={})
    attrs.each do |k,v| send("#{k }=",v) end
  end
  
  def persisted?
    false  
  end
  
  def picture? 
    image_url.present?
  end
    
  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    @blog.add_entry(self)
  end

  
end