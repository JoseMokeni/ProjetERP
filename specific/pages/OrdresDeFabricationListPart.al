
page 60056 "Ordres De Fabrication ListPart"
{
    Caption = 'Fabrication Ordre List Part';
    PageType = ListPart;
    SourceTable = "Ordres De Fabrication";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ordre_id; Rec.ordre_id)
                {
                    ApplicationArea = All;
                }
                field(produit_description; Rec.produit_description)
                {
                    ApplicationArea = All;
                }
                field(quantite; Rec.quantite)
                {
                    ApplicationArea = All;
                }
                field(date_fin_prev; Rec.date_fin_prev)
                {
                    ApplicationArea = All;
                    StyleExpr = DeadlineStyle;
                }
            }
        }
    }

    var
        DeadlineStyle: Text;

    trigger OnAfterGetRecord()
    begin
        DeadlineStyle := SetDeadlineStyle();
    end;

    local procedure SetDeadlineStyle(): Text
    var
        CurrentDate: Date;
        DaysUntilDeadline: Integer;
    begin
        CurrentDate := Today;
        DaysUntilDeadline := Rec.date_fin_prev - CurrentDate;

        if DaysUntilDeadline < 0 then
            exit('Unfavorable')
        else if DaysUntilDeadline <= 2 then
            exit('Ambiguous')
        else
            exit('Favorable');
    end;
}