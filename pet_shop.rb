

def pet_shop_name(petshop)
  return petshop[:name]
end

def total_cash(petshop)
  return petshop[:admin][:total_cash]
end

def add_or_remove_cash(petshop,transaction)
  return petshop[:admin][:total_cash] += transaction
end

def pets_sold(petshop)
  return petshop[:admin][:pets_sold]
end

def increase_pets_sold(petshop,petsalenum)
  return petshop[:admin][:pets_sold] += petsalenum
end

def stock_count(petshop)
 return petshop[:pets].length
end

def pets_by_breed(petshop,search)
  result = []
  for pet in petshop[:pets]
    result.push(pet[:breed]) if (pet[:breed] == search)
  end
  return result
end

def find_pet_by_name(petshop,name)
  for pet in petshop[:pets]
    return pet if (pet[:name] == name)
  end
  return nil
end

def remove_pet_by_name(petshop,name)
  loopcounter = 0
  for pet in petshop[:pets]
    petshop[:pets].delete_at(loopcounter) if (pet[:name] == name)
    loopcounter += 1
  end
end

def add_pet_to_stock(petshop,newpet)
  petshop[:pets] << newpet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer,newpet)
  customer[:pets] << newpet
end

def customer_can_afford_pet(customer,newpet)
  customer[:cash] >= newpet[:price] ? (return true) : (return false)
end

def sell_pet_to_customer(petshop, newpet, customer)
  if newpet != nil && customer_can_afford_pet(customer,newpet) == true
    # customer_can_afford_pet(customer,newpet)
    remove_customer_cash(customer, newpet[:price])
    add_or_remove_cash(petshop, newpet[:price])
    remove_pet_by_name(petshop, newpet[:name])
    add_pet_to_customer(customer, newpet[:name])
    increase_pets_sold(petshop, 1)
  else
    return nil
  end
end
