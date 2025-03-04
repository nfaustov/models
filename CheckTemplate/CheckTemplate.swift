final class CheckTemplate {
    var title: String = ""
    @Relationship(inverse: \MedicalService.checkTemplates)
    var services: [MedicalService]?
    var discount: Double = Double.zero

    init(
        title: String,
        services: [MedicalService]? = [],
        discount: Double = .zero
    ) {
        self.title = title
        self.services = services
        self.discount = discount
    }
}
