require 'minitest/autorun'
require 'minitest/spec'

require_relative '../lib/dashed_map'

describe 'dashed_map' do
  it 'properly dashes Hamlet' do
    soliloquy = [
      %w[To be, or not to be--that is the question:],
      %w[Whether 'tis nobler in the mind to suffer],
      %w[The slings and arrows of outrageous fortune],
      %w[Or to take arms against a sea of troubles],
      %w[And by opposing end them.]
    ]
    soliloquy.map do |line|
      line.dashed_map(line)
    end.flatten.tap do |dash_mapped|
      dash_mapped.must_include "is-the"
      dash_mapped.must_include "the-mind"
      dash_mapped.must_include "of-outrageous"
      dash_mapped.must_include "sea-of"

      dash_mapped.wont_include "Rosencrantz"
      dash_mapped.wont_include "Guildenstern"
    end
  end
end
