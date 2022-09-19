# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    it 'returns a 200 OK status' do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    it 'shows articles via id' do
      article = Article.create(title: 'An Article', content: 'text text text')

      get :show, params: { id: article.id }

      expect(response).to be_ok
    end
    it 'renders the show templet' do
      article = Article.create(title: 'An Article', content: 'text text text')

      get :show, params: { id: article.id }

      expect(response).to render_template('articles/show')
    end
  end
  it "assigns 'articles'" do
    article = Article.create(title: 'An Article', content: 'text text text')

    get :show, params: { id: article.id }

    expect(assigns(:article)).to eq(article)
  end

  describe '#new' do
    it 'works' do
      get :new

      expect(response).to be_ok
    end
    it 'renders the new templet' do
      get :new

      expect(response).to render_template('articles/new')
    end
  end
  it "assigns 'articles'" do
    article = Article.new
    allow(Article).to receive(:new).and_return(article)

    get :new, params: { id: article.id }

    expect(assigns(:article)).to eq(article)
  end

  describe '#create' do
    it 'works' do
      post :create, params: {article:{ title: 'article', content: 'text and more text' }}

      expect(response).to have_http_status(:found)
    end

    it 'redirects to Articles#show' do
      post :create, params: {article:{ title: 'article', content: 'text and more text' }}

      expect(response).to redirect_to(article_path(Article.last))
    end
    it 'creates a new Article from given parameters' do
      title   = 'new title'
      content = 'new info'

      post :create, params: {article:{title: 'new title', content: 'new info'}}

      expect(Article.last).to have_attributes(
        title:,
        content:
      )
    end
  end
end
