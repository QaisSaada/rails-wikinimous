# require_relative '../app/controllers/article_controller'


require 'rails_helper'

RSpec.describe Article, type: :model do

  before(:all) do
    @article = Article.create(title: "Like a Rolling Stone", content: "Bob Dylan and bla bla bla bla")
  end

  it 'checks that an article can be created' do
  expect(@article).to be_valid 
  end

  it 'checks that an article can be read' do
    expect(Article.show(@article)).to eq(@article)
  end

  it 'checks that an article can be updated' do
    @article.update(:title => "Like a Rolling Stone - The new addition")
    expect(Article.show("Like a Rolling Stone - The new addition")).to eq(@article)
  end

  it 'checks that a song can be destroyed' do
    @article.destroy
    expect(Article.find_by(title: "Like a Rolling Stone")).to be_nil
end

end




=begin
RSpec.describe article_controller do
  describe '#index' do
    context '' do
      it '' do
        expect().to eq()
      end
    end
  end

end
=end
