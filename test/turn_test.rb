require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
# to test a correct guess
  def test_card_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end

  def test_turn_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_if_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_if_correct_is_working
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    @guess == card.answer

    assert_equal true, turn.correct?
  end

  def test_if_feedback_is_working
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    @guess == card.answer

    assert_equal "Correct!", turn.feedback
  end

#to test an incorrect guess
  def test_card_exists_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_instance_of Card, card
  end

  def test_turn_exists_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
  end

  def test_if_has_guess_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end

  def test_if_correct_is_working_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    @guess == card.answer

    assert_equal false, turn.correct?
  end

  def test_if_feedback_is_working_false
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    @guess == card.answer

    assert_equal "Incorrect.", turn.feedback
  end
end