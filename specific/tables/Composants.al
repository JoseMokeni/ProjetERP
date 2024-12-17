table 60088 Composants
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Composant_Id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Component Id';
        }
        field(2; Nom; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
        }
        field(3; Type; Enum "Composant Type")
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
        if Rec.Composant_Id = '' then
            Error('Id Cant be empty.');
        if Rec.Nom = '' then
            Error('Name Cant be empty.');
        if Rec.Stock < 0 then
            Error('Stock Cant be lower than 0.');
    end;

    trigger OnModify()
    var
        ActivityLogSetup: Record "Activity Log Setup";
    begin
        ActivityLogSetup.Init();
        ActivityLogSetup."Record ID" := Rec.Composant_Id;
        ActivityLogSetup."Table Name" := TableCaption;
        ActivityLogSetup."Activity Description" := StrSubstNo('Component %1 Modified', Rec.Composant_Id);
        ActivityLogSetup."User ID" := UserId;
        ActivityLogSetup."Date Time" := CurrentDateTime;
        ActivityLogSetup.Insert();
    end;

    trigger OnDelete()
    var
        ErrorMsg: Text;
    begin
        // Add your specific check for active orders here
        if not CanDeleteComposant(ErrorMsg) then
            Error(ErrorMsg);
    end;

    local procedure CanDeleteComposant(var ErrorMsg: Text): Boolean
    var
        ProduitComposant: Record "Produit Composant";
        Item: Record Item;
    begin
        ProduitComposant.SetRange(composant_id, Rec.Composant_Id);
        if ProduitComposant.FindSet() then begin
            Item.Get(ProduitComposant.produit_id);
            ErrorMsg := StrSubstNo('Impossible to delete the component %1. Its used in the product %2 (%3).',
                Rec.Composant_Id, Item."No.", Item.Description);
            exit(false);
        end;
        exit(true);
    end;

    trigger OnRename()
    begin

    end;

}