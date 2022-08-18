unit ufrmBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmTemplateBuscar, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.Bind.Controls,
  Vcl.ExtCtrls, Vcl.Bind.Navigator,System.Generics.Collections, System.Classes;

type
  TfrmBuscarClientes = class(TfrmTemplateBuscar)
    tableTemp: TFDMemTable;
    tableTempid: TIntegerField;
    tableTempnome: TStringField;
    tableTempcidade: TStringField;
    tableTempuf: TStringField;
    procedure btnBuscarClick(Sender: TObject);
    procedure gridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarClientes: TfrmBuscarClientes;

implementation
  uses udmModule,uclasseClientes,ufrmclientes;
{$R *.dfm}

procedure TfrmBuscarClientes.btnBuscarClick(Sender: TObject);
 var clienteatual : Tclientes;
     templistacliente: TObjectList<Tclientes>;
     contador : integer;
  begin
   clienteatual:=Tclientes.Create;
   templistacliente := clienteatual.buscarCliente(edtBuscar.text,'lista');
   tableTemp.EmptyDataSet;
    for contador := 0 to (templistacliente.Count-1) do
     begin
        tableTemp.Insert;
        tableTempid.asstring := inttostr(templistacliente[contador].id);
        tableTempnome.AsString := templistacliente[contador].nome;
        tableTempcidade.AsString := templistacliente[contador].cidade;
        tableTempuf.AsString := templistacliente[contador].uf;
        tableTemp.Post;
       end;
    labEncontrados.Caption:='Encontrados : '+inttostr(templistacliente.Count);
  end;


procedure TfrmBuscarClientes.gridBuscaDblClick(Sender: TObject);
 var clienteatual : Tclientes;
     tempcliente: TObjectList<Tclientes>;
     contador : integer;
  begin
     if (tableTemp.IsEmpty) then
     exit;

     clienteatual:=Tclientes.Create;
     tempcliente := clienteatual.buscarCliente(tableTempid.asstring,'individual');
     with frmClientes do
       begin
          labIdAtual.caption:= inttostr(tempcliente.Items[0].id);
          edtNome.Text:= tempcliente[0].nome;
          edtCidade.Text:= tempcliente[0].cidade;
          edtUf.Text:= tempcliente[0].uf;
          grpPrincipal.Enabled:=true;
          AtivarBotoes(1);
       end;
       ModalResult:=mrok;
  end;

end.



