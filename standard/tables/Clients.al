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
}