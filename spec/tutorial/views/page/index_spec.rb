require_relative '../../../spec_helper'

describe Tutorial::Views::Page::Index do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/tutorial/templates/page/index.html.erb') }
  let(:view)      { Tutorial::Views::Page::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
