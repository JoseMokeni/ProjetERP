page 60002 "Ordres De Fabrication List"
{
    Caption = 'Ordres De Fabrication List';
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
                    Caption = 'Produit Id';
                }
                field(produit_description; Rec.produit_description)
                {
                    ApplicationArea = All;
                    Caption = 'Produit Description';
                }
                field(produit_unit_cost; Rec.produit_unit_cost)
                {
                    ApplicationArea = All;
                    Caption = 'Produit Unit Cost';
                }
                field(quantite; Rec.quantite)
                {
                    ApplicationArea = All;
                    Caption = 'Quantité';
                }
                field(date_debut; Rec.date_debut)
                {
                    ApplicationArea = All;
                    Caption = 'Date Début';
                }
                field(date_fin_prev; Rec.date_fin_prev)
                {
                    ApplicationArea = All;
                    Caption = 'Date Fin Prévue';
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
}