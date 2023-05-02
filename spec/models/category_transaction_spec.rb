require 'spec_helper'

RSpec.describe CategoryTransaction, type: :model do
  it { should belong_to(:category) }
end
