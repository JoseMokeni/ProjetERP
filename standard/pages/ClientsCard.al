pageextension 60021 MyExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Phone No.")
        {
            field("Adress"; rec."Adress")
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
        modify("Payments (LCY)")
        {
            Visible = false;
        }
        modify("Credit Limit (LCY)")
        {
            Visible = false;
        }
        modify(Blocked)
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify(Address)
        {
            Visible = false;
        }
        modify("Post Code")
        {
            Visible = false;
        }
        modify("City")
        {
            Visible = false;
        }
        modify("Country/Region Code")
        {
            Visible = false;
        }
        modify("Address 2")
        {
            Visible = false;
        }
        modify("E-Mail")
        {
            Visible = false;
        }
        modify("Home Page")
        {
            Visible = false;
        }
        modify(MobilePhoneNo)
        {
            Visible = false;
        }
        modify(County)
        {
            Visible = false;
        }
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify(TotalSales2)
        {
            Visible = false;
        }
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify("Service Zone Code")
        {
            Visible = false;
        }
        modify("Salesperson Code")
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify(Invoicing)
        {
            Visible = false;
        }
        modify(Payments)
        {
            Visible = false;
        }
        modify(Shipping)
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