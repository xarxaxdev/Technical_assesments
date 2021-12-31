require_relative "checkout"
require "json"

rules_file = File.read('products.json')


pricing_rules = JSON.parse(rules_file)

co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total
puts price


co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("MUG")
co.scan("TSHIRT")
price = co.total
puts price


co = Checkout.new(pricing_rules)
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total
puts price


co = Checkout.new(pricing_rules)
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("MUG")
price = co.total
puts price
