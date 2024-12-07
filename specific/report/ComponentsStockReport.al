report 60200 "Components Stock Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './specific/report/ComponentsStock.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Components Stock Report';

    dataset
    {
        dataitem(Composant; Composants)
        {
            column(CompanyName; CompanyName)
            {
            }
            column(CompanyPhone; CompanyPhone)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(ReportDate; WorkDate)
            {
            }
            column(Composant_Id; Composant_Id)
            {
                IncludeCaption = true;
            }
            column(Nom; Nom)
            {
                IncludeCaption = true;
            }
            column(Type; Type)
            {
                IncludeCaption = true;
            }
            column(Stock; Stock)
            {
                IncludeCaption = true;
            }
            column(StockStatus; GetStockStatus())
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowLowStock; ShowLowStock)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Only Low Stock';
                        ToolTip = 'Specifies if you want to see only components with stock less than 5';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        CompanyName := CompanyInformation.Name;
        CompanyInformation.CalcFields(Picture);
        CompanyPhone := CompanyInformation."Phone No.";

        if ShowLowStock then
            Composant.SetFilter(Stock, '<5');
    end;

    local procedure GetStockStatus(): Text
    begin
        if Composant.Stock < 5 then
            exit('Low Stock');
        exit('In Stock');
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyName: Text[100];
        CompanyPhone: Text[30];
        ShowLowStock: Boolean;
}