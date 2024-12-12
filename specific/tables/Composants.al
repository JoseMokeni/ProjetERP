table 60088 Composants
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
        if Composant_Id = '' then
            Error('Le Composant Id ne peut pas être vide.');
        if Nom = '' then
            Error('Le Nom ne peut pas être vide.');
        if Stock < 0 then
            Error('Le Stock ne peut pas être négatif.');
    end;

    trigger OnModify()
    var
        ActivityLogSetup: Record "Activity Log Setup";
    begin
        ActivityLogSetup.Init();
        ActivityLogSetup."Record ID" := Rec.Composant_Id;
        ActivityLogSetup."Table Name" := TableCaption;
        ActivityLogSetup."Activity Description" := StrSubstNo('Composant %1 modifié', Rec.Composant_Id);
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
            ErrorMsg := StrSubstNo('Impossible de supprimer le composant %1. Il est utilisé dans le produit %2 (%3).',
                Rec.Composant_Id, Item."No.", Item.Description);
            exit(false);
        end;
        exit(true);
    end;

    trigger OnRename()
    begin

    end;

}