pageextension 60050 "Commandes Clients Card" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here

        modify(General)
        {
            Visible = false;
        }
        modify("No.")
        {
            Visible = true;
        }
        modify("Assigned User ID")
        {
            Visible = true;
        }
        modify("Document Date")
        {
            Visible = true;
        }
        modify(Status)
        {
            Visible = true;
        }
        modify("Invoice Details")
        {
            Visible = false;
        }
        modify("Shipping and Payment")
        {
            Visible = false;
        }
        modify("Foreign Trade")
        {
            Visible = false;
        }
        modify(Prepayment)
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