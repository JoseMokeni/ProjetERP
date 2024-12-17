page 60000 "Composants List"
{
    Caption = 'Component List';
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
                    Caption = 'Component Id';
                }
                field(Nom; Rec.Nom)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
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
                    StyleExpr = StyleTxt;
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

    var
        StyleTxt: Text;

    trigger OnAfterGetRecord()
    begin
        StyleTxt := SetStockStyle();
    end;

    local procedure SetStockStyle(): Text
    begin
        if Rec.Stock < 5 then
            exit('Unfavorable');
        exit('Favorable');
    end;
}