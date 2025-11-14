//
//  ViewController.swift
//  TableViewApp
//
//  Created by Rassul Turumov on 14.11.2025.
//

import UIKit



enum Category : String, CaseIterable {
    case movie = "Movie"
    case audio = "Audio"
    case book = "Book"
    case course = "Course"
}
struct TableItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
    let category : Category
}

class ViewController: UIViewController, UITableViewDelegate {
    let movies: [TableItem] = [
        TableItem(title: "Contratiempo.",
                  subtitle: "by Oriol Paulo",
                  review: "A successful businessman, accused of murdering his mistress, tries to prove his innocence, but every new detail makes the story more and more unexpected.",
                  image: #imageLiteral(resourceName: "movie1"),
                  category: .movie),
        
        TableItem(title: "Ауру",
                  subtitle: "by Aitore Zholdaskali",
                  review: "A young family, deeply in debt, fakes the wife's illness to earn money for her 'treatment', but their lies spiral out of control, leading to tragic consequences.",
                  image: #imageLiteral(resourceName: "movie2"),
                  category: .movie),
        
        TableItem(title: "Tenet",
                  subtitle: "by Christopher Nolan",
                  review: "A spy thriller about a secret agent who uses time-reversal technology to prevent a global catastrophe, encountering inversion effects and temporal paradoxes.",
                  image: #imageLiteral(resourceName: "movie3"),
                  category: .movie),
        
        TableItem(title: "Interstellar",
                  subtitle: "by Christopher Nolan",
                  review: "A group of astronauts travel through a wormhole in search of a new planet for humanity, facing challenges of time, gravity, and emotional trials that test the limits of human love and endurance.",
                  image: #imageLiteral(resourceName: "movie4"),
                  category: .movie),
        
        TableItem(title: "Hacksaw Ridge",
                  subtitle: "by Mel Gibson",
                  review: "The story of Desmond Doss, a Jehovah's Witness soldier who refuses to bear arms in World War II but displays incredible bravery, saving the lives of hundreds of soldiers during the bloody Battle of Okinawa.",
                  image: #imageLiteral(resourceName: "movie5"),
                  category: .movie)
    ]
    
    let audios: [TableItem] = [
        TableItem(title: "Танцуй",
                  subtitle: "by Масло Черного Тмина",
                  review: "A humorous, absurd, energetic composition with an Eastern vibe that mixes a dance beat and meme-worthy lyrics for a cheerful mood.",
                  image: #imageLiteral(resourceName: "track1"),
                  category: .audio),
        
        TableItem(title: "Незаметно",
                  subtitle: "by Масло Черного Тмина",
                  review: "A soft, atmospheric composition about how feelings or changes come quietly and gradually, leaving a deep mark.",
                  image: #imageLiteral(resourceName: "track2"),
                  category: .audio),
        
        TableItem(title: "Любовь HD1080",
                  subtitle: "by Каспийский Груз",
                  review: "A dark, cinematic tale of a toxic relationship, told in the duo's signature style: cold honesty, an atmospheric beat, and metaphors that cut more sharply than HD.",
                  image: #imageLiteral(resourceName: "track3"),
                  category: .audio),
        
        TableItem(title: "Beautiful",
                  subtitle: "by Eminem",
                  review: "A heartfelt, painfully honest confession about battling inner demons, where he reminds himself and the listener through a melancholy beat and powerful lyrics that human worth never fades, even when the world seems hostile.",
                  image: #imageLiteral(resourceName: "track4"),
                  category: .audio),
        
        TableItem(title: "Type Shit",
                  subtitle: "by Future, Metro Boomin, Travis Scott, Playboi Carti",
                  review: "A hard-hitting, self-assured trap banger where the artists deliver their signature flow, boast about their skill level, and sound like they're setting a standard—we only make this type of shit.",
                  image: #imageLiteral(resourceName: "track5"),
                  category: .audio)
    ]

    let books: [TableItem] = [
        TableItem(title: "Как закалялась сталь",
                  subtitle: "by Nikolai Ostrovsky",
                  review: "A novel about Pavel Korchagin, who overcomes personal and social hardships, strengthens his character, and learns resilience in the face of life’s challenges.",
                  image: #imageLiteral(resourceName: "book1"),
                  category: .book),
        
        TableItem(title: "Martin Eden",
                  subtitle: "by Jack London",
                  review: "A novel about a young sailor striving for self-improvement and literary success, confronting love, society, and personal ambitions.",
                  image: #imageLiteral(resourceName: "book2"),
                  category: .book),
        
        TableItem(title: "Воскресение",
                  subtitle: "by Лев Толстой",
                  review: "A story about a person seeking to atone for past mistakes and achieve spiritual redemption.",
                  image: #imageLiteral(resourceName: "book3"),
                  category: .book),
        
        TableItem(title: "The Suicide Club",
                  subtitle: "by Robert Louis Stevenson",
                  review: "A collection of stories about a secret society where those wishing to die enter a risky pact that leads to unexpected consequences.",
                  image: #imageLiteral(resourceName: "book4"),
                  category: .book),
        
        TableItem(title: "Белый пароход",
                  subtitle: "by Чингиз Айтматов",
                  review: "A story about a boy, his dreams of a white steamship, and his encounter with adult cruelty.",
                  image: #imageLiteral(resourceName: "book5"),
                  category: .book)
    ]
    
    let courses: [TableItem] = [
        TableItem(title: "Golang Application Development",
                  subtitle: "Lecturer: Zhanshuakov A.K.",
                  review: "Developing applications in Go, learning syntax, standard library, and building server-side solutions.",
                  image: #imageLiteral(resourceName: "course1"),
                  category: .course),
        
        TableItem(title: "Blockchain Technologies and Applications",
                  subtitle: "Lecturer: Aasso Ziro",
                  review: "Study of blockchain technologies, their principles, and practical use in cryptocurrencies and smart contracts.",
                  image: #imageLiteral(resourceName: "course2"),
                  category: .course),
        
        TableItem(title: "iOS Development",
                  subtitle: "Lecturer: Arman Myrzakanurov",
                  review: "Creating mobile apps for iOS, learning Swift, Xcode.",
                  image: #imageLiteral(resourceName: "course3"),
                  category: .course),
        
        TableItem(title: "Statistics",
                  subtitle: "Lecturer: Mukash N.K.",
                  review: "Basics of statistics, data analysis methods, probabilities, and interpreting results.",
                  image: #imageLiteral(resourceName: "course4"),
                  category: .course),
        
        TableItem(title: "Object-Oriented Programming",
                  subtitle: "Lecturer: Pakizar Shamoi",
                  review: "Study of the object-oriented approach: classes, objects, inheritance, encapsulation, and polymorphism for building programs.",
                  image: #imageLiteral(resourceName: "course5"),
                  category: .course)
    ]



    @IBOutlet private weak var table : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = Category.allCases[section]
        switch currentSection {
            case .movie: return movies.count
            case .audio: return audios.count
            case .book: return books.count
            case .course: return courses.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = Category.allCases[section]
        return category.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = Category.allCases[indexPath.section]
        
        switch(currentSection){
        case .movie:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
            let currentMovie = movies[indexPath.row]
            cell.configure(movie: currentMovie)
            return cell
        case .audio:
            let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell") as! AudioTableViewCell
            let currentAudio = audios[indexPath.row]
            cell.configure(audio: currentAudio)
            return cell
        case .book:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
            let currentBook = books[indexPath.row]
            cell.configure(book: currentBook)
            return cell
        case .course:
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
            let currentCourse = courses[indexPath.row]
            cell.configure(course: currentCourse)
            return cell
        }
    }

}
