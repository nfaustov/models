extension Patient {
    struct PassportData: Codable, Hashable {
        var gender: Gender?
        var seriesNumber: String
        var birthday: Date
        var issueDate: Date
        var authority: String

        init(
            gender: Gender? = nil,
            seriesNumber: String = "",
            birthday: Date = Date(timeIntervalSinceReferenceDate: 0),
            issueDate: Date = Date(timeIntervalSinceReferenceDate: 0),
            authority: String = ""
        ) {
            self.gender = gender
            self.seriesNumber = seriesNumber
            self.birthday = birthday
            self.issueDate = issueDate
            self.authority = authority
        }

        var isValid: Bool {
            !seriesNumber.isEmpty &&
            birthday != Date(timeIntervalSinceReferenceDate: 0) &&
            issueDate != Date(timeIntervalSinceReferenceDate: 0) &&
            !authority.isEmpty
        }
    }
}

enum Gender: String, Codable, Hashable, CaseIterable {
    case male = "муж"
    case female = "жен"
}
