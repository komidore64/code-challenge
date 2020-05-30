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

require 'minitest/autorun'
require 'code_challenge/card'

class CardTest < MiniTest::Test
  def setup
    @card = Card.new(:hearts, :ace)
  end

  def teardown
    @card = nil
  end

  def test_class_method_suits
    expected = %i[hearts spades clubs diamonds]
    assert_equal(expected, Card.suits)
  end

  def test_class_method_faces
    expected = %i[
      ace two three four five six seven
      eight nine ten jack queen king
    ]
    assert_equal(expected, Card.faces)
  end

  def test_creation_bad_args
    suit = :coffee
    face = :thirteen
    error = assert_raises(RuntimeError) { Card.new(suit, face) }
    assert_equal("Incorrect card arguments [ suit: #{suit}, face: #{face} ]", error.message)
  end

  def test_suit
    assert_equal(:hearts, @card.suit)
  end

  def test_face
    assert_equal(:ace, @card.face)
  end

  def test_to_s
    assert_equal('ace of hearts', @card.to_s)
  end

  def test_inspect
    assert_equal('<Card: ace of hearts>', @card.inspect)
  end

  def test_equal
    assert_equal(Card.new(:hearts, :ace), @card)
  end

  def test_unequal
    refute_equal(Array, @card) # mismatched class
    refute_equal(Card.new(:spades, :ace), @card) # mismatched suit
    refute_equal(Card.new(:hearts, :four), @card) # mismatched face
  end
end
