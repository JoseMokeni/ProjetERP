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
            Caption = 'Product Id';
            TableRelation = "Item"."No.";
        }
        field(3; quantite; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }
        field(4; date_debut; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Start Date';
        }
        field(5; date_fin_prev; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'End Date Planned';
        }
        field(6; produit_description; Text[100])
        {
            Caption = 'Product Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Item".Description where("No." = field(produit_id)));
        }
        field(7; produit_unit_cost; Decimal)
        {
            Caption = 'Product Unit Cost';
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