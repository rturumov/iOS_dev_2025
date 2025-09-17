import Foundation

// step 1
var firstName: String = "Rassul"
var lastName: String = "Turumov"
let birthYear: Int = 2004
let currentYear: Int = 2025
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.95
var trueHeigh: String = "(actually 1.78m)"

// step 2
var hobby: String = "computer games (not codding)"
var numberOfHobbies: Int = 3231
var favoriteNumber: Int = 1
var isHobbyCreative: Bool = false
var anotherHobby: String = "reading"
var favoriteEmoji😔: String = "🤡"

// step 3
var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear).
I am currently a student: \(isStudent).
My height is \(height)m \(trueHeigh). My favorite emoji is \(favoriteEmoji😔).
I enjoy \(hobby), which is a creative hobby: \(isHobbyCreative).
I also like \(anotherHobby). I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber).
"""

// step 4
var futureGoals: String = "In the future, I want to be a cyber athlete, not a professional iOS developer (it is a joke, professor, do not hit me)."
lifeStory += "\n" + futureGoals

print(lifeStory)
