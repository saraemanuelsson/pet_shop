def pet_shop_name(pet_shop)
    return pet_shop[:name]
end

def total_cash(pet_shop)
    return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
    pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
    return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_new_pet_sales)
    total_pets_sold = pet_shop[:admin][:pets_sold] += number_of_new_pet_sales
    return total_pets_sold
end

def stock_count(pet_shop)
    
end