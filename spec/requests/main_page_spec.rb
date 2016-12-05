require 'rails_helper'
require 'factories/numberplan'

describe 'Main page', type: :request do
  context 'when user is' do
    let!(:number_collection) do
      10.times do |i|
        Factory.create(:number, prefix: 200 + i)
      end
        Factory.create(:number, prefix: 433, comment: 'Wuppertal')
    end
    it 'finding by prefix' do
      get search_path, params: { query: 202 }
      expect(JSON.parse(response.body)['data'].size).to eq 1
      expect(JSON.parse(response.body)['data'][0]['prefix']).to eq 202
    end

    it 'finding by number' do
      get search_path, params: { query: 4902021234567 }
      expect(JSON.parse(response.body)['data'].size).to eq 1
      expect(JSON.parse(response.body)['data'][0]['prefix']).to eq 202
    end

    it 'finding by name' do
      get search_path, params: { query: 'Esse' }
      expect(JSON.parse(response.body)['data'].size).to eq 10
    end

    it 'finding by number and name' do
      get search_path, params: { query: '49-202-123-45-67 Wuppertal' }
      expect(JSON.parse(response.body)['data'].size).to eq 2
    end

    it 'finding by several numbers and name' do
      get search_path, params: { query: '49-202-123-45-67 203 204 4902011234567 Wuppertal' }
      expect(JSON.parse(response.body)['data'].size).to eq 5
    end
  end
end
