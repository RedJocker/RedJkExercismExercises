module BookingUpForBeauty

open System

let schedule (appointmentDateDescription: string) : DateTime =
    DateTime.Parse(appointmentDateDescription)

let hasPassed (appointmentDate: DateTime) : bool =
    appointmentDate < DateTime.Now

let isAfternoonAppointment (appointmentDate: DateTime) : bool =
    (seq { 12..17 }) |> Seq.contains appointmentDate.Hour

let description (appointmentDate: DateTime) : string =
    $"You have an appointment on {appointmentDate}."

let anniversaryDate () : DateTime =
    let now = DateTime.Today
    DateTime(now.Year, 9, 15)
