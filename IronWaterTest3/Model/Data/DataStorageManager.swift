import Foundation

enum Keys: String, CaseIterable {
    case item
}

final class DataStorageManager {
    func saveItemsToUserDefaults(_ item: [ProfileField]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(item) {
            UserDefaults.standard.set(encoded, forKey: Keys.item.rawValue)
        }
    }
    func loadItemsFromUserDefaults() -> [ProfileField]  {
        if let savedData = UserDefaults.standard.data(forKey: Keys.item.rawValue) {
            let decoder = JSONDecoder()
            if let loadedItems = try? decoder.decode([ProfileField].self, from: savedData) {
                return loadedItems
            }
        }
        return [
            ProfileField(title: "Имя", value: "Иван"),
            ProfileField(title: "Фамилия", value: "Иванов"),
            ProfileField(title: "Отчество", value: "Иванович"),
            ProfileField(title: "Дата рождения", value: "13.05.1992"),
            ProfileField(title: "Пол", value: "мужской")
        ]
    }
}


