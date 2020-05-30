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

require 'code_challenge/card'

# Deck implements an arbitrary deck of cards give their description of suits
# and faces by the Card class.
class Deck
  def initialize
    pool = Card.suits.product(Card.faces)
    @card_pool = pool.map { |suit, face| Card.new(suit, face) }

    shuffle
  end

  def shuffle
    shuffled = []
    shuffled << @card_pool.delete_at(rand(@card_pool.size)) until @card_pool.empty?
    @card_pool = shuffled
    nil
  end

  def deal_one_card
    @card_pool.pop
  end

  def cards
    @card_pool.clone
  end
end
