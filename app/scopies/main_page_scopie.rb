class MainPageScopie < ScopieRails::Base

  has_scope :page, default: 1
  has_scope :per, default: 30

end
