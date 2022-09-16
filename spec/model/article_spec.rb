# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    @article = Article.create(title: 'Like a Rolling Stone', content: 'Bob Dylan  bla bla bla bla')
  end

  it 'checks that an article can be created' do
    expect(@article).to be_valid
  end
end
