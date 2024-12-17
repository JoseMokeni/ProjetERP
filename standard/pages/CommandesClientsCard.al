pageextension 60050 "Commandes Clients Card" extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here

        // modify(General)
        // {
        //     Visible = false;
        // }
        // modify("No.")
        // {
        //     Visible = true;
        // }
        // modify("Assigned User ID")
        // {
        //     Visible = true;
        // }
        // modify("Document Date")
        // {
        //     Visible = true;
        // }
        // modify(Status)
        // {
        //     Visible = true;
        // }
        // modify("Invoice Details")
        // {
        //     Visible = false;
        // }
        // modify("Shipping and Payment")
        // {
        //     Visible = false;
        // }
        // modify("Foreign Trade")
        // {
        //     Visible = false;
        // }
        // modify(Prepayment)
        // {
        //     Visible = false;
        // }
        addafter("Assigned User ID")
        {
            field("Client Code"; Rec."Client Code")
            {
                ApplicationArea = All;
                Caption = 'Client Code';
            }
            field("Client Name"; Rec."Client Name")
            {
                ApplicationArea = All;
                Caption = 'Client Name';
            }
            field("Client Contact"; Rec."Client Contact")
            {
                ApplicationArea = All;
                Caption = 'Client Contact';
            }
            field("Client adresse"; Rec."Client adresse")
            {
                ApplicationArea = All;
                Caption = 'Client adresse';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    // trigger OnOpenPage()
    // var
    //     PurchSetup: Record "Purchases & Payables Setup";
    // begin
    //     PurchSetup.Get();
    //     PurchSetup."Order Nos." := '';
    //     PurchSetup.Modify();
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Rec.Init();
    //     Rec."Document Type" := Rec."Document Type"::Order;
    // end;

    var
        myInt: Integer;
}