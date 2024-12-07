page 60102 "Manufacturing Cues"
{
    PageType = CardPart;
    SourceTable = "Manufacturing Cues";
    Caption = 'Overview';

    layout
    {
        area(Content)
        {
            cuegroup("Component Management")
            {
                Caption = 'Components';
                field("Total Components"; Rec."Total Components")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Composants List";
                    ToolTip = 'Shows the total number of components';
                }
                field("Low Stock Components"; Rec."Low Stock Components")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Composants List";
                    ToolTip = 'Shows components with stock less than 5';
                    StyleExpr = 'Unfavorable';
                }
            }
            cuegroup("Manufacturing")
            {
                Caption = 'Manufacturing Orders';
                field("Total Active Orders"; Rec."Total Active Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Ordres De Fabrication List";
                    ToolTip = 'Shows total active manufacturing orders';
                }
                field("Overdue Orders"; Rec."Overdue Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Ordres De Fabrication List";
                    ToolTip = 'Shows overdue manufacturing orders';
                    StyleExpr = 'Unfavorable';
                }
                field("Due Soon Orders"; Rec."Due Soon Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Ordres De Fabrication List";
                    ToolTip = 'Shows orders due within 2 days';
                    StyleExpr = 'Ambiguous';
                }
            }
            cuegroup("Business")
            {
                Caption = 'Business Overview';
                field("Total Customers"; Rec."Total Customers")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                    ToolTip = 'Shows total number of customers';
                }
                field("Active Customer Orders"; Rec."Active Customer Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase List";
                    ToolTip = 'Shows active customer orders';
                }
                field("Total Products"; Rec."Total Products")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Item List";
                    ToolTip = 'Shows total number of products';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                ApplicationArea = All;
                Caption = 'Refresh';
                Image = Refresh;

                trigger OnAction()
                begin
                    CueMgt.CalculateCues(Rec);
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        CueMgt.CalculateCues(Rec);
    end;

    trigger OnAfterGetRecord()
    begin
        CueMgt.CalculateCues(Rec);
    end;

    var
        CueMgt: Codeunit "Manufacturing Cues Mgt.";
}