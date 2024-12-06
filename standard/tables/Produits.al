tableextension 60027 "Produits" extends Item
{
    fields
    {
        field(60028; "TVA"; Integer)
        {
            Caption = 'TVA';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnBeforeInsert()
    begin
        if Rec."No." = '' then
            Error('Le numéro du produit ne peut pas être vide.');
        if Rec.Description = '' then
            Error('La description ne peut pas être vide.');
        if Rec."TVA" < 0 then
            Error('La TVA ne peut pas être négative.');
    end;

    trigger OnAfterModify()
    var
        ActivityLogSetup: Record "Activity Log Setup";
    begin
        ActivityLogSetup.Init();
        ActivityLogSetup."Record ID" := Rec."No.";
        ActivityLogSetup."Table Name" := TableCaption;
        ActivityLogSetup."Activity Description" := StrSubstNo('Produit %1 modifié', Rec."No.");
        ActivityLogSetup."User ID" := UserId;
        ActivityLogSetup."Date Time" := CurrentDateTime;
        ActivityLogSetup.Insert();
    end;
}