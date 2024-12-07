page 60004 "Produit Composant List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Produit Composant";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(produit_id; Rec.produit_id)
                {
                    ApplicationArea = All;
                }
                field(produit_nom; Rec.produit_nom)
                {
                    ApplicationArea = All;
                }
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
}