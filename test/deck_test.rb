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
    assert_respond_to(@deck, :cards)
  end

  def test_shuffle
    old = @deck.cards
    assert_nil(@deck.shuffle)
    refute_equal(old, @deck.cards)
  end

  def test_shuffle_1000_times
    1000.times do
      test_shuffle
    end
  end

  def test_draw_one_card
    expected_size = @deck.cards.size - 1
    dealt = @deck.deal_one_card

    assert_instance_of(Card, dealt)
    assert_equal(expected_size, @deck.cards.size)
  end

  def test_draw_one_card_deck_depletion
    deck_size = @deck.cards.size
    deck_size.times do
      test_draw_one_card
    end

    assert_nil(@deck.deal_one_card)
    assert_empty(@deck.cards)
  end

  def test_card_uniqueness_within_deck # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    expected = [
      # hearts
      Card.new(:hearts, :ace), Card.new(:hearts, :two), Card.new(:hearts, :three), Card.new(:hearts, :four),
      Card.new(:hearts, :five), Card.new(:hearts, :six), Card.new(:hearts, :seven), Card.new(:hearts, :eight),
      Card.new(:hearts, :nine), Card.new(:hearts, :ten), Card.new(:hearts, :jack), Card.new(:hearts, :queen),
      Card.new(:hearts, :king),

      # spades
      Card.new(:spades, :ace), Card.new(:spades, :two), Card.new(:spades, :three), Card.new(:spades, :four),
      Card.new(:spades, :five), Card.new(:spades, :six), Card.new(:spades, :seven), Card.new(:spades, :eight),
      Card.new(:spades, :nine), Card.new(:spades, :ten), Card.new(:spades, :jack), Card.new(:spades, :queen),
      Card.new(:spades, :king),

      # clubs
      Card.new(:clubs, :ace), Card.new(:clubs, :two), Card.new(:clubs, :three), Card.new(:clubs, :four),
      Card.new(:clubs, :five), Card.new(:clubs, :six), Card.new(:clubs, :seven), Card.new(:clubs, :eight),
      Card.new(:clubs, :nine), Card.new(:clubs, :ten), Card.new(:clubs, :jack), Card.new(:clubs, :queen),
      Card.new(:clubs, :king),

      # diamonds
      Card.new(:diamonds, :ace), Card.new(:diamonds, :two), Card.new(:diamonds, :three), Card.new(:diamonds, :four),
      Card.new(:diamonds, :five), Card.new(:diamonds, :six), Card.new(:diamonds, :seven), Card.new(:diamonds, :eight),
      Card.new(:diamonds, :nine), Card.new(:diamonds, :ten), Card.new(:diamonds, :jack), Card.new(:diamonds, :queen),
      Card.new(:diamonds, :king)
    ]

    actual = []
    actual << @deck.deal_one_card until @deck.cards.empty?
    assert_equal(expected.sort, actual.sort)
  end

  # We want to make sure we can't alter what's left in the deck _except_ for
  # when dealing a card.
  def test_card_list_duplicated
    list = @deck.cards
    refute_same(list, @deck.instance_variable_get(:@card_pool))
  end
end
