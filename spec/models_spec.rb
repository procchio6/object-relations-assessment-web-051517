require "spec_helper"

describe Customer do
  @cust1 = Customer.new("Pat", "Rocchio")
  @cust2 = Customer.new("Another", "Customer")
  @cust3 = Customer.new("Pat", "Last")

  describe "all" do
    it "returns all customers" do
      expect(Customer.all.size).to eq(3)
    end
  end

  describe "find_by_name" do
    it "finds customer by full name" do
      customer = Customer.new("Test", "Customer")
      expect(Customer.find_by_name("Test Customer")).to eq(customer)
    end
  end

  describe "find_all_by_first_name" do
    it "finds all customers by first name" do
      customers = Customer.find_all_by_first_name("Pat")
      expect(customers.size).to eq(2)
    end
  end

  describe "all_names" do
    it "returns array of all customers names" do
      names = ["Pat Rocchio", "Another Customer", "Pat Last", "Test Customer"]
      expect(Customer.all_names).to eq(names)
    end
  end

  describe "#add_review" do
    it "adds a review for a restaurant" do
      customer = Customer.new("New", "Customer")
      restaurant = Restaurant.new("Burger Place")
      content = "This is a good place."
      review = customer.add_review(restaurant, content)
      expect(review.restaurant).to eq(restaurant)
      expect(review.customer).to eq(customer)
      expect(review.content).to eq(content)
    end
  end
end
