tableextension 60038 "Commandes Clients" extends "Purchase Header"
{
    fields
    {
        field(60000; "Client Name"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"."Name";
        }

        field(60001; "Client Contact"; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"."Contact";
        }
        field(60002; "Client adresse"; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Customer"."adresse";
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
            Error('Le numéro de commande ne peut pas être vide.');
        if "Client Name" = '' then
            Error('Le nom du client ne peut pas être vide.');
        if "Client Contact" = '' then
            Error('Le contact client ne peut pas être vide.');
        if "Client adresse" = '' then
            Error('L''adresse client ne peut pas être vide.');
    end;

    trigger OnAfterModify()
    var
        ActivityLogSetup: Record "Activity Log Setup";
    begin
        ActivityLogSetup.Init();
        ActivityLogSetup."Record ID" := Rec."No.";
        ActivityLogSetup."Table Name" := TableCaption;
        ActivityLogSetup."Activity Description" := StrSubstNo('Commande client %1 modifiée', Rec."No.");
        ActivityLogSetup."User ID" := UserId;
        ActivityLogSetup."Date Time" := CurrentDateTime;
        ActivityLogSetup.Insert();
    end;
}