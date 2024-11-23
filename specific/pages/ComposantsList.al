page 60000 "Composants List"
{
    Caption = 'Compomants List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Composants;
    CardPageId = "Composants Card";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Composant_Id; Rec.Composant_Id)
                {
                    ApplicationArea = All;
                    Caption = 'Composant Id';
                }
                field(Nom; Rec.Nom)
                {
                    ApplicationArea = All;
                    Caption = 'Nom';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field(Stock; Rec.Stock)
                {
                    ApplicationArea = All;
                    Caption = 'Stock';
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}