
codeunit 60150 "Manufacturing Cues Mgt."
{
    procedure CalculateCues(var ManufacturingCues: Record "Manufacturing Cues")
    var
        OrdresFab: Record "Ordres De Fabrication";
        Today: Date;
    begin
        Today := WORKDATE;

        // Calculate Overdue Orders
        OrdresFab.Reset();
        OrdresFab.SetFilter(date_fin_prev, '..%1', Today);
        if OrdresFab.Count > 0 then
            ManufacturingCues."Overdue Orders" := OrdresFab.Count;

        // Calculate Due Soon Orders
        OrdresFab.Reset();
        OrdresFab.SetRange(date_fin_prev, Today, CALCDATE('<2D>', Today));
        if OrdresFab.Count > 0 then
            ManufacturingCues."Due Soon Orders" := OrdresFab.Count;

        ManufacturingCues.Modify();
    end;
}