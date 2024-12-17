tableextension 60018 "Clients" extends Customer
{
    fields
    {
        field(60000; "Adresse"; Text[100])
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
        // if "No." = '' then
        //     Error('Le numéro client ne peut pas être vide.');
        // if Name = '' then
        //     Error('Le nom ne peut pas être vide.');
        // if "Adresse" = '' then
        //     Error('L''adresse ne peut pas être vide.');
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

    trigger OnBeforeDelete()
    var
        CommandeClient: Record "Purchase Header";
        ErrorMsg: Text;
    begin
        CommandeClient.SetRange("Client Name", Rec.Name);
        if CommandeClient.FindFirst() then
            Error('Impossible de supprimer le client %1. Il a des commandes existantes de ce client.', Rec.Name);
    end;
}