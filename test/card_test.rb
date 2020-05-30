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
require 'code_challenge/card'

class CardTest < MiniTest::Test
  def setup
    @card = Card.new(:hearts, :ace)
  end

  def teardown
    @card = nil
  end

  def test_creation_happy_path
    assert_instance_of(Card, @card)

    assert_equal(:hearts, @card.suit)
    assert_equal(:ace, @card.face)
  end

  def test_creation_bad_args
    suit = :coffee
    face = :thirteen
    error = assert_raises(RuntimeError) { Card.new(:coffee, :thirteen) }
    assert_equal("Incorrect card arguments [ suit: #{suit}, face: #{face} ]", error.message)
  end

  def test_for_uncallables
    # we only want to set these via constructor
    refute_respond_to(@card, :suit=)
    refute_respond_to(@card, :face=)

    # these should only be class methods
    refute_respond_to(@card, :suits)
    refute_respond_to(@card, :faces)
  end

  def test_class_methods
    assert_respond_to(Card, :suits)
    assert_respond_to(Card, :faces)
  end

  def test_string_representation
    assert_equal('ace of hearts', @card.to_s)
  end

  def test_compare_equal
    assert_equal(Card.new(:hearts, :ace), @card)
  end

  def test_compare_unequal
    refute_equal(%w[foo bar], @card) # mismatched class
    refute_equal(Card.new(:spades, :ace), @card) # mismatched suit
    refute_equal(Card.new(:hearts, :four), @card) # mismatched face
  end
end
