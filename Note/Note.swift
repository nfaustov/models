final class Note {
    private(set) var title: String = ""
    private(set) var text: String = ""
    private(set) var createdAt: Date = Date.now
    private(set) var createdBy: AnyUser = AnonymousUser().asAnyUser

    var doctorSchedule: DoctorSchedule?
    var patientAppointment: PatientAppointment?

    static let charactersMax = 120

    init(title: String, text: String, createdBy: User) {
        self.title = title
        self.text = text
        createdAt = .now
        self.createdBy = createdBy.asAnyUser
    }

    func updateText(_ text: String) {
        self.text = text
    }
}
