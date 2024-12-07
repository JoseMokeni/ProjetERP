table 60101 "Manufacturing Cues"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        // Component Statistics
        field(10; "Total Components"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Composants);
            Caption = 'Total Components';
        }
        field(11; "Low Stock Components"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Composants where(Stock = filter(< 5)));
            Caption = 'Low Stock Components';
        }
        // Manufacturing Orders Statistics
        field(20; "Total Active Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Ordres De Fabrication");
            Caption = 'Total Active Orders';
        }
        field(21; "Overdue Orders"; Integer)
        {
            Caption = 'Overdue Orders';
        }
        field(22; "Due Soon Orders"; Integer)
        {
            Caption = 'Orders Due in 2 Days';
        }
        // Customer Statistics
        field(30; "Total Customers"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer);
            Caption = 'Total Customers';
        }
        field(31; "Active Customer Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header");
            Caption = 'Active Customer Orders';
        }
        // Product Statistics
        field(40; "Total Products"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item);
            Caption = 'Total Products';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}