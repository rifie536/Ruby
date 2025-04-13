class Gate
    STATIONS = [:umeda, :juso, :mikuni]
    FSRES = [160, 190]

    def initialize(name)
        @name = name
    end

    def enter(ticket)
        ticket.stamp(@name)
    end

    def exit(ticket)
        fare = calc_fare(ticket)
        fare <= ticket.fare
    end

    def calc_fare(ticket)
        from = STATIONS.index(ticket.stamped_at)
        to = STATIONS.index(@name)
        distance = to - from
        FSRES[distance - 1]
    end
end