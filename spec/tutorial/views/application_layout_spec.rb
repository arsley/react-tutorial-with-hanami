require "spec_helper"

describe Tutorial::Views::ApplicationLayout do
  let(:layout)   { Tutorial::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/tutorial/templates/application.html.erb') }

  it 'contains application name' do
    rendered.must_include('Tutorial')
  end
end
