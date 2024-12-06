table 60002 "Ordres De Fabrication"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ordre_id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ordre Id';
        }
        field(2; produit_id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Produit Id';
            TableRelation = "Item"."No.";
        }
        field(3; quantite; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité';
        }
        field(4; date_debut; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Début';
        }
        field(5; date_fin_prev; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date Fin Prévue';
        }
        field(6; produit_description; Text[100])
        {
            Caption = 'Produit Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Item".Description where("No." = field(produit_id)));
        }
        field(7; produit_unit_cost; Decimal)
        {
            Caption = 'Produit Unit Cost';
            FieldClass = FlowField;
            CalcFormula = lookup("Item"."Unit Cost" where("No." = field(produit_id)));
        }

    }

    keys
    {
        key(Key1; ordre_id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}