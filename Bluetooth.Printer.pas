unit Bluetooth.Printer;

interface

uses
  System.SysUtils, System.Bluetooth, System.Bluetooth.Components;

type
  EBluetoothPrinter = class(Exception);

  TBluetoothPrinter = class(TBluetooth)
  private
    FSocket: TBluetoothSocket;
    FPrinterName: String;
    function ConectarImpressora(ANomeDevice: String): Boolean;
    function GetDeviceByName(ANomeDevice: String): TBluetoothDevice;
  public
    procedure Imprimir(const ATexto: String);
  published
    property PrinterName: String read FPrinterName write FPrinterName;
  end;

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';

implementation

function TBluetoothPrinter.GetDeviceByName(ANomeDevice: String): TBluetoothDevice;
var
  lDevice: TBluetoothDevice;
begin
  Result := nil;
  for lDevice in Self.PairedDevices do
  begin
    if lDevice.DeviceName = ANomeDevice then
      Result := lDevice;
  end;
end;

function TBluetoothPrinter.ConectarImpressora(ANomeDevice: String): Boolean;
var
  lDevice: TBluetoothDevice;
begin
  lDevice := GetDeviceByName(ANomeDevice);
  if lDevice <> nil then
  begin
    FSocket := lDevice.CreateClientSocket(StringToGUID(UUID), False);
    if FSocket <> nil then
    begin
      FSocket.Connect;
      Result := FSocket.Connected
    end
    else
      raise EBluetoothPrinter.Create('Ocorreu um erro ao obter socket de conexão bluetooth.');
  end
  else
    raise EBluetoothPrinter.CreateFmt('Impressora "%s" não encontrada ou não pareada.', [ANomeDevice]);
end;

procedure TBluetoothPrinter.Imprimir(const ATexto: String);
begin
  if ConectarImpressora(Self.PrinterName) then
  begin
    try
      FSocket.SendData(TEncoding.UTF8.GetBytes(ATexto));
    finally
      FSocket.Close;
    end;
  end
  else
    raise EBluetoothPrinter.Create('Não foi possível conectar a impressora.');
end;

end.
