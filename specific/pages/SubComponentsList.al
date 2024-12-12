
page 60032 "Sub Components List Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Produit Composant";
    Caption = 'Sub Components';

    layout
    {
        area(Content)
        {
            repeater(SubComponents)
            {
                field(composant_id; Rec.composant_id)
                {
                    ApplicationArea = All;
                }
                field(composant_nom; Rec.composant_nom)
                {
                    ApplicationArea = All;
                }
                field(quantite; Rec.quantite)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        ProduitComposant: Record "Produit Composant";
    begin
        // Filter to show only components of the current product's components
        if ProduitComposant.FindSet() then;
    end;
}