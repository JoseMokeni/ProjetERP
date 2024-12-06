pageextension 60031 "Produits List" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Unit Cost")
        {
            field("TVA"; rec."TVA")
            {
                ApplicationArea = All;
                Caption = 'TVA';
            }
        }

        modify("Default Deferral Template Code")
        {
            Visible = false;
        }
        modify("Vendor No.")
        {
            Visible = false;
        }
        modify("Unit Price")
        {
            Visible = false;
        }
        modify("Cost is Adjusted")
        {
            Visible = false;
        }
        modify("Base Unit of Measure")
        {
            Visible = false;
        }
        modify("Routing No.")
        {
            Visible = false;
        }
        modify("Production BOM No.")
        {
            Visible = false;
        }
        modify("Assembly BOM")
        {
            Visible = false;
        }
        modify("Substitutes Exist")
        {
            Visible = false;
        }
        modify(InventoryField)
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