class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :url, type: String
  field :completed, type: Boolean, default: FALSE
  field :order, type: Integer

end