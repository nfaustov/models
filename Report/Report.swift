final class Report {
    private(set) var date: Date = Date.now
    private(set) var startingCash: Double = Double.zero
    @Relationship(deleteRule: .cascade, inverse: \Payment.report)
    private(set) var payments: [Payment]?
    private(set) var closed: Bool = false

    init(
        date: Date,
        startingCash: Double,
        payments: [Payment]? = [],
        closed: Bool = false
    ) {
        self.date = date
        self.startingCash = startingCash
        self.payments = payments
        self.closed = closed
    }
}
