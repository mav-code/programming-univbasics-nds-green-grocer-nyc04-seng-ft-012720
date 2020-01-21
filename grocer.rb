def find_item_by_name_in_collection(name, collection)
  collection.find {|x| x[:item] == name}
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  newcart = Array.new
  index = 0
  while cart.length > index do
    currentitem = cart[index][:item]
      if find_item_by_name_in_collection(currentitem, newcart) == nil
        newitem = cart[index].clone
        newitem[:count] = 1
        newcart << newitem
      else
        find_item_by_name_in_collection(currentitem, newcart)[:count] += 1
      end
    index += 1
  end
  return newcart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  index = 0
  while index < coupons.length
    currentcouponitem = coupons[index][:item]
    currentcouponamount = coupons[index][:num]
    discountedprice = coupons[index][:cost].fdiv(currentcouponamount)
    clearanceornot = find_item_by_name_in_collection(currentcouponitem, cart)[:clearance]
    itemincart = find_item_by_name_in_collection(currentcouponitem, cart)
    if itemincart[:count] >= coupons[index][:num]
      itemincart[:count] -= coupons[index][:num]
      cart << {:item => "#{currentcouponitem} W/COUPON", :price => discountedprice, :clearance => true, :count => currentcouponamount}
    end
    index += 1
  end
  return cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
