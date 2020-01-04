pageextension 69000 "Voice Assembly Order" extends "Assembly Order"
{
    layout
    {
        addlast(Control2)
        {
            field(CommentSpeech; 'Tell me the instructions!!')
            {
                Caption = 'Comment to speech';
                ShowCaption = false;
                ApplicationArea = All;
                Visible = true;
                trigger OnDrillDown()
                begin
                    InstructionsSpeech();
                end;
            }
            usercontrol(TextToSpeech; TextToSpeech)
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Record "Assembly Header";

    procedure InstructionsSpeech()
    var
        AssemblyComment: Record "Assembly Comment Line";
    begin
        Assemblycomment.SetRange("Document Type", "Document Type");
        AssemblyComment.SetRange("Document No.", "No.");
        if not AssemblyComment.FindSet() then
            exit;
        repeat
            CurrPage.TextToSpeech.TextToSpeech(AssemblyComment.Comment);
        until AssemblyComment.next = 0;
    end;

}