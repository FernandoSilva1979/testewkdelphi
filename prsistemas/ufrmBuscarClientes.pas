unit ufrmBuscarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmTemplateBuscar, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Data.Bind.Controls,
  Vcl.ExtCtrls, Vcl.Bind.Navigator,System.Generics.Collections, System.Classes,
  Data.Win.ADODB;

type
  TfrmBuscarClientes = class(TfrmTemplateBuscar)
    tableTemp: TFDMemTable;
    tableTempid: TIntegerField;
    tableTempnome: TStringField;
    tableTempcep: TStringField;
    tableTempendereco: TStringField;
    tableTempbairro: TStringField;
    tableTempcidade: TStringField;
    tableTempuf: TStringField;
    tableTempnro: TIntegerField;
    ADOQuery1: TADOQuery;
    btnRelatorio: TBitBtn;
    tableTemprg: TStringField;
    tableTempcpf: TStringField;
    tableTemppai: TStringField;
    tableTempmae: TStringField;
    procedure btnBuscarClick(Sender: TObject);
    procedure gridBuscaDblClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarClientes: TfrmBuscarClientes;

implementation
  uses udmModule,uclasseClientes,ufrmclientes, ufrmListagem;
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
        tableTemprg.AsString := templistacliente[contador].rg;
        tableTempcpf.AsString := templistacliente[contador].cpf;
        tableTemppai.AsString := templistacliente[contador].nomepai;
        tableTempmae.AsString := templistacliente[contador].nomemae;
        tableTempcep.AsString := inttostr(templistacliente[contador].cep);
        tableTempendereco.AsString := templistacliente[contador].endereco;
        tableTempnro.AsString := inttostr(templistacliente[contador].nro);
        tableTempbairro.AsString := templistacliente[contador].bairro;
        tableTempcidade.AsString := templistacliente[contador].cidade;
        tableTempuf.AsString := templistacliente[contador].uf;
        tableTemp.Post;
       end;
    labEncontrados.Caption:='Encontrados : '+inttostr(templistacliente.Count);
  end;


procedure TfrmBuscarClientes.btnRelatorioClick(Sender: TObject);
begin
    try
       frmListagem := TfrmListagem.Create(Self);    //  formes criados e destruidos em tempo de execaucao
       frmListagem.quickrep1.preview;
    finally
      freeandnil(frmListagem)
    end;
end;

procedure TfrmBuscarClientes.gridBuscaDblClick(Sender: TObject);
 var clienteatual : Tclientes;
     tempcliente: TObjectList<Tclientes>;
     contador : integer;
  begin
   clienteatual:=Tclientes.Create;
   tempcliente := clienteatual.buscarCliente(tableTempid.asstring,'individual');
   with frmClientes do
     begin
        labCodigoAtual.caption:= inttostr(tempcliente.Items[0].id);
        edtNome.Text:= tempcliente[0].nome;
        edtCpf.Text:= tempcliente[0].cpf;
        edtRg.Text:= tempcliente[0].rg;
        edtMae.Text:= tempcliente[0].nomemae;
        edtPai.Text:= tempcliente[0].nomepai;
        edtCep.Text:= formatfloat('#####-###',tempcliente[0].cep);
        edtEndereco.Text:= tempcliente[0].endereco;
        edtNro.Text:= inttostr(tempcliente[0].nro);
        edtBairro.Text:= tempcliente[0].bairro;
        edtCidade.Text:= tempcliente[0].cidade;
        edtUf.Text:= tempcliente[0].uf;
        grpPrincipal.Enabled:=true;
        AtivarBotoes(1);
     end;
     ModalResult:=mrok;
  end;

end.



