report 60202 "Customer Orders Overview"
{
    DefaultLayout = RDLC;
    RDLCLayout = './specific/report/CustomerOrders.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Customer Orders Overview';

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            RequestFilterFields = "Client Name", Status;

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
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Client_Name; "Client Name")
            {
                IncludeCaption = true;
            }
            column(Client_Contact; "Client Contact")
            {
                IncludeCaption = true;
            }
            column(Client_adresse; "Client adresse")
            {
                IncludeCaption = true;
            }
            column(Status; Status)
            {
                IncludeCaption = true;
            }
            column(Document_Date; "Document Date")
            {
                IncludeCaption = true;
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
                    field(StatusFilter; StatusFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Status Filter';
                        OptionCaption = 'All,Open,Released';
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

        case StatusFilter of
            StatusFilter::Open:
                PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            StatusFilter::Released:
                PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Released);
        end;
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyName: Text[100];
        CompanyPhone: Text[30];
        StatusFilter: Option All,Open,Released;
}