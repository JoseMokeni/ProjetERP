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
        modify(Status)
        {
            StyleExpr = StatusStyleTxt;
        }
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

    var
        [InDataSet]
        StatusStyleTxt: Text;
        myInt: Integer;

    trigger OnAfterGetRecord()
    begin
        StatusStyleTxt := SetStatusStyle();
    end;

    local procedure SetStatusStyle(): Text
    begin
        case Rec.Status of
            Rec.Status::Released:
                exit('Favorable');
            else
                exit('Ambiguous');
        end;
    end;
}