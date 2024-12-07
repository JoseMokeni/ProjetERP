page 60005 "Produit Composant Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Produit Composant";

    layout
    {
        area(Content)
        {
            group(Product)
            {
                Caption = 'Product Information';
                field(produit_id; Rec.produit_id)
                {
                    ApplicationArea = All;
                }
                field(produit_nom; Rec.produit_nom)
                {
                    ApplicationArea = All;
                }
            }
            group(Component)
            {
                Caption = 'Component Information';
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
