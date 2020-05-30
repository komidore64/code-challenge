# frozen_string_literal: true

# code-challenge
# Copyright (C) 2020  M. Adam Price
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'test_helper'
require 'code_challenge/deck'

class DeckTest < MiniTest::Test
  def setup
    @deck = Deck.new
  end

  def teardown
    @deck = nil
  end

  def test_public_method_response
    assert_respond_to(@deck, :shuffle)
    assert_respond_to(@deck, :deal_one_card)
  end
end
