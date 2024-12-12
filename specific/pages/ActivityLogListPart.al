
page 60105 "Activity Log ListPart"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Activity Log Setup";
    Caption = 'Activity Log';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Table Name"; Rec."Table Name")
                {
                    ApplicationArea = All;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Date Time"; Rec."Date Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}