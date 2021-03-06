require './test/test_helper'

class TransactionTest < ActiveSupport::TestCase

  def valid_params
    {
      first_name: "Mike",
      last_name: "Williams",
      credit_card_number: 4444888899996666,
      credit_card_expiration: 8833,
      zipcode: 45455
    }
  end

  test "it is invalid without attributes" do
    @transaction = Transaction.create()
    assert @transaction.invalid? 
  end

  test "it is valid with correct attributes" do
    @transaction = Transaction.create(valid_params)
    assert @transaction.valid?
  end

  test "it does not create a transaction when first name is empty" do
    invalid_params = valid_params.merge(first_name: "")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when last name is empty" do
    invalid_params = valid_params.merge(last_name: "")
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when credit card number is invalid" do
    invalid_params = valid_params.merge(credit_card_number: 546666)
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when credit card expiration is invalid" do
    invalid_params = valid_params.merge(credit_card_expiration: 24)
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end

  test "it does not create a transaction when zipcode is invalid" do
    invalid_params = valid_params.merge(zipcode: 559)
    transaction = Transaction.create(invalid_params)
    refute transaction.valid?
  end
end
