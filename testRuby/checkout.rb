require "hash-zip"
require 'active_support'
require 'active_support/core_ext'

class Checkout
	private
		attr_accessor :pricing_rules, :items

	def calcDiscount
		discount = 0
		# 3 or more discount 1 per shirt
		discount += @items['TSHIRT'] >2 ? @items['TSHIRT']  : 0
		# 2x1 on Vouchers
		discount += @items['VOUCHER'] /2 * @pricing_rules['VOUCHER']['Price']
		return discount
	end

	public
		#using hashes due to their quick access speed
	def initialize(pricing_rules)
		@pricing_rules= pricing_rules
		@items= @pricing_rules.clone
		@items.each{|x,_| @items[x]= 0}
	end

	def scan(id)
		@items[id] += 1
	end

	def total
		#calculating the discount at this point makes our class safe for removing items
		#(seems like the most likely next step in implementation)
		discount = calcDiscount
		price = @pricing_rules.map{|k,v|[k,v['Price']]}.to_h.zip(@items).values.map{|x,y| x* y}.sum
		return  price-discount
	end

end



