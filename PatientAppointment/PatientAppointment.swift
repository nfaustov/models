final class PatientAppointment {
    private(set) var scheduledTime: Date = Date.now
    private(set) var duration: TimeInterval = TimeInterval.zero
    @Relationship(inverse: \Patient.appointments)
    private(set) var patient: Patient?
    var status: PatientAppointment.Status?
    @Relationship(deleteRule: .cascade, inverse: \Note.patientAppointment)
    var note: Note? = nil
    private(set) var registrationDate: Date? = nil
    private(set) var registrar: AnyUser? = nil
    @Relationship(deleteRule: .cascade, inverse: \Receipt.appointments)
    var receipt: Receipt? = nil

    var schedule: DoctorSchedule?

    init(
        scheduledTime: Date,
        duration: TimeInterval,
        patient: Patient? = nil,
        status: PatientAppointment.Status? = nil,
        note: Note? = nil,
        registrationDate: Date? = nil,
        registrar: AnyUser? = nil,
        receipt: Receipt? = nil
    ) {
        self.scheduledTime = scheduledTime
        self.duration = duration
        self.patient = patient
        self.status = status
        self.note = note
        self.registrationDate = registrationDate
        self.registrar = registrar
        self.receipt = receipt
    }
}

extension PatientAppointment {
    enum Status: String, Codable, Identifiable {
        case registered = "Зарегистрирован"
        case notified = "СМС уведомление"
        case came = "Пришел"
        case inProgress = "На приеме"
        case completed = "Завершен"

        var id: Self {
            self
        }

        static var selectableCases: [Status] {
            [.registered, .came, .inProgress]
        }
    }
}

