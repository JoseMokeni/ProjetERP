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