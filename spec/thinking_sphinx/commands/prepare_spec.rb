# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ThinkingSphinx::Commands::Prepare do
  let(:command)       { ThinkingSphinx::Commands::Prepare.new(
    configuration, {}, stream
  ) }
  let(:configuration) { double 'configuration',
    :indices_location => '/path/to/indices'
  }
  let(:stream)        { double :puts => nil }

  before :each do
    allow(FileUtils).to receive_messages :mkdir_p => true
  end

  it "creates the directory for the index files" do
    expect(FileUtils).to receive(:mkdir_p).with('/path/to/indices')

    command.call
  end
end
