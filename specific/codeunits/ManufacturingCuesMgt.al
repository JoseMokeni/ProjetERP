codeunit 60150 "Manufacturing Cues Mgt."
{
    procedure CalculateCues(var ManufacturingCues: Record "Manufacturing Cues")
    var
        OrdresFab: Record "Ordres De Fabrication";
        Today: Date;
        DueDate: Date;
    begin
        Today := WorkDate();
        DueDate := CALCDATE('<2D>', Today);

        // Calculate Overdue Orders
        OrdresFab.Reset();
        OrdresFab.SetFilter(date_fin_prev, '<=%1', Today);
        if OrdresFab.Count > 0 then
            ManufacturingCues."Overdue Orders" := OrdresFab.Count
        else
            ManufacturingCues."Overdue Orders" := 0;

        // Calculate Due Soon Orders
        OrdresFab.Reset();
        OrdresFab.SetFilter(date_fin_prev, '%1..%2', Today, DueDate);
        if OrdresFab.Count > 0 then
            ManufacturingCues."Due Soon Orders" := OrdresFab.Count
        else
            ManufacturingCues."Due Soon Orders" := 0;

        ManufacturingCues.Modify();
    end;
}