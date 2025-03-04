// Прием врача
final class DoctorSchedule {
    @Relationship(inverse: \Doctor.schedules)
    var doctor: Doctor?
    var cabinet: Int = 1
    var starting: Date = Date.now
    var ending: Date = Date.now.addingTimeInterval(1800)
    @Relationship(deleteRule: .cascade, inverse: \Note.doctorSchedule)
    var note: Note? = nil
    @Relationship(deleteRule: .cascade, inverse: \PatientAppointment.schedule)
    var patientAppointments: [PatientAppointment]?

    init(
        doctor: Doctor,
        cabinet: Int,
        starting: Date,
        ending: Date,
        note: Note? = nil,
        patientAppointments: [PatientAppointment] = []
    ) {
        self.doctor = doctor
        self.cabinet = cabinet
        self.starting = starting
        self.ending = ending

        // При создании приема врача создаем слоты для записи пациентов с учетом длительности приема врача
        if doctor.department != .procedure, patientAppointments.isEmpty {
            var appointmentTime = starting
            var appointments = [PatientAppointment]()

            repeat {
                let appointment = PatientAppointment(
                    scheduledTime: appointmentTime,
                    duration: doctor.serviceDuration,
                    patient: nil
                )
                appointments.append(appointment)
                appointmentTime.addTimeInterval(doctor.serviceDuration)
            } while appointmentTime < ending

            self.patientAppointments = appointments
        } else {
            self.patientAppointments = patientAppointments
        }
    }
}
