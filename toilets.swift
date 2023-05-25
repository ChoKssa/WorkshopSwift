import Foundation


struct Toilets: Codable {
    let records: [Record]
}

struct Record: Codable {
    let recordid: String
    let fields: Fields
}

struct Fields: Codable {
    let accesPmr: String
    let horaire: String
    let adresse: String
    let arrondissement: String

    enum CodingKeys: String, CodingKey {
        case accesPmr = "acces_pmr"
        case horaire, adresse, arrondissement
    }
}

func getFileContent(filename: String) -> String {
    var content: String

    do {
        let fileContent: String = try String(contentsOfFile: filename)
        content = fileContent
    } catch {
        print("Cannot get file content")
        exit(84)
    }
    return content
}


let fileContent: String = getFileContent(filename: "./toilets2.json")
let decoder: JSONDecoder = JSONDecoder()

var toilets: Toilets

do {
    let json: Toilets = try decoder.decode(Toilets.self, from: Data(fileContent.utf8))
    toilets = json
} catch {
    print(error.localizedDescription)
    exit(84)
}

for toilet in toilets.records {
    print(toilet.fields.adresse)
}
