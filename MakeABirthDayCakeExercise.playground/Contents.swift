//: [Previous](@previous)
//: ### Let's Make A Very Simple Birthday Cake
//:
//: Create a ascii picture of a cake using the provided  ingredients and actions
//: Below is the recipe for making the cake, alter and call functions based on the recipe at the bottom
//:
protocol Ingredient {}

class Cuppable: Ingredient {
    var cups: Int?
}

class TeaSpoonable: Ingredient {
    var teaSpoon: Int?
}

class UnsaltedButter: Ingredient {
    var sticks: Int = 4  // butter sticks usually come in a 4 stick pack
}

class Egg: Ingredient {
    var quantity: Int = 12  // stores sell a dozen eggs
}

class WholeMilk: Cuppable {}

class Sugar: Cuppable {}

class AllPurposeFlour: Cuppable {}

class VanillaExtract: TeaSpoonable {}

class BakingPowder: TeaSpoonable {}

class CreamCheeseFrosting: Ingredient {
    var type: String? = nil
}

//What can you buy?
func buy<T>(ingredient: T) -> T {
    print("*                                             *")
    print("                                         *     ")
    print("           *                                   ")
    print("                        *                      ")
    return ingredient
}

//: -What can you crack?
func crack(ingredient: Egg, amount: Int) -> Egg {
    ingredient.quantity = amount
    print("    iiiiiiiiiiiiiiiiiii     ")
    print("  |||||||H|A|P|P|Y|||||||    ")
    return ingredient
}
//: - What can you melt?
func melt(ingredient: UnsaltedButter, amount: Int) -> UnsaltedButter {
    ingredient.sticks = amount
    print("|\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/\\/|")
    return ingredient
}

//: -What can you measure a cup of?
func measureCupsOf<T: Cuppable>(ingredients: [T], cups: Int) -> [T] {
    for ingredient in ingredients {
        ingredient.cups = cups
    }
    print("|||||||||||||||||||||||||||||")
    return ingredients
}

//: -What can you measure a Teaspoon of?
func measureTeaSpoonsOf<T: TeaSpoonable>(ingredients: [T], teaSpoons: Int) -> [T] {
    for ingredient in ingredients {
        ingredient.teaSpoon = teaSpoons
    }
    print("|||||||||||||||||||||||||||||")
    return ingredients
}

//: -What can you mix?
func mix<T: Ingredient, U: Ingredient>(ingredients1: [T], with ingredients2: [U], with ingredients: [Ingredient]) -> [Ingredient] {
     print("|||||||||||||||||||||||||||||")
    return ingredients1 + ingredients2 + ingredients
}

//: -how will you bake?
func bake(at tempeture: Int, ingredients: [Ingredient]) -> [Ingredient] {
    print("|,,,,,,,,,,,,,,,,,,,,,,,,,,,|")
    return ingredients
}

//: -Is this how you want the cake frosted?
func frost(with frosting: CreamCheeseFrosting, ingredients: [Ingredient]) {
     print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
}

//: - ( 1 ) Buy all the ingredients Milk, Eggs, Buttter, All Purpose Flour, Baking Powder, Vanilla Extract, Sugar and Frosting
let butter = buy(ingredient: UnsaltedButter())
let egg = buy(ingredient: Egg())
let milk = buy(ingredient: WholeMilk())
let sugar = buy(ingredient: Sugar())
let flour = buy(ingredient: AllPurposeFlour())
let vanilla = buy(ingredient: VanillaExtract())
let powder = buy(ingredient: BakingPowder())
let frosting = buy(ingredient: CreamCheeseFrosting())

//: - ( 2 ) Crack 8 eggs
let crackedEggs = crack(ingredient: egg, amount: 8)

//: - ( 3 ) Melt two sticks of butter
let meltedButter = melt(ingredient: butter, amount: 2)

//: - ( 4 ) Measure  3/4 cups of Milk, Sugar, and All Purpose Flower
let cups = measureCupsOf(ingredients: [milk, sugar, flour], cups: 3/4)

//: - ( 6 ) Measure 2 teaspoobs of vanilla extract and baking powder
let teaspoons = measureTeaSpoonsOf(ingredients: [vanilla, powder], teaSpoons: 2)

//: - ( 6 ) Mix measurements together
let mixedTogether = mix(ingredients1: cups, with: teaspoons, with: [crackedEggs, meltedButter])

//: - ( 7 ) Bake the cake
let baked = bake(at: 350, ingredients: mixedTogether)

//: - ( 8) Frost the cake
let cake = frost(with: frosting, ingredients: baked)


