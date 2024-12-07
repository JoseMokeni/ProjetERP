
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
            Caption = 'Necessary Quantity';
            MinValue = 0;
        }
        field(4; produit_nom; Text[100])
        {
            Caption = 'Product Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where(
                "No." = field(produit_id)));

        }
        field(5; composant_nom; Text[100])
        {
            Caption = 'Component Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Composants.Nom where(
                Composant_Id = field(composant_id)));

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