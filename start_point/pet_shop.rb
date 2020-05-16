require ('pry')

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
    pet_shop[:admin][:pets_sold] += number_of_new_pet_sales
end

def stock_count(pet_shop)
    return pet_shop[:pets].length
end  

def pets_by_breed(pet_shop, breed)
    same_breed = []

    for pet in pet_shop[:pets]
        same_breed << pet if pet[:breed] == breed
    end

    return same_breed
end

def find_pet_by_name(pet_shop, name)

    for pet in pet_shop[:pets]
        return pet if pet[:name] == name
    end

    return nil
end

def remove_pet_by_name(pet_shop, name)
    pet = find_pet_by_name(pet_shop, name)
    pet_shop[:pets].delete(pet)
end

def add_pet_to_stock(pet_shop, new_pet)
    pet_shop[:pets].push(new_pet)
    return pet_shop[:pets].length
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

def add_pet_to_customer(customer, pet)
    return customer[:pets].push(pet).length
end

def customer_can_afford_pet(customer, pet)
    return customer[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)

    if pet && customer_can_afford_pet(customer, pet)
        
        add_pet_to_customer(customer, pet)
        increase_pets_sold(pet_shop, 1)
        remove_customer_cash(customer, pet[:price])
        add_or_remove_cash(pet_shop, pet[:price])
        remove_pet_by_name(pet_shop, pet)
    end
    
end



