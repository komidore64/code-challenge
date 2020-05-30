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
require 'code_challenge/err/incorrect_card_arguments_error'

# Represents a poker-style playing card.
class Card
  SUITS = %i[
    hearts
    spades
    clubs
    diamonds
  ].freeze

  FACES = %i[
    ace
    one
    two
    three
    four
    five
    six
    seven
    eight
    nine
    ten
    jack
    queen
    king
  ].freeze

  class << self
    def suits
      SUITS
    end

    def faces
      FACES
    end
  end

  attr_reader :suit, :face

  def initialize(suit, face)
    raise IncorrectCardArgumentsError unless Card.suits.include?(suit) && Card.faces.include?(face)

    @suit = suit
    @face = face
  end

  def to_s
    "#{@face} of #{@suit}"
  end

  def inspect
    to_s
  end

  def ==(other)
    return false unless other.instance_of?(Card)

    @suit == other.suit && @face == other.face
  end
end
