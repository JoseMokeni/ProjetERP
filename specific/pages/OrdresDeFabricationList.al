page 60002 "Ordres De Fabrication List"
{
    Caption = 'Fabrication ordre List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
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
                    Caption = 'Ordre Id';
                }
                field(produit_id; Rec.produit_id)
                {
                    ApplicationArea = All;
                    Caption = 'Product Id';
                }
                field(produit_description; Rec.produit_description)
                {
                    ApplicationArea = All;
                    Caption = 'Product Description';
                }
                field(produit_unit_cost; Rec.produit_unit_cost)
                {
                    ApplicationArea = All;
                    Caption = 'Product Unit Cost';
                }
                field(quantite; Rec.quantite)
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                }
                field(date_debut; Rec.date_debut)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                }
                field(date_fin_prev; Rec.date_fin_prev)
                {
                    ApplicationArea = All;
                    Caption = 'End Date Planned';
                    StyleExpr = DeadlineStyle;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
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