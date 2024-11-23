pageextension 69307 "Commandes Clients List" extends "Purchase Order List"
{
    layout
    {
        // Add changes to page layout here
        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }
        modify("Buy-from Vendor Name")
        {
            Visible = false;
        }
        modify("Vendor Authorization No.")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Amount Including VAT")
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