// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ALProject1;

using Microsoft.Sales.Customer;


codeunit 50101 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeValidateVATRegistrationNo', '', true, true)]
    local procedure MySillyFix(var Customer: Record Customer; xCustomer: Record Customer; var IsHandled: Boolean)
    begin
        if (Customer."VAT Registration No." <> xCustomer."VAT Registration No.") then begin
            Customer.VATRegistrationValidation();
            IsHandled := true;
        end;
    end;
}
