page 60001 "Composants Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Composants;
    Caption = 'Composants Card';

    layout
    {
        area(Content)
        {
            group(Group)
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
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}