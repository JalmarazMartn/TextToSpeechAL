function TextToSpeech(InputText)
{
    var utterance  = new SpeechSynthesisUtterance();
    utterance.text = InputText;
    speechSynthesis.speak(utterance);
}