require_relative '../../../spec_helper'

describe Tutorial::Controllers::Page::Index do
  let(:action) { Tutorial::Controllers::Page::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
