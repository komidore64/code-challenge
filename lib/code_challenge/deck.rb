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

# Deck implements a 52 card poker-style deck of cards.
class Deck
  def initialize
    # 1. build our card pool
    # 2. randomly rearrange the card pool
    # 3. cache the card pool
  end

  def shuffle; end

  def deal_one_card; end
end
