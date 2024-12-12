pageextension 60030 "Produits Card" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here

        // modify("Blocked")
        // {
        //     Visible = false;
        // }
        // modify("Last Date Modified")
        // {
        //     Visible = false;
        // }
        // modify(GTIN)
        // {
        //     Visible = false;
        // }
        // modify("Item Category Code")
        // {
        //     Visible = false;
        // }
        // modify("Service Item Group")
        // {
        //     Visible = false;
        // }
        // modify("Automatic Ext. Texts")
        // {
        //     Visible = false;
        // }
        // modify("Common Item No.")
        // {
        //     Visible = false;
        // }
        // modify("Purchasing Code")
        // {
        //     Visible = false;
        // }
        // modify(Type)
        // {
        //     Visible = false;
        // }
        // modify("Vendor No.")
        // {
        //     Visible = false;
        // }
        // modify("Unit Price")
        // {
        //     Visible = false;
        // }
        // modify("Cost is Adjusted")
        // {
        //     Visible = false;
        // }
        // modify("Base Unit of Measure")
        // {
        //     Visible = false;
        // }
        // modify("Routing No.")
        // {
        //     Visible = false;
        // }
        // modify("Production BOM No.")
        // {
        //     Visible = false;
        // }
        // modify(Inventory)
        // {
        //     Visible = false;
        // }
        // modify("Cost Details")
        // {
        //     Visible = false;
        // }
        // modify("Standard Cost")
        // {
        //     Visible = true;
        // }
        modify("Prices & Sales")
        {
            Visible = false;
        }
        modify(Replenishment)
        {
            Visible = false;
        }
        modify(Planning)
        {
            Visible = false;
        }
        modify(ItemTracking)
        {
            Visible = false;
        }
        modify(Warehouse)
        {
            Visible = false;
        }
        modify(InventoryGrp)
        {
            Visible = false;
        }
        modify("Posting Details")
        {
            Visible = false;
        }
        modify(ForeignTrade)
        {
            Visible = false;
        }
        modify("Cost is Adjusted")
        {
            Visible = false;
        }
        // modify("Standard Cost")
        // {
        //     Visible = false;
        // }
        modify("Unit Cost")
        {
            Visible = false;
        }
        modify("Costing Method")
        {
            Visible = false;
        }
        modify("Purchasing Code")
        {
            Visible = false;
        }
        modify("Common Item No.")
        {
            Visible = false;
        }
        modify("Automatic Ext. Texts")
        {
            Visible = false;
        }
        modify("Service Item Group")
        {
            Visible = false;
        }
        modify("Item Category Code")
        {
            Visible = false;
        }
        modify(GTIN)
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Base Unit of Measure")
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = false;
        }
        modify("Blocked")
        {
            Visible = false;
        }
        // modify("Costs & Posting")
        // {
        //     Visible = false;
        // }
        addafter("Standard Cost")
        {
            field("TVA"; rec."TVA")
            {
                ApplicationArea = All;
                Caption = 'TVA';
            }
        }
        addlast(Content)
        {
            group(ComponentsInfo)
            {
                Caption = 'Components Information';

                part(SubComponents; "Sub Components List Part")
                {
                    ApplicationArea = All;
                    SubPageLink = produit_id = FIELD("No.");
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}