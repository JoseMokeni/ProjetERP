
table 60004 "Activity Log Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Record ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Table Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Activity Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "User ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}