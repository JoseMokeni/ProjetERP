
page 60015 "Composants ListPart"
{
    Caption = 'Component';
    PageType = ListPart;
    SourceTable = Composants;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Composant_Id; Rec.Composant_Id)
                {
                    ApplicationArea = All;
                }
                field(Nom; Rec.Nom)
                {
                    ApplicationArea = All;
                }
                field(Stock; Rec.Stock)
                {
                    ApplicationArea = All;
                    StyleExpr = StyleTxt;
                }
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