report 60201 "Manufacturing Orders Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './specific/report/ManufacturingOrders.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Manufacturing Orders Status Report';

    dataset
    {
        dataitem(OrdresFab; "Ordres De Fabrication")
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
            column(ordre_id; ordre_id)
            {
                IncludeCaption = true;
            }
            column(produit_id; produit_id)
            {
                IncludeCaption = true;
            }
            column(produit_description; produit_description)
            {
                IncludeCaption = true;
            }
            column(quantite; quantite)
            {
                IncludeCaption = true;
            }
            column(date_debut; date_debut)
            {
                IncludeCaption = true;
            }
            column(date_fin_prev; date_fin_prev)
            {
                IncludeCaption = true;
            }
            column(OrderStatus; GetOrderStatus())
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
                group(Filters)
                {
                    Caption = 'Filters';
                    field(ShowOverdue; ShowOverdue)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Only Overdue';
                        ToolTip = 'Specifies if you want to see only overdue orders';
                    }
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
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

        if ShowOverdue then
            OrdresFab.SetFilter(date_fin_prev, '..%1', WorkDate());

        if StartDate <> 0D then
            OrdresFab.SetFilter(date_debut, '%1..', StartDate);
        if EndDate <> 0D then
            OrdresFab.SetFilter(date_fin_prev, '..%1', EndDate);
    end;

    local procedure GetOrderStatus(): Text
    begin
        if OrdresFab.date_fin_prev < WorkDate() then
            exit('Overdue');
        if OrdresFab.date_fin_prev <= CalcDate('<+2D>', WorkDate()) then
            exit('Due Soon');
        exit('On Track');
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyName: Text[100];
        CompanyPhone: Text[30];
        ShowOverdue: Boolean;
        StartDate: Date;
        EndDate: Date;
}