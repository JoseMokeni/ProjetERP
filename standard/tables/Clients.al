tableextension 60018 "Clients" extends Customer
{
    fields
    {
        field(60000; "Adress"; Text[100])
        {
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
        if "No." = '' then
            Error('Le numéro client ne peut pas être vide.');
        if Name = '' then
            Error('Le nom ne peut pas être vide.');
        if "Adress" = '' then
            Error('L''adresse ne peut pas être vide.');
    end;

    trigger OnAfterModify()
    var
        ActivityLogSetup: Record "Activity Log Setup";
    begin
        ActivityLogSetup.Init();
        ActivityLogSetup."Record ID" := Rec."No.";
        ActivityLogSetup."Table Name" := TableCaption;
        ActivityLogSetup."Activity Description" := StrSubstNo('Client %1 modifié', Rec."No.");
        ActivityLogSetup."User ID" := UserId;
        ActivityLogSetup."Date Time" := CurrentDateTime;
        ActivityLogSetup.Insert();
    end;
}