page 60003 "Odres De Fabrication Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Ordres De Fabrication";
    Caption = 'Fabrication Ordres Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
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
                    Caption = 'Quantité';
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
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}