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

  include Comparable

  attr_reader :suit, :face

  def initialize(suit, face)
    unless Card::SUITS.include?(suit) && Card::FACES.include?(face)
      raise "Incorrect card arguments [ suit: #{suit}, face: #{face} ]"
    end

    @suit = suit
    @face = face
  end

  def to_s
    "#{@face} of #{@suit}"
  end

  def inspect
    "<Card: #{self}>"
  end

  def <=>(other)
    return nil unless other.instance_of?(Card)

    comp = @suit <=> other.suit
    return comp unless comp.zero?

    @face <=> other.face
  end
end
