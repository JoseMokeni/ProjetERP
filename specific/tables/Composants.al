table 60000 Composants
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Composant_Id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Composant Id';
        }
        field(2; Nom; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Nom';
        }
        field(3; Type; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
        }
        field(4; Stock; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Stock';
        }
    }

    keys
    {
        key(Key1; Composant_Id)
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