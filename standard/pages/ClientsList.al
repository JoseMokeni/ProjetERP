pageextension 60022 "Clients List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Phone No.")
        {
            field("Adress"; rec."Adresse")
            {
                ApplicationArea = All;
                Caption = 'Adress';
            }
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify("Balance (LCY)")
        {
            Visible = false;
        }
        modify("Balance Due (LCY)")
        {
            Visible = false;
        }
        modify("Sales (LCY)")
        {
            Visible = false;
        }
        modify("Payments (LCY)")
        {
            Visible = false;
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}