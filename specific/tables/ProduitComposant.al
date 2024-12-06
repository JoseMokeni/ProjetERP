
table 60003 "Produit Composant"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; produit_id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Produit Id';
            TableRelation = Item."No.";
        }
        field(2; composant_id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Composant Id';
            TableRelation = Composants.Composant_Id;
        }
        field(3; quantite; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité nécessaire';
            MinValue = 0;
        }
    }

    keys
    {
        key(PK; produit_id, composant_id)
        {
            Clustered = true;
        }
    }
}