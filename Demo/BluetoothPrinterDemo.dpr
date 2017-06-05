program BluetoothPrinterDemo;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Bluetooth.Printer in '..\Bluetooth.Printer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
