page 60100 "Manufacturing Role Center"
{
    PageType = RoleCenter;
    Caption = 'Manufacturing Management';

    layout
    {
        area(RoleCenter)
        {
            part(CuesPart; "Manufacturing Cues")
            {
                ApplicationArea = All;
            }
            group(Group1)
            {
                systempart(Control1; MyNotes)
                {
                    ApplicationArea = All;
                }
            }
            group(Lists)
            {
                part(ManufOrderList; "Ordres De Fabrication ListPart")
                {
                    ApplicationArea = All;
                    Caption = 'Manufacturing Orders';
                }
                part(ComponentsList; "Composants ListPart")
                {
                    ApplicationArea = All;
                    Caption = 'Components';
                }
                part(CustomersList; "Customer List")
                {
                    ApplicationArea = All;
                    Caption = 'Customers';
                }
                part(ProductsList; "Item List")
                {
                    ApplicationArea = All;
                    Caption = 'Products';
                }
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(ManufacturingOrders)
            {
                ApplicationArea = All;
                Caption = 'Manufacturing Orders';
                RunObject = Page "Ordres De Fabrication List";
            }
            action(Components)
            {
                ApplicationArea = All;
                Caption = 'Components';
                RunObject = Page "Composants List";
            }
            action(Products)
            {
                ApplicationArea = All;
                Caption = 'Products';
                RunObject = Page "Item List";
            }
            action(Customers)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                RunObject = Page "Customer List";
            }
            action(CustomerOrders)
            {
                ApplicationArea = All;
                Caption = 'Customer Orders';
                RunObject = Page "Purchase List";
            }
        }
        area(Sections)
        {
            group(Setup)
            {
                Caption = 'Setup';
                action(ActivityLog)
                {
                    ApplicationArea = All;
                    Caption = 'Activity Log';
                    RunObject = Page "Activity Log";
                }
            }
        }
    }
}