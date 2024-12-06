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
}