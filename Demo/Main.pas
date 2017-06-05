unit Main;

interface

uses
  Bluetooth.Printer,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnImprimir: TButton;
    cbxDevice: TComboBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    FPrinter: TBluetoothPrinter;
    procedure PopularComboBoxDevices;
  public

  end;

var
  frmMain: TfrmMain;

implementation

uses
  System.Bluetooth;

{$R *.dfm}

procedure TfrmMain.PopularComboBoxDevices;
var
  Device: TBluetoothDevice;
begin
  cbxDevice.Items.BeginUpdate;
  try
    cbxDevice.Clear;
    for Device in FPrinter.PairedDevices do
      cbxDevice.Items.Add(Device.DeviceName);
  finally
    cbxDevice.Items.EndUpdate;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FPrinter := TBluetoothPrinter.Create(Self);
  FPrinter.Enabled := True;

  PopularComboBoxDevices;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FPrinter.Free;
end;

procedure TfrmMain.btnImprimirClick(Sender: TObject);
begin
  if cbxDevice.Text = '' then
    raise Exception.Create('Escolha primeiramente uma impressora da lista!');

  if Memo1.Lines.Text.Trim.IsEmpty then
    raise Exception.Create('Nenhum texto foi digitado, impossível continuar!');

  FPrinter.PrinterName := cbxDevice.Text;
  FPrinter.Imprimir(Memo1.Lines.Text);
end;

end.
