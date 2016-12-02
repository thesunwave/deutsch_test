require 'rails_helper'
require 'factories/numberplan'

RSpec.describe Numberplan, type: :model do
  subject { Factory.build :number }

  it { expect(subject).to be_valid }
end
