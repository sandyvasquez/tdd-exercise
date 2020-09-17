require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    # Arrange
    hand = [3, 4]
    # Act
    score = blackjack_score(hand)
    # Assert <-  You do this part!
    expect(score).must_equal 7

    # hand = [6,9]
    # score = blackjack_score(hand)
    # expect(score).must_equal 15
  end

  it 'facecards have values calculated correctly' do
    hand = ['Jack', 'Queen', 'King']
    score = blackjack_score(hand)
    expect(score).must_equal 30
  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = ['Ace', 10]
    # Act
    score = blackjack_score(hand)
    # Assert
    expect(score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Arrange
    hand = [10, 10, 'Ace']
    # Act
    score = blackjack_score(hand)
    # Assert
    expect(score).must_equal 21
  end

  it 'raises an ArgumentError for invalid cards' do
    # Arrange
    expect{
      blackjack_score(0,1)
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    expect{
      blackjack_score(9, 9, 9)
    }.must_raise ArgumentError
    end
  end

