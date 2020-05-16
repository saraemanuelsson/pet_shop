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

# def find_pet_by_name(pet_shop, name)
#     pets_found = []

#     for pet in pet_shop[:pets]
#         pets_found << pet if pet[:name] == name
#         return pets_found
#     end

#     return nil if pets_found.length == 0
# end

# Working! V
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

def customer_cash(customers)
    return customers[:cash]
end

def remove_customer_cash(customers, amount)
    customers[:cash] -= amount
end

def customer_pet_count(customers)
    return customers[:pets].length
end

def add_pet_to_customer(customers, pet)
    return customers[:pets].push(pet).length
end

def customer_can_afford_pet(customers, pet)
    return customers[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customers)
    
    add_pet_to_customer(customers, pet)
    #Attempt 1: Does't increase no of pet sales...
    # number_of_new_pet_sales = 0

    # if find_pet_by_name(pet_shop, pet) != nil
    #     number_of_new_pet_sales += 1
    # end

    # Attempt 2: Works
    number_of_new_pet_sales = [find_pet_by_name(pet_shop, pet)]
    
    increase_pets_sold(pet_shop, number_of_new_pet_sales.length)

    remove_customer_cash(customers, pet[:price])

    add_or_remove_cash(pet_shop, pet[:price])

end

# in sell_pet_to_customer: check length of array from find pet to get the number
# Need a way to turn the pet (Arthur) into number (1)